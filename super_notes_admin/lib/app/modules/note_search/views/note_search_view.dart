import 'package:flutter/material.dart';
import 'package:super_ui_kit/super_ui_kit.dart';

import '../controllers/note_search_controller.dart';

class NoteSearchView extends GetView<NoteSearchController> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 100),
      children: [
        verticalSpaceLarge,
        CSText("Search")
      ],
    );
  }
}
