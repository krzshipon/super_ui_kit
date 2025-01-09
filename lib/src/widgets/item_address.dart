import 'package:flutter/material.dart';
import 'package:super_ui_kit/src/widgets/app_icon.dart';
import '../models/address.dart';
import '../shared/app_ui_helpers.dart';
import 'app_cards.dart';
import 'app_text.dart';

const kAddressCardItemCornerRadius = 10.0;
const kAddressCardItemsPaddingV = 10.0;
const kAddressCardItemHeaderHeight = 35.0;

class CSAddressItem extends StatelessWidget {
  final double cornerRadius = 10.0;
  final CsAddress address;
  final Function()? onTap;
  final Function()? onDefaultIconTap;
  final Function()? onEditIconTap;
  final String nameLabel;
  final String mobileLabel;
  final String divisionLabel;
  final String cityLabel;
  final String areaLabel;
  final String addressLineLabel;

  const CSAddressItem(
    this.address, {
    Key? key,
    this.onTap,
    this.onDefaultIconTap,
    this.onEditIconTap,
    this.nameLabel = 'Name',
    this.mobileLabel = 'Mobile',
    this.divisionLabel = 'Division',
    this.cityLabel = 'City',
    this.areaLabel = 'Area',
    this.addressLineLabel = 'Address Line',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

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
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: kAddressCardItemHeaderHeight,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: theme.colorScheme.secondary,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Expanded(
                            flex: 1,
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: kAddressCardItemsPaddingV),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: CsIcon(
                                  null,
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
                                  color: theme.colorScheme.onPrimary,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: CsIcon(
                              (address.isDefault ?? false)
                                  ? Icons.check_circle_outline_rounded
                                  : null,
                              onTap: onEditIconTap,
                              color: theme.colorScheme.onPrimary,
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
                          child: CSText(nameLabel),
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
                          child: CSText(mobileLabel),
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
                          child: CSText(divisionLabel),
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
                          child: CSText(cityLabel),
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
                          child: CSText(areaLabel),
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
                          child: CSText(addressLineLabel),
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
