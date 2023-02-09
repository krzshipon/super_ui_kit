import 'package:flutter/material.dart';
import 'package:super_notes_admin/app/data/assets/asset_key.dart';
import 'package:super_notes_admin/app/modules/dashboard/views/dashboard_view.dart';
import 'package:super_notes_admin/app/modules/home/views/left_menu_item_view.dart';
import 'package:super_notes_admin/app/modules/note_add/views/note_add_view.dart';
import 'package:super_notes_admin/app/modules/note_modify/views/note_modify_view.dart';
import 'package:super_notes_admin/app/modules/note_search/views/note_search_view.dart';

import 'package:super_ui_kit/super_ui_kit.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return CSHomeWidget(
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: ListView(
                  children: [
                    verticalSpaceLarge,
                    verticalSpaceLarge,
                    LeftMenuItemView(
                      MenuType.home,
                      assetIcon: appIcon,
                      title: 'Super Notes',
                      onClick: () =>
                          controller.changeScreenSelection(MenuType.home),
                    ),
                    verticalSpaceMedium,
                    LeftMenuItemView(
                      MenuType.add,
                      iconData: Icons.note_add_sharp,
                      title: 'Add Note',
                      onClick: () =>
                          controller.changeScreenSelection(MenuType.add),
                    ),
                    verticalSpaceMedium,
                    LeftMenuItemView(
                      MenuType.modify,
                      iconData: Icons.edit_sharp,
                      title: 'Modify Note',
                      onClick: () =>
                          controller.changeScreenSelection(MenuType.modify),
                    ),
                    verticalSpaceMedium,
                    LeftMenuItemView(
                      MenuType.search,
                      iconData: Icons.search_sharp,
                      title: 'Search Note',
                      onClick: () =>
                          controller.changeScreenSelection(MenuType.search),
                    ),
                    verticalSpaceMedium,
                    verticalSpaceLarge,
                  ],
                )),
          ),
          VerticalDivider(
            thickness: 3,
          ),
          Expanded(
            flex: 10,
            child: Obx(
                () => _updateView(controller.currentSelectedMenuItem.value)),
          ),
        ],
      ),
    );
  }

  Widget _updateView(MenuType currentSelectedMenuItem) {
    Widget screen = DashboardView();
    switch (currentSelectedMenuItem) {
      case MenuType.home:
        screen = DashboardView();
        break;
      case MenuType.add:
        screen = NoteAddView();
        break;
      case MenuType.modify:
        screen = NoteModifyView();
        break;
      case MenuType.search:
        screen = NoteSearchView();
        break;
      case MenuType.other:
        screen = DashboardView();
        break;
    }
    return screen;
  }
}
