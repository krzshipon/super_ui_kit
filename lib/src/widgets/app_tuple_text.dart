import 'package:flutter/material.dart';
import 'package:super_ui_kit/super_ui_kit.dart';

/// A widget that displays two pieces of text side by side with optional styling and tap interaction.
///
/// This widget is useful for displaying pairs of related text, such as labels and values,
/// with consistent spacing and styling. It supports custom styles for each text and an optional tap interaction.
class CSTupleText extends StatelessWidget {
  /// The first text to display.
  final String text1;

  /// The second text to display.
  final String text2;

  /// The text style for the first text.
  final TextStyle? style1;

  /// The text style for the second text.
  final TextStyle? style2;

  /// Callback function triggered when the widget is tapped.
  final void Function()? onTap;

  /// Creates a widget that displays two pieces of text side by side.
  ///
  /// Parameters:
  /// - `text1`: The first text to display.
  /// - `text2`: The second text to display.
  /// - `style1`: The text style for the first text.
  /// - `style2`: The text style for the second text.
  /// - `onTap`: Callback function triggered when the widget is tapped.
  const CSTupleText({
    Key? key,
    required this.text1,
    required this.text2,
    this.onTap,
    this.style1,
    this.style2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent,
      focusColor: Colors.transparent,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CSText(
            text1,
            style: style1 ?? Theme.of(context).textTheme.bodySmall,
          ),
          CSText(
            " $text2",
            style: style2 ??
                Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
          ),
        ],
      ),
    );
  }
}
