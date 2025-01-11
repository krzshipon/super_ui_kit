import 'package:flutter/material.dart';

import 'app_text.dart';

/// A customizable header widget for items, typically used in lists or forms.
///
/// This widget displays a title with optional left padding and aligns it to the left.
/// It uses the app's theme for consistent text styling.
class CSItemHeader extends StatelessWidget {
  /// The title text to display.
  final String title;

  /// The left padding for the title.
  /// Default: `5.0`.
  final double leftPadding;

  /// Creates a customizable item header widget.
  ///
  /// Parameters:
  /// - `title`: The title text to display.
  /// - `leftPadding`: The left padding for the title.
  const CSItemHeader({
    Key? key,
    required this.title,
    this.leftPadding = 5.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: leftPadding),
      child: Align(
        alignment: Alignment.centerLeft,
        child: CSText(
          title,
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ),
    );
  }
}
