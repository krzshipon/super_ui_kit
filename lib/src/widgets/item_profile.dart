import 'package:flutter/material.dart';
import 'package:super_ui_kit/super_ui_kit.dart';

/// A customizable widget for displaying profile-related items in a card layout.
///
/// This widget displays an icon, a title, and an optional header. It supports
/// tap interactions and integrates seamlessly with the app's theme.
class CSProfileItem extends StatelessWidget {
  /// The corner radius of the profile item card.
  final double cornerRadius;

  /// The optional header text displayed above the profile item.
  final String? header;

  /// The icon to display in the profile item.
  final IconData iconData;

  /// The title text to display in the profile item.
  final String title;

  /// Callback function triggered when the profile item is tapped.
  final Function()? onTap;

  /// Creates a customizable profile item widget.
  ///
  /// Parameters:
  /// - `iconData`: The icon to display in the profile item.
  /// - `title`: The title text to display in the profile item.
  /// - `header`: The optional header text displayed above the profile item.
  /// - `onTap`: Callback function triggered when the profile item is tapped.
  const CSProfileItem({
    Key? key,
    required this.iconData,
    required this.title,
    this.header,
    this.onTap,
  })  : cornerRadius = 10.0,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

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
                              color: theme.colorScheme.primary,
                            ),
                          ),
                        ),
                      ),
                      // Title
                      Expanded(
                        flex: 8,
                        child: Align(
                          alignment: Alignment.center,
                          child: CSText(
                            title,
                            isBold: true,
                          ),
                        ),
                      ),
                      // Placeholder for alignment
                      Expanded(
                        flex: 1,
                        child: Container(),
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
