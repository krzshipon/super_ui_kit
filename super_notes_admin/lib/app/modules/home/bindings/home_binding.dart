import 'package:super_ui_kit/super_ui_kit.dart';

import '../../dashboard/controllers/dashboard_controller.dart';
import '../../note_add/controllers/note_add_controller.dart';
import '../../note_modify/controllers/note_modify_controller.dart';
import '../../note_search/controllers/note_search_controller.dart';
import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<DashboardController>(
      () => DashboardController(),
    );
    Get.lazyPut<NoteAddController>(
      () => NoteAddController(),
    );
    Get.lazyPut<NoteModifyController>(
      () => NoteModifyController(),
    );
    Get.lazyPut<NoteSearchController>(
      () => NoteSearchController(),
    );
  }
}
