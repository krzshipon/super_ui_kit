import 'package:flutter/material.dart';

enum TextType { display, headline, title, body, label }

class CSText extends StatelessWidget {
  final String text;
  final Color? color;
  final double? fontSize;
  final TextStyle? style;
  final int? maxLines;
  final TextOverflow? overflow;
  final TextAlign? textAlign;
  final TextType textType;

  const CSText(this.text,
      {Key? key,
      this.color,
      this.fontSize,
      this.style,
      this.maxLines,
      this.textAlign,
      this.overflow,
      this.textType = TextType.body})
      : super(key: key);

  const CSText.display(
    this.text, {
    super.key,
    this.color,
    this.fontSize,
    this.maxLines,
    this.overflow,
    this.textAlign,
    this.style,
    this.textType = TextType.display,
  });
  const CSText.headline(
    this.text, {
    super.key,
    this.color,
    this.fontSize,
    this.maxLines,
    this.overflow,
    this.textAlign,
    this.style,
    this.textType = TextType.headline,
  });

  const CSText.title(
    this.text, {
    super.key,
    this.color,
    this.fontSize,
    this.maxLines,
    this.overflow,
    this.textAlign,
    this.style,
    this.textType = TextType.title,
  });

  const CSText.label(
    this.text, {
    super.key,
    this.color,
    this.maxLines,
    this.overflow,
    this.textAlign,
    this.style,
    this.fontSize,
    this.textType = TextType.label,
  });

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    TextStyle? textStyle = style ??
        ((textType == TextType.display)
            ? textTheme.displayMedium
            : (textType == TextType.headline)
                ? textTheme.headlineSmall
                : (textType == TextType.title)
                    ? textTheme.titleMedium
                    : (textType == TextType.label)
                        ? textTheme.labelSmall?.copyWith(color: Colors.blueGrey)
                        : textTheme.bodyMedium);
    textStyle?.copyWith(color: color, fontSize: fontSize);

    return Text(
      text,
      style: textStyle,
      maxLines: maxLines,
      overflow: overflow,
      textAlign: textAlign,
    );
  }
}
