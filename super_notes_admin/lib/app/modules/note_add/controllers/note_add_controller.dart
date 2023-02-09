import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:super_ui_kit/super_ui_kit.dart';

import '../../../data/app_constants.dart';
import '../../../data/app_data_keys.dart';
import '../../../data/models/subject_model.dart';
import '../../home/lesson_model.dart';

class NoteAddController extends GetxController {
  var tcTitle = TextEditingController();
  var tcDesc = TextEditingController();
  var tcAuthor = TextEditingController();
  var tcSrc = TextEditingController();
  var tcCreditSrc = TextEditingController();
  var tcCoverAnim = TextEditingController();
  var tcPreviewList = TextEditingController();
  var tcSubject = TextEditingController();
  final tcTopic = TextEditingController();

  var verified = true.obs;

  final dropDownSelectionTopic = ''.obs;
  final selectedTopic = ''.obs;
  final dropDownSelectionSub = ''.obs;
  final selectedSub = ''.obs;
  final subjectsTitles = <String>[].obs;
  final topicsTitle = <String>[].obs;
  var subjects = <Subject>[];

  final error = ''.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    tcSubject.addListener(() {
      selectedSub.value = tcSubject.text;
    });

    tcTopic.addListener(() {
      selectedTopic.value = tcTopic.text;
    });

    getSubjects();
  }

  @override
  void onClose() {
    tcTitle.dispose();
    tcDesc.dispose();
    tcAuthor.dispose();
    tcCoverAnim.dispose();
    tcCreditSrc.dispose();
    tcPreviewList.dispose();
    tcSrc.dispose();
    tcTopic.dispose();
    tcSubject.dispose();
  }

  onSubChanged(String? result) {
    printInfo(info: 'Subj selection changed: $result');
    dropDownSelectionSub.value = result ?? '';
    dropDownSelectionTopic.value = '';
    if (result == null || result.isEmpty || result == kSelectionInstruction) {
      //selectedTopic.value = '';
      return;
    }
    if (result == kOtherSelection) {
      //selectedTopic.value = subjectEditingController.text;
      //topicsTitle.value = [];
      return;
    }
    selectedSub.value = result;
    //var subId = subjects.firstWhereOrNull((element) => element.title == result);
    // if (subId?.title?.isNotEmpty ?? false) {
    //   getLessons(subId?.id ?? '');
    // }
  }

  onTopicChanged(String? result) {
    printInfo(info: 'Topic selection changed: $result');
    dropDownSelectionTopic.value = result ?? '';
    if (result == null || result.isEmpty || result == kSelectionInstruction) {
      selectedTopic.value = '';
      return;
    }
    if (result == kOtherSelection) {
      selectedTopic.value = tcTopic.text;
      return;
    }
    selectedTopic.value = result;
  }

  void getSubjects() {
    Get.showLoader();
    selectedSub.value = '';
    dropDownSelectionSub.value = '';
    subjectsTitles.clear();
    subjects.clear();
    var subjectRef = FirebaseFirestore.instance
        .collection(dkSubjects)
        .withConverter<Subject>(
            fromFirestore: ((snapshot, options) =>
                Subject.fromJson(snapshot.data()!)),
            toFirestore: (obj, _) => obj.toJson());

    subjectRef.get().then((value) async {
      if (value.docs.isNotEmpty) {
        var subjectList = <Subject>[];
        subjectList = value.docs.map((e) => e.data()).toList();
        if (subjectList.isNotEmpty) {
          subjectList.sort((a, b) => a.title?.compareTo(b.title ?? '') ?? 9999);
          subjects = subjectList;
          var subjectTitles = subjectList.map((e) => e.title ?? '').toList();
          subjectTitles.removeWhere((element) => element.isEmpty);
          subjectsTitles.assignAll(subjectTitles.toList());
          printInfo(info: "from server: ${subjectTitles.toString()}");
        }
        Get.hideLoader();
      } else {
        selectedSub.value = '';
        dropDownSelectionSub.value = '';
        subjects.clear();
        subjectsTitles.clear();
      }
    }).catchError((e) {
      Get.hideLoader();
      Get.showErrorDialog(e.toString());
    });
  }

  void getLessons(String subId) {
    if (subId.isEmpty) {
      return;
    }

    Get.showLoader();
    selectedTopic.value = '';
    topicsTitle.clear();

    var lessonRef = FirebaseFirestore.instance
        .collection(dkLessons)
        .withConverter<Lesson>(
            fromFirestore: ((snapshot, options) =>
                Lesson.fromJson(snapshot.data()!)),
            toFirestore: (obj, _) => obj.toJson())
        .where('subjectId', isEqualTo: subId);

    lessonRef.get().then((value) async {
      if (value.docs.isNotEmpty) {
        var lessonList = <Lesson>[];
        lessonList = value.docs.map((e) => e.data()).toList();
        if (lessonList.isNotEmpty) {
          var topicsTitles = lessonList.map((e) => e.title ?? '').toList();
          topicsTitles.removeWhere((element) => element.isEmpty);
          topicsTitle.value = topicsTitles;
          printInfo(info: "from server: ${topicsTitles.toString()}");
        }
      } else {
        selectedTopic.value = '';
        topicsTitle.clear();
      }
      Get.hideLoader();
    }).catchError((e) {
      Get.hideLoader();
      Get.showErrorDialog(e.toString());
    });
  }

  saveNote() async {
    error.value = '';
    if (tcTitle.text.isEmpty) {
      error.value = 'titleError'.tr;
      return;
    }

    if (tcDesc.text.isEmpty) {
      error.value = 'dscError'.tr;
      return;
    }

    if (tcSrc.text.isEmpty) {
      error.value = 'srcError'.tr;
      return;
    }
    if (selectedSub.isEmpty) {
      error.value = 'subSelectionNeeded'.tr;
      return;
    }
    if (selectedTopic.isEmpty) {
      error.value = 'topicSelectionNeeded'.tr;
      return;
    }

    // if (FirebaseAuth.instance.currentUser == null) {
    //   // Get.showErrorDialog(
    //   //   'needLogin'.tr,
    //   //   onConfirm: () async {
    //   //     Get.back();
    //   //     Get.toNamed(Routes.SIGNIN);
    //   //   },
    //   // );
    // } else {
    //   Get.showLoader();
    //   var noteReq = NoteReq(
    //       userId: FirebaseAuth.instance.currentUser?.uid ?? '',
    //       desc: noteDescEditingController.text,
    //       subject: subjectEditingController.text,
    //       topic: topicEditingController.text);

    //   noteReq.createDate = FieldValue.serverTimestamp();
    //   noteReq.updateDate = FieldValue.serverTimestamp();

    //   await noteReqRef.add(noteReq).then((value) {
    //     value.get().then((value) {
    //       Get.hideLoader();
    //       var noteReqResponse = value.data();
    //       if (noteReqResponse != null) {
    //         noteReqResponse.id = value.id;
    //         value.printInfo(info: noteReqResponse.toJson().toString());
    //         Get.back();
    //         Get.showDialog(
    //           'noteReqSuccess'.tr,
    //           onConfirm: () {
    //             Get.back();
    //           },
    //         );
    //       } else {
    //         Get.showErrorDialog('errUnknown'.tr);
    //       }
    //     }).catchError((e) {
    //       Get.hideLoader();
    //       Get.showErrorDialog(e.toString());
    //     });
    //   });
    // }
  }
}
