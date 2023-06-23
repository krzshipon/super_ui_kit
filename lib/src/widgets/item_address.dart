// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../models/address.dart';
import '../shared/app_ui_helpers.dart';
import 'app_buttons.dart';
import 'app_cards.dart';
import 'app_text.dart';

const kAddressCardItemCornerRadius = 10.0;
const kAddressCardItemsPaddingV = 10.0;
const kAddressCardItemHeaderHeight = 35.0;

class AddressItem extends GetView {
  final cornerRadius = 10.0;

  final CsAddress address;
  final Function()? onTap;
  final Function()? onDefaultIconTap;
  final Function()? onEditIconTap;

  const AddressItem(
    this.address, {
    super.key,
    this.onTap,
    this.onDefaultIconTap,
    this.onEditIconTap,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Expanded(
              child: CSCard(
                onTap: onTap,
                radius: cornerRadius,
                padding: EdgeInsets.zero,
                cardType: CSCardType.item,
                childrens: [
                  SizedBox(
                    width: double.infinity,
                    height: kAddressCardItemHeaderHeight,
                    child: DecoratedBox(
                      decoration:
                          BoxDecoration(color: Get.theme.colorScheme.primary),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: kAddressCardItemsPaddingV),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: CSIconButton(
                                  icon: (address.isDefault ?? false)
                                      ? Icons.check_circle_outline_rounded
                                      : null,
                                  onTap: onDefaultIconTap,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 8,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: kAddressCardItemsPaddingV),
                              child: Align(
                                alignment: Alignment.center,
                                child: CSText.headline(
                                  address.label ?? '',
                                  color: Get.theme.colorScheme.onPrimary,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: CSIconButton(
                              icon: Icons.add_location_alt_outlined,
                              onTap: onEditIconTap,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  verticalSpaceSmall,
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: kAddressCardItemsPaddingV),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: CSText("address_label_name".tr),
                        ),
                        Expanded(
                          flex: 2,
                          child: CSText(address.name ?? ""),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: kAddressCardItemsPaddingV),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: CSText("address_label_mobile".tr),
                        ),
                        Expanded(
                          flex: 2,
                          child: CSText(address.mobile ?? ''),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: kAddressCardItemsPaddingV),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: CSText("address_label_division".tr),
                        ),
                        Expanded(
                          flex: 2,
                          child: CSText(address.division ?? ""),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: kAddressCardItemsPaddingV),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: CSText("address_label_city".tr),
                        ),
                        Expanded(
                          flex: 2,
                          child: CSText(address.city ?? ""),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: kAddressCardItemsPaddingV),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: CSText("address_label_area".tr),
                        ),
                        Expanded(
                          flex: 2,
                          child: CSText(address.area ?? ""),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: kAddressCardItemsPaddingV),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: CSText("address_label_addressLine".tr),
                        ),
                        Expanded(
                          flex: 2,
                          child: CSText(address.addressLine ?? ""),
                        ),
                      ],
                    ),
                  ),
                  verticalSpaceSmall,
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
