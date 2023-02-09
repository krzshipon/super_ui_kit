import 'package:flutter/material.dart';
import 'package:super_ui_kit/super_ui_kit.dart';

import '../../../data/app_constants.dart';
import '../controllers/note_add_controller.dart';

class NoteAddView extends GetView<NoteAddController> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 100),
      children: [
        verticalSpaceLarge,
        CSText(
          "Add Note",
          textType: TextType.headline,
        ),
        verticalSpaceRegular,
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            CSText('Verified'),
            Obx(() => Switch(
                  value: controller.verified.value,
                  onChanged: (value) => controller.verified.toggle(),
                )),
          ],
        ),
        verticalSpaceRegular,
        CSInputField(
          controller: controller.tcTitle,
          placeholder: 'Note Title',
          maxLines: 1,
        ),
        verticalSpaceRegular,
        CSInputField(
          controller: controller.tcDesc,
          placeholder: 'Note Description',
          maxLines: 4,
        ),
        verticalSpaceRegular,
        Obx(
          () => CSDropDown(
            header: 'selectSub'.tr,
            editable: controller.dropDownSelectionSub.value == kOtherSelection,
            editingController: controller.tcSubject,
            items: controller.subjectsTitles.toList(),
            onchanged: (result) => controller.onSubChanged(result),
            value: controller.dropDownSelectionSub.value,
          ),
        ),
        verticalSpaceRegular,
        Obx(
          () => CSDropDown(
            header: 'selectTopic'.tr,
            editable:
                controller.dropDownSelectionTopic.value == kOtherSelection,
            editingController: controller.tcTopic,
            items: controller.topicsTitle.toList(),
            onchanged: (result) => controller.onTopicChanged(result),
            value: controller.dropDownSelectionTopic.value,
          ),
        ),
        verticalSpaceRegular,
        CSInputField(
          controller: controller.tcSrc,
          placeholder: 'Src',
          maxLines: 1,
        ),
        verticalSpaceRegular,
        CSInputField(
          controller: controller.tcCreditSrc,
          placeholder: 'Credit Src',
          maxLines: 1,
        ),
        verticalSpaceRegular,
        CSInputField(
          controller: controller.tcCoverAnim,
          placeholder: 'Cover Animation Src',
          maxLines: 1,
        ),
        verticalSpaceRegular,
        CSInputField(
          controller: controller.tcCoverAnim,
          placeholder: 'Preview Src List (Separate by comma)',
          maxLines: 1,
        ),
        Obx(
          () => CSText(
            controller.error.value,
            color: Get.theme.colorScheme.error,
          ),
        ),
        verticalSpaceLarge,
        CSButton(title: 'Submit', onTap: () => controller.saveNote()),
        verticalSpaceLarge
      ],
    );
  }
}
