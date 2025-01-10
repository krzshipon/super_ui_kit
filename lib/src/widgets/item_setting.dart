import 'package:flutter/material.dart';
import 'package:super_ui_kit/super_ui_kit.dart';

/// A customizable widget for displaying setting-related items in a card layout.
///
/// This widget displays an icon, a title, and an optional trailing arrow. It supports
/// tap interactions and integrates seamlessly with the app's theme.
class CsSettingItem extends StatelessWidget {
  /// The corner radius of the setting item card.
  final double cornerRadius;

  /// The optional header text displayed above the setting item.
  final String? header;

  /// The icon to display in the setting item.
  final IconData iconData;

  /// The title text to display in the setting item.
  final String title;

  /// Callback function triggered when the setting item is tapped.
  final Function()? onTap;

  /// Whether to show a trailing arrow icon.
  /// Default: `true`.
  final bool showTrailing;

  /// Creates a customizable setting item widget.
  ///
  /// Parameters:
  /// - `iconData`: The icon to display in the setting item.
  /// - `title`: The title text to display in the setting item.
  /// - `header`: The optional header text displayed above the setting item.
  /// - `onTap`: Callback function triggered when the setting item is tapped.
  /// - `showTrailing`: Whether to show a trailing arrow icon.
  const CsSettingItem({
    Key? key,
    required this.iconData,
    required this.title,
    this.header,
    this.onTap,
    this.showTrailing = true,
  })  : cornerRadius = 10.0,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        // Display the header if provided
        if (header != null)
          Padding(
            padding: EdgeInsets.only(left: kmCardMarginS + cornerRadius),
            child: CSText.label(header!),
          ),
        Row(
          children: [
            Expanded(
              child: CSCard(
                onTap: onTap,
                radius: cornerRadius,
                margin: (header != null)
                    ? const EdgeInsets.only(
                        top: 3,
                        left: kmCardMarginS,
                        right: kmCardMarginS,
                        bottom: kmCardMarginS,
                      )
                    : null,
                padding: EdgeInsets.symmetric(
                  vertical: kpCardPaddingS,
                  horizontal: cornerRadius,
                ),
                cardType: CSCardType.item,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Icon
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: CsIcon(
                              iconData,
                              color: colorScheme.primary,
                            ),
                          ),
                        ),
                      ),
                      // Title
                      Expanded(
                        flex: 8,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: CSText(
                              title,
                              isBold: true,
                            ),
                          ),
                        ),
                      ),
                      // Trailing arrow (optional)
                      Expanded(
                        flex: 1,
                        child: CsIcon(
                          (showTrailing) ? Icons.arrow_forward : null,
                          color: colorScheme.primary,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
