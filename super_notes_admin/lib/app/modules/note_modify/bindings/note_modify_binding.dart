import 'package:get/get.dart';

import '../controllers/note_modify_controller.dart';

class NoteModifyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NoteModifyController>(
      () => NoteModifyController(),
    );
  }
}
