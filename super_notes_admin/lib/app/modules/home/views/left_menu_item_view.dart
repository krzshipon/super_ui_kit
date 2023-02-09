import 'package:flutter/material.dart';
import 'package:super_notes_admin/app/modules/home/controllers/home_controller.dart';
import 'package:super_ui_kit/super_ui_kit.dart';

const lMenuIcSize = 40.0;

enum MenuType { home, add, modify, search, other }

class LeftMenuItemView extends GetView<HomeController> {
  final MenuType menuType;
  final String? assetIcon;
  final IconData? iconData;
  final String title;
  final Function()? onClick;

  LeftMenuItemView(this.menuType,
      {this.onClick, this.assetIcon, this.iconData, this.title = ''});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: onClick,
      enableFeedback: true,
      highlightColor: Colors.transparent,
      onHover: (value) => controller.leftMenuHighLightChange(menuType, value),
      child: Obx(
        () => Transform.scale(
          scale:
              (controller.currentHoveredMenuItem.value == menuType) ? 1.3 : 1.0,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (iconData != null || assetIcon != null)
                (iconData != null)
                    ? Icon(
                        iconData,
                        size: lMenuIcSize,
                      )
                    : Image.asset(
                        assetIcon!,
                        width: (menuType == MenuType.home)? lMenuIcSize + 10 : lMenuIcSize,
                        height: (menuType == MenuType.home)? lMenuIcSize + 10 : lMenuIcSize,
                        fit: BoxFit.scaleDown,
                      ),
              if (iconData != null || assetIcon != null) verticalSpaceTiny,
              CSText(
                title,
                style: Get.textTheme.bodySmall
                    ?.copyWith(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}
