import 'package:flutter/material.dart';

/// Enum representing the type of text style to apply.
///
/// - `display`: Large, prominent text for display purposes.
/// - `headline`: Large text for headings.
/// - `title`: Medium-sized text for titles.
/// - `body`: Regular text for body content.
/// - `label`: Small text for labels or captions.
enum TextType { display, headline, title, body, label }

/// A customizable text widget with support for various text styles and types.
///
/// This widget allows you to display text with customizable styles, including
/// color, font size, text alignment, and more. It also supports different text
/// types (e.g., display, headline, title) based on the `TextType` enum.
///
/// ## Usage
/// To use this widget, pass the `text` parameter and optionally customize the
/// style, color, alignment, and other properties.
///
/// Example:
/// ```dart
/// CSText(
///   'Hello, World!',
///   textType: TextType.headline,
///   color: Colors.blue,
///   fontSize: 24.0,
///   isBold: true,
/// )
/// ```
///
/// ## Parameters
/// - `text`: The text to display.
/// - `color`: The color of the text. Defaults to the theme's text color.
/// - `fontSize`: The font size of the text.
/// - `style`: A custom `TextStyle` to apply to the text.
/// - `maxLines`: The maximum number of lines for the text.
/// - `overflow`: How overflowing text should be handled.
/// - `textAlign`: The alignment of the text within its container.
/// - `textType`: The type of text style to apply (e.g., display, headline).
/// - `decoration`: Text decoration (e.g., underline, strikethrough).
/// - `onTap`: A callback function triggered when the text is tapped.
/// - `isBold`: Whether the text should be bold.
class CSText extends StatelessWidget {
  /// The text to display.
  final String text;

  /// The color of the text.
  final Color? color;

  /// The font size of the text.
  final double? fontSize;

  /// A custom `TextStyle` to apply to the text.
  final TextStyle? style;

  /// The maximum number of lines for the text.
  final int? maxLines;

  /// How overflowing text should be handled.
  final TextOverflow? overflow;

  /// The alignment of the text within its container.
  final TextAlign? textAlign;

  /// The type of text style to apply (e.g., display, headline).
  final TextType textType;

  /// Text decoration (e.g., underline, strikethrough).
  final TextDecoration? decoration;

  /// A callback function triggered when the text is tapped.
  final void Function()? onTap;

  /// Whether the text should be bold.
  final bool isBold;

  /// Creates a customizable text widget.
  ///
  /// Parameters:
  /// - `text`: The text to display.
  /// - `color`: The color of the text.
  /// - `fontSize`: The font size of the text.
  /// - `style`: A custom `TextStyle` to apply to the text.
  /// - `maxLines`: The maximum number of lines for the text.
  /// - `overflow`: How overflowing text should be handled.
  /// - `textAlign`: The alignment of the text within its container.
  /// - `textType`: The type of text style to apply (e.g., display, headline).
  /// - `decoration`: Text decoration (e.g., underline, strikethrough).
  /// - `onTap`: A callback function triggered when the text is tapped.
  /// - `isBold`: Whether the text should be bold.
  const CSText(
    this.text, {
    Key? key,
    this.color,
    this.fontSize,
    this.style,
    this.maxLines,
    this.textAlign,
    this.overflow,
    this.decoration,
    this.textType = TextType.body,
    this.onTap,
    this.isBold = false,
  }) : super(key: key);

  /// Creates a display-style text widget.
  ///
  /// Parameters:
  /// - `text`: The text to display.
  /// - `color`: The color of the text.
  /// - `fontSize`: The font size of the text.
  /// - `maxLines`: The maximum number of lines for the text.
  /// - `overflow`: How overflowing text should be handled.
  /// - `textAlign`: The alignment of the text within its container.
  /// - `style`: A custom `TextStyle` to apply to the text.
  /// - `decoration`: Text decoration (e.g., underline, strikethrough).
  /// - `onTap`: A callback function triggered when the text is tapped.
  /// - `isBold`: Whether the text should be bold.
  const CSText.display(
    this.text, {
    super.key,
    this.color,
    this.fontSize,
    this.maxLines,
    this.overflow,
    this.textAlign,
    this.style,
    this.decoration,
    this.textType = TextType.display,
    this.onTap,
    this.isBold = false,
  });

