import 'package:super_notes_admin/app/modules/home/bindings/home_binding.dart';
import 'package:super_notes_admin/app/modules/home/views/home_view.dart';
import 'package:super_ui_kit/super_ui_kit.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
  ];
}
