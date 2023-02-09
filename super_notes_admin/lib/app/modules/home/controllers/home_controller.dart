import 'package:super_notes_admin/app/modules/home/views/left_menu_item_view.dart';
import 'package:super_ui_kit/super_ui_kit.dart';

class HomeController extends GetxController {
  final currentHoveredMenuItem = MenuType.other.obs;
  final currentSelectedMenuItem = MenuType.home.obs;

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

  leftMenuHighLightChange(MenuType menuType, bool value) {
    if (value) {
      currentHoveredMenuItem.value = menuType;
    } else {
      currentHoveredMenuItem.value = MenuType.other;
    }
  }

  changeScreenSelection(MenuType menuType) {
    currentSelectedMenuItem.value = menuType;
  }
}
