import 'package:flutter/material.dart';

/// Hides the keyboard by unfocusing the currently focused widget.
///
/// This function is useful for dismissing the keyboard when the user taps outside
/// of a text input field or when a specific action (e.g., button press) requires
/// the keyboard to be hidden.
void hideKeyBoard() {
  FocusManager.instance.primaryFocus?.unfocus();
}
