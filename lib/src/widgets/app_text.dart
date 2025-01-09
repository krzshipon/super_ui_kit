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
  final TextDecoration? decoration;
  final void Function()? onTap;

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
  }) : super(key: key);

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
    this.decoration,
    this.textType = TextType.headline,
    this.onTap,
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
    this.decoration,
    this.textType = TextType.title,
    this.onTap,
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
    this.decoration,
    this.textType = TextType.label,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    TextStyle? textStyle = style ??
        ((textType == TextType.display)
            ? textTheme.displayMedium
            : (textType == TextType.headline)
                ? textTheme.headlineMedium
                : (textType == TextType.title)
                    ? textTheme.titleMedium
                    : (textType == TextType.label)
                        ? textTheme.labelMedium
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
        ),
        maxLines: maxLines,
        overflow: overflow,
        textAlign: textAlign,
      ),
    );
  }
}