  /// Creates a headline-style text widget.
  ///
  /// Parameters:
  /// - `text`: The text to display.
  /// - `color`: The color of the text.
  /// - `fontSize`: The font size of the text.
  /// - `maxLines`: The maximum number of lines for the text.
  /// - `overflow`: How overflowing text should be handled.
  /// - `textAlign`: The alignment of the text within its container.
  /// - `style`: A custom `TextStyle` to apply to the text.
  /// - `decoration`: Text decoration (e.g., underline, strikethrough).
  /// - `onTap`: A callback function triggered when the text is tapped.
  /// - `isBold`: Whether the text should be bold.
  const CSText.headline(
    this.text, {
    super.key,
    this.color,
    this.fontSize,
    this.maxLines,
    this.overflow,
    this.textAlign,
    this.style,
    this.decoration,
    this.textType = TextType.headline,
    this.onTap,
    this.isBold = false,
  });

  /// Creates a title-style text widget.
  ///
  /// Parameters:
  /// - `text`: The text to display.
  /// - `color`: The color of the text.
  /// - `fontSize`: The font size of the text.
  /// - `maxLines`: The maximum number of lines for the text.
  /// - `overflow`: How overflowing text should be handled.
  /// - `textAlign`: The alignment of the text within its container.
  /// - `style`: A custom `TextStyle` to apply to the text.
  /// - `decoration`: Text decoration (e.g., underline, strikethrough).
  /// - `onTap`: A callback function triggered when the text is tapped.
  /// - `isBold`: Whether the text should be bold.
  const CSText.title(
    this.text, {
    super.key,
    this.color,
    this.fontSize,
    this.maxLines,
    this.overflow,
    this.textAlign,
    this.style,
    this.decoration,
    this.textType = TextType.title,
    this.onTap,
    this.isBold = false,
  });

  /// Creates a label-style text widget.
  ///
  /// Parameters:
  /// - `text`: The text to display.
  /// - `color`: The color of the text.
  /// - `fontSize`: The font size of the text.
  /// - `maxLines`: The maximum number of lines for the text.
  /// - `overflow`: How overflowing text should be handled.
  /// - `textAlign`: The alignment of the text within its container.
  /// - `style`: A custom `TextStyle` to apply to the text.
  /// - `decoration`: Text decoration (e.g., underline, strikethrough).
  /// - `onTap`: A callback function triggered when the text is tapped.
  /// - `isBold`: Whether the text should be bold.
  const CSText.label(
    this.text, {
    super.key,
    this.color,
    this.maxLines,
    this.overflow,
    this.textAlign,
    this.style,
    this.fontSize,
    this.decoration,
    this.textType = TextType.label,
    this.onTap,
    this.isBold = false,
  });

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    TextStyle? textStyle = style ??
        ((textType == TextType.display)
            ? textTheme.displayMedium
            : (textType == TextType.headline)
                ? textTheme.headlineMedium
                    ?.copyWith(fontWeight: FontWeight.bold)
                : (textType == TextType.title)
                    ? textTheme.titleMedium
                        ?.copyWith(fontWeight: FontWeight.bold)
                    : (textType == TextType.label)
                        ? textTheme.labelMedium
                            ?.copyWith(color: Theme.of(context).disabledColor)
                        : textTheme.bodyMedium);

    return GestureDetector(
      onTap: onTap,
      child: Text(
        text,
        style: textStyle?.copyWith(
          decoration: decoration,
          decorationStyle: TextDecorationStyle.solid,
          color: color,
          fontSize: fontSize,
          fontWeight: isBold ? FontWeight.bold : null,
        ),
        maxLines: maxLines,
        overflow: overflow,
        textAlign: textAlign,
      ),
    );
  }
}
