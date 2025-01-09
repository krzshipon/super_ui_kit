import 'package:flutter/material.dart';

/// A customizable icon widget with a constrained splash effect.
///
/// This widget displays an icon with optional color, size, and tap interaction.
/// The splash effect is constrained to the area around the icon.
class CsIcon extends StatelessWidget {
  /// The icon to display.
  final IconData? icon;

  /// The color of the icon.
  final Color? color;

  /// The size of the icon.
  final double? size;

  /// Callback function triggered when the icon is tapped.
  final void Function()? onTap;

  /// Creates a customizable icon widget.
  ///
  /// Parameters:
  /// - `icon`: The icon to display.
  /// - `color`: The color of the icon.
  /// - `size`: The size of the icon.
  /// - `onTap`: Callback function triggered when the icon is tapped.
  const CsIcon(
    this.icon, {
    super.key,
    this.onTap,
    this.color,
    this.size,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Material(
          color: Colors.transparent, // Transparent background
          shape: const CircleBorder(), // Constrain splash to a circular area
          child: InkWell(
            splashColor: Theme.of(context).colorScheme.primary.withAlpha(45),
            highlightColor: Colors.transparent, // Disable highlight effect
            onTap: onTap,
            customBorder:
                const CircleBorder(), // Constrain splash to a circular area
            child: Padding(
              padding: const EdgeInsets.all(
                  8.0), // Padding for better splash visibility
              child: Icon(
                icon,
                color: color,
                size: size,
              ),
            ),
          ),
        );
      },
    );
  }
}
