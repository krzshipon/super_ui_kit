import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Default corner radius for the input field.
const double baseCornerRadius = 5.0;

/// A customizable input field widget that works both with and without a form.
///
/// This widget supports both standalone functionality **and** integration with a `Form`.
/// - In standalone mode, error texts can be directly passed using the `errorText` parameter.
/// - When used inside a `Form`, the `validator` and `onSaved` provide validation and saving logic,
///   and error messages are handled automatically.
///
/// This version is made stateful to manage password field behavior (text obscuring) internally.
class CSInputField extends StatefulWidget {
  /// The [TextEditingController] that manages the input field's current value.
  final TextEditingController controller;

  /// The placeholder text displayed when the input field is empty.
  final String placeholder;

  /// An optional widget displayed before the input field (e.g., an icon).
  final Widget? leading;

  /// An optional widget displayed after the input field (e.g., an icon).
  final Widget? trailing;

  /// Callback function triggered when the trailing widget is tapped.
  final void Function()? trailingTapped;

  /// The keyboard type for the input field (e.g., `TextInputType.text`, `TextInputType.number`).
  final TextInputType? inputType;

  /// List of input formatters to enforce specific formats (e.g., digits only).
  final List<TextInputFormatter>? inputFormatters;

  /// Whether the input field is enabled.
  final bool enabled;

  /// Custom error text for the field when used in standalone mode (outside a `Form`).
  final String? errorText;

  /// The focus node for the input field.
  final FocusNode? focusNode;

  /// The maximum number of lines for the input field.
  final int? maxLines;

  /// The corner radius for the input field.
  final double cornerRadius;

  /// Content padding for the input field.
  final double contentPadding;

  /// Validator function for the input field, used when inside a `Form`.
  ///
  /// If provided, this enables form validation. The function should return a
  /// string if the input value is invalid, or `null` if it's valid.
  final String? Function(String?)? validator;

  /// Callback triggered whenever the input value changes.
  final void Function(String)? onChanged;

  /// Callback for when the field is saved in a form.
  ///
  /// This is called when the form is submitted, and the input value is valid.
  final void Function(String?)? onSaved;

  /// Creates a `CSInputField` widget that supports both forms and standalone usage.
  const CSInputField({
    Key? key,
    required this.controller,
    this.placeholder = '',
    this.leading,
    this.trailing,
    this.trailingTapped,
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
  State<CSInputField> createState() => _CSInputFieldState();
}

class _CSInputFieldState extends State<CSInputField> {
  /// Maintains the state of whether the password is visible.
  bool _isObscured = false;

  @override
  void initState() {
    super.initState();

    // If inputType is a password field, make text initially obscured.
    _isObscured = widget.inputType == TextInputType.visiblePassword;
  }

  @override
  Widget build(BuildContext context) {
    // If a validator or onSaved is provided, treat it as a FormField.
    if (widget.validator != null || widget.onSaved != null) {
      return FormField<String>(
        validator: widget.validator, // Handle validation through FormField
        initialValue: widget.controller.text,
        onSaved: widget.onSaved, // Save functionality for forms
        builder: (FormFieldState<String> state) {
          return _buildTextField(
            context,
            errorText:
                state.hasError ? state.errorText : null, // FormField error text
            onChanged: (value) {
              state.didChange(value); // Update FormField state on change
              if (widget.onChanged != null) {
                widget.onChanged!(
                    value); // Trigger external onChanged callback if provided
              }
            },
          );
        },
      );
    }

    // For standalone usage (no validator or onSaved provided)
    return _buildTextField(
      context,
      errorText: widget.errorText, // Standalone error text
      onChanged: widget.onChanged,
    );
  }

  /// Builds the complete `TextField` with all customizations and error handling.
  Widget _buildTextField(BuildContext context,
      {String? errorText, void Function(String)? onChanged}) {
    final theme = Theme.of(context);

    return TextField(
      autocorrect: false, // Disable autocorrect for better control
      enabled:
          widget.enabled, // Dynamically handle whether the field is enabled
      controller: widget.controller,
      obscureText: _isObscured, // Obscure text if needed
      keyboardType: widget.inputType ?? TextInputType.text, // Set keyboard type
      focusNode: widget.focusNode,
      maxLines: widget.inputType == TextInputType.visiblePassword
          ? 1
          : widget.maxLines, // Restrict max lines for passwords
      inputFormatters:
          widget.inputFormatters, // Apply input formatters if provided
      decoration: InputDecoration(
        labelText: widget.placeholder, // Placeholder text
        errorText: errorText, // Error text dynamically passed
        contentPadding: EdgeInsets.symmetric(
          vertical: widget.contentPadding,
          horizontal: 15.0,
        ),
        filled: true,
        fillColor:
            theme.colorScheme.surfaceContainerHighest, // Background color
        prefixIcon: widget.leading, // Leading icon
        suffixIcon: widget.inputType == TextInputType.visiblePassword
            ? IconButton(
                icon: Icon(
                  _isObscured ? Icons.visibility_off : Icons.visibility,
                ),
                onPressed: () {
                  // Toggle the visibility of the password
                  setState(() {
                    _isObscured = !_isObscured;
                  });
                },
              )
            : (widget.trailing != null
                ? GestureDetector(
                    onTap: widget.trailingTapped,
                    child: widget.trailing,
                  )
                : null),
        border: OutlineInputBorder(
          borderRadius:
              BorderRadius.circular(widget.cornerRadius), // Border radius
          borderSide:
              BorderSide(color: theme.colorScheme.secondary), // Default border
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.cornerRadius),
          borderSide:
              BorderSide(color: theme.colorScheme.primary), // Focus border
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.cornerRadius),
          borderSide: BorderSide(
              color:
                  theme.colorScheme.surfaceContainerHighest), // Enabled border
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.cornerRadius),
          borderSide:
              BorderSide(color: theme.colorScheme.error), // Error border
        ),
      ),
      onChanged: onChanged, // Fire external onChanged callback
    );
  }
}
