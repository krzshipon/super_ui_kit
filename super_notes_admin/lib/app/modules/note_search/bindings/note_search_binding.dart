import 'package:get/get.dart';

import '../controllers/note_search_controller.dart';

class NoteSearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NoteSearchController>(
      () => NoteSearchController(),
    );
  }
}
