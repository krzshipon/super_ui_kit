import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:super_notes_admin/app/modules/home/note_model.dart';
import 'package:super_ui_kit/super_ui_kit.dart';

class DashboardController extends GetxController {
  final hoverIndex = (-1).obs;
  final hoverEnabled = true.obs;
  final notes = <Note>[
    Note.fromJson({
      "id": "13421534325nsdf32zcvs",
      "subjectId": "13421534325nsdf32zcvs",
      "lessonId": "13421534325nsdf32zcvs",
      "title": "Dart cheat sheet",
      "desc": "Take a look at the quick guide of dart programming languages.",
      "author": "John Doe",
      "creditSrc": "",
      "coverAnimSrc":
          "https://assets4.lottiefiles.com/private_files/lf30_rg5wrsf4.json",
      "src":
          "https://github.com/krzshipon/super_notes/blob/dev/assets/files/info_technology.pdf",
      "previewSrcList": ["", ""],
      "likeCount": 5000,
      "createDate": Timestamp.now(),
      "updateDate": Timestamp.now(),
      "verified": true,
      "isFav": false
    }),
    Note.fromJson({
      "id": "13421534325nsdf32zcvs",
      "subjectId": "13421534325nsdf32zcvs",
      "lessonId": "13421534325nsdf32zcvs",
      "title": "Dart cheat sheet",
      "desc": "Take a look at the quick guide of dart programming languages.",
      "author": "John Doe",
      "creditSrc": "",
      "coverAnimSrc":
          "https://assets4.lottiefiles.com/private_files/lf30_rg5wrsf4.json",
      "src":
          "https://github.com/krzshipon/super_notes/blob/dev/assets/files/info_technology.pdf",
      "previewSrcList": ["", ""],
      "likeCount": 5000,
      "createDate": Timestamp.now(),
      "updateDate": Timestamp.now(),
      "verified": true,
      "isFav": false
    }),
    Note.fromJson({
      "id": "13421534325nsdf32zcvs",
      "subjectId": "13421534325nsdf32zcvs",
      "lessonId": "13421534325nsdf32zcvs",
      "title": "Dart cheat sheet",
      "desc": "Take a look at the quick guide of dart programming languages.",
      "author": "John Doe",
      "creditSrc": "",
      "coverAnimSrc":
          "https://assets4.lottiefiles.com/private_files/lf30_rg5wrsf4.json",
      "src":
          "https://github.com/krzshipon/super_notes/blob/dev/assets/files/info_technology.pdf",
      "previewSrcList": ["", ""],
      "likeCount": 5000,
      "createDate": Timestamp.now(),
      "updateDate": Timestamp.now(),
      "verified": true,
      "isFav": false
    }),
    Note.fromJson({
      "id": "13421534325nsdf32zcvs",
      "subjectId": "13421534325nsdf32zcvs",
      "lessonId": "13421534325nsdf32zcvs",
      "title": "Dart cheat sheet",
      "desc": "Take a look at the quick guide of dart programming languages.",
      "author": "John Doe",
      "creditSrc": "",
      "coverAnimSrc":
          "https://assets4.lottiefiles.com/private_files/lf30_rg5wrsf4.json",
      "src":
          "https://github.com/krzshipon/super_notes/blob/dev/assets/files/info_technology.pdf",
      "previewSrcList": ["", ""],
      "likeCount": 5000,
      "createDate": Timestamp.now(),
      "updateDate": Timestamp.now(),
      "verified": true,
      "isFav": false
    })
  ].obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  onHover(int index, bool value) {
    if (value) {
      hoverIndex.value = index;
    } else {
      hoverIndex.value = -1;
    }
  }

  onTap(int index) {}
}
