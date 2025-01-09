import 'package:flutter/material.dart';
import 'package:super_ui_kit/src/widgets/app_icon.dart';
import '../models/address.dart';
import '../shared/app_ui_helpers.dart';
import 'app_cards.dart';
import 'app_text.dart';

/// Default corner radius for the address item card.
const kAddressCardItemCornerRadius = 10.0;

/// Default vertical padding for the address item card.
const kAddressCardItemsPaddingV = 10.0;

/// Default height for the header of the address item card.
const kAddressCardItemHeaderHeight = 35.0;

/// A customizable widget for displaying address information in a card layout.
///
/// This widget displays address details such as name, mobile, division, city, area, and address line.
/// It supports optional tap interactions for the card, default icon, and edit icon.
class CSAddressItem extends StatelessWidget {
  /// The corner radius of the address item card.
  final double cornerRadius;

  /// The address data to display.
  final CsAddress address;

  /// Callback function triggered when the card is tapped.
  final Function()? onTap;

  /// Callback function triggered when the default icon is tapped.
  final Function()? onDefaultIconTap;

  /// Callback function triggered when the edit icon is tapped.
  final Function()? onEditIconTap;

  /// The label for the name field.
  final String nameLabel;

  /// The label for the mobile field.
  final String mobileLabel;

  /// The label for the division field.
  final String divisionLabel;

  /// The label for the city field.
  final String cityLabel;

  /// The label for the area field.
  final String areaLabel;

  /// The label for the address line field.
  final String addressLineLabel;

  /// Creates a customizable address item widget.
  ///
  /// Parameters:
  /// - `address`: The address data to display.
  /// - `onTap`: Callback function triggered when the card is tapped.
  /// - `onDefaultIconTap`: Callback function triggered when the default icon is tapped.
  /// - `onEditIconTap`: Callback function triggered when the edit icon is tapped.
  /// - `nameLabel`: The label for the name field.
  /// - `mobileLabel`: The label for the mobile field.
  /// - `divisionLabel`: The label for the division field.
  /// - `cityLabel`: The label for the city field.
  /// - `areaLabel`: The label for the area field.
  /// - `addressLineLabel`: The label for the address line field.
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
  })  : cornerRadius = kAddressCardItemCornerRadius,
        super(key: key);

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
                  // Header section
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
                  // Name field
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
                  // Mobile field
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
                  // Division field
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
                  // City field
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
                  // Area field
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
                  // Address line field
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
