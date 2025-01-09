import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Default corner radius for the input field.
const double cornerRadius = 5.0;

/// A customizable input field widget with support for leading/trailing icons, error messages, and more.
///
/// This widget provides a consistent design for text input fields in your app. It supports
/// optional leading and trailing icons, password fields, custom input types, and error handling.
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
  /// Default: `false`.
  final bool isPassword;

  /// The keyboard type for the input field (e.g., `TextInputType.text`, `TextInputType.number`).
  final TextInputType? inputType;

  /// List of input formatters to enforce specific input formats (e.g., numbers only).
  final List<TextInputFormatter>? inputFormatters;

  /// Whether the input field is enabled.
  /// Default: `true`.
  final bool enabled;

  /// The width of the input field.
  final double? width;

  /// The error message to display below the input field.
  final String? errorText;

  /// The focus node for the input field.
  final FocusNode? focusNode;

  /// The maximum number of lines for the input field.
  final int? maxLines;

  /// The border style for the input field.
  final OutlineInputBorder circularBorder;

  /// The height of the input field.
  final double height;

  /// The additional height for the input field when an error message is displayed.
  final double heightExtensionForError;

  /// Creates a customizable input field widget.
  ///
  /// Parameters:
  /// - `controller`: The controller for the text input field.
  /// - `placeholder`: The placeholder text displayed when the input field is empty.
  /// - `leading`: An optional widget displayed before the input field.
  /// - `trailing`: An optional widget displayed after the input field.
  /// - `trailingTapped`: Callback function triggered when the trailing widget is tapped.
  /// - `isPassword`: Whether the input field is a password field.
  /// - `inputType`: The keyboard type for the input field.
  /// - `inputFormatters`: List of input formatters to enforce specific input formats.
  /// - `enabled`: Whether the input field is enabled.
  /// - `width`: The width of the input field.
  /// - `errorText`: The error message to display below the input field.
  /// - `focusNode`: The focus node for the input field.
  /// - `maxLines`: The maximum number of lines for the input field.
  CSInputField({
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
    this.width,
    this.focusNode,
    this.maxLines,
    this.inputFormatters,
  })  : circularBorder = OutlineInputBorder(
          borderRadius: BorderRadius.circular(cornerRadius),
        ),
        height = 50.0,
        heightExtensionForError = 25.0,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: (maxLines != null && maxLines! > 1)
          ? null
          : (errorText == null)
              ? height
              : height + heightExtensionForError,
      child: TextField(
        autocorrect: false,
        enabled: enabled,
        controller: controller,
        obscureText: isPassword,
        keyboardType: inputType ?? TextInputType.text,
        maxLines: isPassword ? 1 : maxLines,
        inputFormatters: inputFormatters,
        decoration: InputDecoration(
          labelText: placeholder,
          labelStyle: Theme.of(context).textTheme.labelMedium,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          filled: true,
          fillColor: Theme.of(context).colorScheme.surfaceContainerHighest,
          errorText: errorText,
          prefixIcon: leading,
          suffixIcon: trailing != null
              ? GestureDetector(onTap: trailingTapped, child: trailing)
              : null,
          border: circularBorder.copyWith(
            borderSide:
                BorderSide(color: Theme.of(context).colorScheme.secondary),
          ),
          errorBorder: circularBorder.copyWith(
            borderSide: BorderSide(color: Theme.of(context).colorScheme.error),
          ),
          focusedBorder: circularBorder.copyWith(
            borderSide:
                BorderSide(color: Theme.of(context).colorScheme.primary),
          ),
          enabledBorder: circularBorder.copyWith(
            borderSide: BorderSide(
                color: Theme.of(context).colorScheme.surfaceContainerHighest),
          ),
        ),
        focusNode: focusNode,
      ),
    );
  }
}
