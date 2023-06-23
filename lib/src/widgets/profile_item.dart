import 'package:flutter/material.dart';
import 'package:super_ui_kit/super_ui_kit.dart';

class ProfileItem extends GetView {
  final cornerRadius = 10.0;

  final String? header;
  final IconData iconData;
  final String title;
  final Function()? onTap;

  const ProfileItem(
      {super.key,
      required this.iconData,
      required this.title,
      this.header,
      this.onTap});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (header != null)
          Padding(
              padding: EdgeInsets.only(left: kmCardMarginS + cornerRadius),
              child: CSText.label(header!)),
        Row(children: [
          Expanded(
            child: CSCard(
              onTap: onTap,
              radius: cornerRadius,
              margin: (header != null)
                  ? const EdgeInsets.only(
                      top: 3,
                      left: kmCardMarginS,
                      right: kmCardMarginS,
                      bottom: kmCardMarginS)
                  : null,
              padding: EdgeInsets.symmetric(
                  vertical: kpCardPaddingS, horizontal: cornerRadius),
              cardType: CSCardType.item,
              childrens: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Icon(
                            iconData,
                            color: Get.theme.colorScheme.primary,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 8,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(title),
                        ),
                      ),
                    ),
                    Expanded(
                        flex: 1,
                        child: Icon(
                          null,
                          color: Get.theme.colorScheme.primary,
                        ))
                  ],
                ),
              ],
            ),
          ),
        ]),
      ],
    );
  }
}
