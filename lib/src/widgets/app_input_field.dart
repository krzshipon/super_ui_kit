import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Default corner radius for the input field.
const double baseCornerRadius = 5.0;

class CSInputField extends StatelessWidget {
  /// The controller for the text input field.
  final TextEditingController controller;

  /// The placeholder text displayed when the input field is empty.
  final String placeholder;

  /// An optional widget displayed before the input field (e.g., an icon).
  final Widget? leading;

  /// An optional widget displayed after the input field (e.g., an icon).
  final Widget? trailing;

  /// Callback function triggered when the trailing widget is tapped.
  final void Function()? trailingTapped;

  /// Whether the input field is a password field (obscures text).
  final bool isPassword;

  /// The keyboard type for the input field (e.g., `TextInputType.text`, `TextInputType.number`).
  final TextInputType? inputType;

  /// List of input formatters to enforce specific input formats (e.g., numbers only).
  final List<TextInputFormatter>? inputFormatters;

  /// Whether the input field is enabled.
  final bool enabled;

  /// The error message to display below the input field.
  final String? errorText;

  /// The focus node for the input field.
  final FocusNode? focusNode;

  /// The maximum number of lines for the input field.
  final int? maxLines;

  /// The corner radius for the input field.
  final double cornerRadius;

  /// The padding for the input field content.
  final double contentPadding;

  /// The validator function for the input field.
  final String? Function(String?)? validator;

  /// The callback triggered when the input field changes its value.
  final void Function(String)? onChanged;

  /// The callback triggered when the input field is saved in a form.
  final void Function(String?)? onSaved;

  /// Creates a customizable input field widget that works both with and without a form.
  const CSInputField({
    Key? key,
    required this.controller,
    this.placeholder = '',
    this.leading,
    this.trailing,
    this.trailingTapped,
    this.isPassword = false,
    this.inputType,
    this.enabled = true,
    this.errorText,
    this.focusNode,
    this.maxLines,
    this.inputFormatters,
    this.cornerRadius = 5.0,
    this.contentPadding = 15.0,
    this.validator,
    this.onChanged,
    this.onSaved,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // If `validator` is provided, treat it as a FormField
    if (validator != null || onSaved != null) {
      return FormField<String>(
        validator: validator,
        initialValue: controller.text,
        onSaved: onSaved,
        builder: (FormFieldState<String> state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTextField(
                context,
                errorText: state.hasError
                    ? state.errorText
                    : null, // Use FormField errors
                onChanged: (value) {
                  state.didChange(value); // Update the Form state
                  if (onChanged != null) {
                    onChanged!(value);
                  }
                },
              ),
              if (state.hasError)
                Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: Text(
                    state.errorText!,
                    style: TextStyle(
                      fontSize: 12,
                      color: theme.colorScheme.error,
                    ),
                  ),
                ),
            ],
          );
        },
      );
    }

    // If no validator or onSaved is provided, render a normal TextField
    return _buildTextField(context, errorText: errorText, onChanged: onChanged);
  }

  Widget _buildTextField(BuildContext context,
      {String? errorText, void Function(String)? onChanged}) {
    final theme = Theme.of(context);

    return TextField(
      autocorrect: false,
      enabled: enabled,
      controller: controller,
      obscureText: isPassword,
      keyboardType: inputType ?? TextInputType.text,
      focusNode: focusNode,
      maxLines: isPassword ? 1 : maxLines,
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
        labelText: placeholder,
        errorText: errorText,
        contentPadding: EdgeInsets.symmetric(
          vertical: contentPadding,
          horizontal: 15.0,
        ),
        filled: true,
        fillColor: theme.colorScheme.surfaceContainerHighest,
        prefixIcon: leading,
        suffixIcon: trailing != null
            ? GestureDetector(onTap: trailingTapped, child: trailing)
            : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(cornerRadius),
          borderSide: BorderSide(color: theme.colorScheme.secondary),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(cornerRadius),
          borderSide: BorderSide(color: theme.colorScheme.primary),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(cornerRadius),
          borderSide:
              BorderSide(color: theme.colorScheme.surfaceContainerHighest),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(cornerRadius),
          borderSide: BorderSide(color: theme.colorScheme.error),
        ),
      ),
      onChanged: onChanged,
    );
  }
}
