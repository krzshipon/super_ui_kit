import 'package:flutter/material.dart';

/// A customizable icon widget with a constrained splash effect.
///
/// This widget displays an icon with optional color, size, and tap interaction.
/// The splash effect is constrained to a circular area around the icon, providing
/// a Material Design ripple effect when tapped.
///
/// ## Usage
/// To use this widget, simply pass an `IconData` object to the `icon` parameter.
/// You can also customize the color, size, and tap behavior.
///
/// Example:
/// ```dart
/// CsIcon(
///   Icons.favorite,
///   color: Colors.red,
///   size: 32.0,
///   onTap: () {
///     print('Icon tapped!');
///   },
/// )
/// ```
///
/// ## Parameters
/// - `icon`: The icon to display. Must be a valid `IconData` object.
/// - `color`: The color of the icon. Defaults to the theme's primary color.
/// - `size`: The size of the icon. Defaults to 24.0.
/// - `onTap`: A callback function triggered when the icon is tapped.
///
/// ## Behavior
/// - The icon is centered within a fixed-size container.
/// - The splash effect is constrained to a circular area around the icon.
/// - The background is transparent, allowing the widget to blend seamlessly into its parent.
class CsIcon extends StatelessWidget {
  /// The icon to display.
  final IconData? icon;

  /// The color of the icon.
  final Color? color;

  /// The size of the icon.
  final double? size;

  /// A callback function triggered when the icon is tapped.
  final void Function()? onTap;

  /// Creates a customizable icon widget with a constrained splash effect.
  ///
  /// Parameters:
  /// - `icon`: The icon to display.
  /// - `color`: The color of the icon.
  /// - `size`: The size of the icon.
  /// - `onTap`: A callback function triggered when the icon is tapped.
  const CsIcon(
    this.icon, {
    super.key,
    this.onTap,
    this.color,
    this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent, // Transparent background
      child: InkWell(
        splashColor: Theme.of(context).colorScheme.primary.withAlpha(45),
        highlightColor: Colors.transparent, // Disable highlight effect
        onTap: onTap,
        customBorder:
            const CircleBorder(), // Constrain ripple to a circular area
        child: Container(
          width: size ?? 24.0, // Match the size of the icon
          height: size ?? 24.0, // Match the size of the icon
          alignment: Alignment.center, // Center the icon
          child: Icon(
            icon,
            color: color,
            size: size,
          ),
        ),
      ),
    );
  }
}
