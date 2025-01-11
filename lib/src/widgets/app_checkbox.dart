import 'package:flutter/material.dart';
import 'app_text.dart'; // Assuming this is your custom text widget

/// A customizable checkbox widget with an optional title.
///
/// This widget combines a standard [Checkbox] with an optional text label.
/// It supports custom styling, including rounded corners for the checkbox,
/// and integrates seamlessly with your app's theme.
class CsCheckbox extends StatelessWidget {
  /// The current value of the checkbox.
  ///
  /// If `true`, the checkbox is checked. If `false`, it is unchecked.
  /// If `null`, the checkbox is in an indeterminate state.
  final bool? value;

  /// The callback function called when the checkbox's value changes.
  ///
  /// This function receives the new value of the checkbox (`true`, `false`, or `null`).
  final ValueChanged<bool?>? onChanged;

  /// The optional text label displayed next to the checkbox.
  final String? title;

  /// Creates a customizable checkbox widget.
  ///
  /// Parameters:
  /// - `value`: The current value of the checkbox.
  /// - `onChanged`: The callback function called when the checkbox's value changes.
  /// - `title`: The optional text label displayed next to the checkbox.
  const CsCheckbox(
    this.value,
    this.onChanged, {
    Key? key,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Checkbox with custom styling
        Checkbox(
          value: value,
          onChanged: onChanged,
          activeColor: theme.colorScheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        // Optional title text
        if (title != null) CSText(title ?? ''),
      ],
    );
  }
}
