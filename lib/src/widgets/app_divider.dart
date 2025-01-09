import 'package:flutter/material.dart';

/// A customizable divider widget that integrates with the app's theme.
///
/// This widget is a wrapper around Flutter's [Divider] widget, providing a consistent
/// and theme-aware divider for use in your app. It uses the `disabledColor` from the
/// app's theme to ensure it matches the overall design.
class CSDivider extends StatelessWidget {
  /// Creates a theme-aware divider.
  ///
  /// Parameters:
  /// - `key`: An optional key for the widget.
  const CSDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 2, // Height of the divider
      color: Theme.of(context).disabledColor, // Uses the theme's disabled color
    );
  }
}
