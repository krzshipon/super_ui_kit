import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const double cornerRadius = 5.0;

class CSInputField extends StatelessWidget {
  final TextEditingController controller;
  final String placeholder;
  final Widget? leading;
  final Widget? trailing;
  final void Function()? trailingTapped;
  final bool isPassword;
  final TextInputType? inputType;
  final List<TextInputFormatter>? inputFormatters;
  final bool enabled;
  final double? width;
  final String? errorText;
  final FocusNode? focusNode;
  final circularBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(cornerRadius),
  );
  final int? maxLines;

  final double height = 50.0;
  final double heightExtensionForError = 25.0;

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
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: (maxLines != null && maxLines! > 1)
          ? null
          : (errorText != null && enabled)
              ? height + heightExtensionForError
              : height,
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
          fillColor: Theme.of(context).colorScheme.surfaceVariant,
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
                BorderSide(color: Theme.of(context).colorScheme.secondary),
          ),
          enabledBorder: circularBorder.copyWith(
            borderSide:
                BorderSide(color: Theme.of(context).colorScheme.surfaceVariant),
          ),
        ),
        focusNode: focusNode,
      ),
    );
  }
}
