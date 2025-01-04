import 'package:flutter/material.dart';
import 'app_text.dart'; // Assuming this is your custom text widget

class CsCheckbox extends StatelessWidget {
  final bool? value;
  final ValueChanged<bool?>? onChanged;
  final String? title;

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
        Checkbox(
          value: value,
          onChanged: onChanged,
          activeColor: theme.colorScheme.secondary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        if (title != null) CSText(title ?? ''),
      ],
    );
  }
}
