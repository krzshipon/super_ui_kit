import 'package:flutter/material.dart';

import 'package:super_ui_kit/super_ui_kit.dart';

import '../controllers/note_modify_controller.dart';

class NoteModifyView extends GetView<NoteModifyController> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 100),
      children: [
        verticalSpaceLarge,
        CSText("Modify")
      ],
    );
  }
}
