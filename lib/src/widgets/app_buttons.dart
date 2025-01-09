import 'package:flutter/material.dart';

import '../shared/app_ui_helpers.dart';
import 'app_cards.dart';
import 'app_text.dart';

/// Represents the type of button.
///
/// - `positive`: A primary button, typically used for main actions.
/// - `negative`: A secondary button, typically used for destructive actions.
enum ButtonType { positive, negative }

/// Padding for the progress bar inside the button.
const double kpButtonProgressBarPadding = 5;

/// A customizable button widget with support for different types, states, and styles.
///
/// This widget can be used as a standard button or an outlined button. It supports
/// disabled and busy states, as well as leading icons.
class CSButton extends StatelessWidget {
  /// The text displayed on the button.
  final String title;

  /// Whether the button is disabled.
  final bool isDisabled;

  /// Whether the button is in a busy state (shows a progress indicator).
  final bool isBusy;

  /// Whether the button is outlined (border with transparent background).
  final bool isOutlined;

  /// An optional widget to display before the button text (e.g., an icon).
  final Widget? leading;

  /// The callback function to execute when the button is tapped.
  final void Function()? onTap;

  /// The width of the button. If null, the button will size itself based on its content.
  final double? width;

  /// The type of button (positive or negative).
  final ButtonType type;

  /// The height of the button.
  final double height = 45.0;

  /// The corner radius of the button.
  final double cornerRadius = 5.0;

  /// Creates a standard button.
  ///
  /// Parameters:
  /// - `title`: The text displayed on the button.
  /// - `isDisabled`: Whether the button is disabled (default is `false`).
  /// - `isBusy`: Whether the button is in a busy state (default is `false`).
  /// - `onTap`: The callback function to execute when the button is tapped.
  /// - `leading`: An optional widget to display before the button text.
  /// - `width`: The width of the button.
  /// - `type`: The type of button (default is `ButtonType.positive`).
  const CSButton({
    Key? key,
    required this.title,
    this.isDisabled = false,
    this.isBusy = false,
    this.onTap,
    this.leading,
    this.width,
    this.type = ButtonType.positive,
  })  : isOutlined = false,
        super(key: key);

  /// Creates an outlined button.
  ///
  /// Parameters:
  /// - `title`: The text displayed on the button.
  /// - `onTap`: The callback function to execute when the button is tapped.
  /// - `leading`: An optional widget to display before the button text.
  /// - `width`: The width of the button.
  /// - `type`: The type of button (default is `ButtonType.positive`).
  const CSButton.outline({
    super.key,
    required this.title,
    this.onTap,
    this.leading,
    this.width,
    this.type = ButtonType.positive,
  })  : isDisabled = false,
        isBusy = false,
        isOutlined = true;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var colorScheme = theme.colorScheme;

    return GestureDetector(
      onTap: !isDisabled ? onTap : null,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 350),
        height: height,
        width: width,
        alignment: Alignment.center,
        decoration: !isOutlined
            ? BoxDecoration(
                color: isDisabled
                    ? theme.disabledColor
                    : ((type == ButtonType.negative)
                        ? colorScheme.error
                        : colorScheme.primary),
                borderRadius: BorderRadius.circular(cornerRadius),
              )
            : BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(cornerRadius),
                border: Border.all(
                  color: isDisabled
                      ? theme.disabledColor
                      : ((type == ButtonType.negative)
                          ? colorScheme.error
                          : colorScheme.primary),
                  width: 1,
                ),
              ),
        child: Material(
          color: Colors.transparent, //For making sure ripple effect is visible
          borderRadius: BorderRadius.circular(cornerRadius),
          child: InkWell(
            borderRadius: BorderRadius.circular(cornerRadius),
            onTap: !isDisabled ? onTap : null,
            child: Container(
              width: width,
              alignment: Alignment.center,
              child: !isBusy
                  ? Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (leading != null) leading!,
                        if (leading != null) const SizedBox(width: 5),
                        Text(
                          title,
                          style:
                              Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    fontWeight: !isOutlined
                                        ? FontWeight.bold
                                        : FontWeight.w400,
                                    color: !isOutlined
                                        ? colorScheme.onPrimary
                                        : colorScheme.onSurface,
                                  ),
                        ),
                      ],
                    )
                  : Transform.scale(
                      scale: 0.7,
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation(
                          !isOutlined
                              ? colorScheme.onPrimary
                              : colorScheme.onSurface,
                        ),
                        strokeWidth: 8,
                      ),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}

/// A customizable icon button widget with optional text and elevation.
///
/// This widget can be used to create buttons with icons and optional text.
class CSIconButton extends StatelessWidget {
  /// The callback function to execute when the button is tapped.
  final Function()? onTap;

  /// The icon to display on the button.
  final IconData? icon;

  /// The text to display on the button.
  final String? text;

  /// The color of the icon and text.
  final Color? color;

  /// The elevation of the button.
  final double? elevation;

  /// The padding around the button's content.
  final EdgeInsets? padding;

  /// Creates an icon button.
  ///
  /// Parameters:
  /// - `onTap`: The callback function to execute when the button is tapped.
  /// - `icon`: The icon to display on the button.
  /// - `text`: The text to display on the button.
  /// - `color`: The color of the icon and text.
  /// - `elevation`: The elevation of the button.
  /// - `padding`: The padding around the button's content.
  const CSIconButton({
    Key? key,
    this.onTap,
    this.icon,
    this.text,
    this.color,
    this.elevation,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;

    return CSCard(
      margin: EdgeInsets.zero,
      radius: 100,
      onTap: onTap,
      elevation: elevation,
      cardType: CSCardType.item,
      padding: (padding != null)
          ? padding
          : (text == null)
              ? const EdgeInsets.all(7)
              : const EdgeInsets.fromLTRB(20, 10, 20, 10),
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null)
              Icon(
                icon,
                color: color ?? colorScheme.primary,
              ),
            if (text != null) horizontalSpaceTiny,
            if (text != null)
              CSText(
                text!,
                color: color ?? colorScheme.primary,
              ),
          ],
        ),
      ],
    );
  }
}
