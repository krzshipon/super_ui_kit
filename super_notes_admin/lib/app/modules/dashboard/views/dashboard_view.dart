import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:super_notes_admin/app/modules/dashboard/views/note_card_view.dart';
import 'package:super_ui_kit/super_ui_kit.dart';

import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  @override
  Widget build(BuildContext context) {
    return Listener(
        onPointerSignal: (event) {
          if (event is PointerScrollEvent) {
            controller.hoverEnabled.value = false;
          }
        },
        onPointerHover: (event) {
          controller.hoverEnabled.value = true;
          printInfo(info: "onPointerSignal");
        },
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 100),
          children: [
            verticalSpaceLarge,
            CSText.headline('Recent Notes'),
            DynamicHeightGridView(
                shrinkWrap: true,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                builder: ((context, index) => Obx(
                      (() => Transform.scale(
                            scale: controller.hoverIndex.value == index
                                ? 1.05
                                : 1.0,
                            child: NoteCardView(
                              controller.notes[index % 4],
                              ontap: () {},
                              onHover: (p0) {
                                if (controller.hoverEnabled.isTrue) {
                                  controller.onHover(index, p0);
                                }
                              },
                            ),
                          )),
                    )),
                itemCount: 100,
                crossAxisCount: MediaQuery.of(context).size.width > 800
                    ? MediaQuery.of(context).size.width > 1024
                        ? MediaQuery.of(context).size.width > 1440
                            ? 4
                            : 3
                        : 2
                    : 1)
          ],
        ));
  }
}
