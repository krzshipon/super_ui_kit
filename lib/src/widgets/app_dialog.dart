import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

/// Represents the type of dialog.
///
/// - `success`: A dialog indicating a successful operation.
/// - `error`: A dialog indicating an error or failure.
/// - `alert`: A dialog indicating a warning or alert.
/// - `general`: A general-purpose dialog.
enum DialogType { success, error, alert, general }

/// A singleton class for showing customizable dialogs with Lottie animations.
///
/// This class provides a simple way to display dialogs with different types of
/// animations (success, error, alert, general) and customizable actions.
class AppDialog {
  static final AppDialog _instance = AppDialog._internal();

  /// Returns the singleton instance of [AppDialog].
  factory AppDialog() => _instance;

  AppDialog._internal();

  /// Default Lottie animation path for success dialogs.
  String successAnimationPath = 'assets/animations/anim_dialog_success.json';

  /// Default Lottie animation path for error dialogs.
  String errorAnimationPath = 'assets/animations/anim_dialog_error.json';

  /// Default Lottie animation path for alert dialogs.
  String alertAnimationPath = 'assets/animations/anim_dialog_alert.json';

  /// Default Lottie animation path for general dialogs.
  String generalAnimationPath = 'assets/animations/anim_dialog_info.json';

  /// Configures the dialog settings.
  ///
  /// Parameters:
  /// - `successAnimationPath`: The path to the Lottie animation for success dialogs.
  /// - `errorAnimationPath`: The path to the Lottie animation for error dialogs.
  /// - `alertAnimationPath`: The path to the Lottie animation for alert dialogs.
  /// - `generalAnimationPath`: The path to the Lottie animation for general dialogs.
  void configure({
    String? successAnimationPath,
    String? errorAnimationPath,
    String? alertAnimationPath,
    String? generalAnimationPath,
  }) {
    this.successAnimationPath =
        successAnimationPath ?? this.successAnimationPath;
    this.errorAnimationPath = errorAnimationPath ?? this.errorAnimationPath;
    this.alertAnimationPath = alertAnimationPath ?? this.alertAnimationPath;
    this.generalAnimationPath =
        generalAnimationPath ?? this.generalAnimationPath;
  }

  /// Shows a custom dialog.
  ///
  /// Parameters:
  /// - `context`: The build context.
  /// - `bodyText`: The main text content of the dialog.
  /// - `title`: The title of the dialog (optional).
  /// - `onConfirm`: The callback function to execute when the "Confirm" button is pressed.
  /// - `onCancel`: The callback function to execute when the "Cancel" button is pressed.
  /// - `dialogType`: The type of dialog (default is `DialogType.general`).
  void showAppDialog(
    BuildContext context, {
    required String bodyText,
    String title = '',
    void Function()? onConfirm,
    void Function()? onCancel,
    DialogType dialogType = DialogType.general,
  }) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Theme.of(context).colorScheme.surface,
          title: Text(
            title,
            style: TextStyle(color: Theme.of(context).colorScheme.primary),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Lottie.asset(
                _getAnimationPath(dialogType),
                width: 45,
                height: 45,
                repeat: true,
              ),
              const SizedBox(height: 8),
              Text(
                bodyText,
                style:
                    TextStyle(color: Theme.of(context).colorScheme.secondary),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
            ],
          ),
          actions: [
            TextButton(
              onPressed: onCancel ?? () => Navigator.of(context).pop(),
              child: Text(
                'Cancel',
                style: TextStyle(color: Theme.of(context).colorScheme.primary),
              ),
            ),
            TextButton(
              onPressed: onConfirm ?? () => Navigator.of(context).pop(),
              style: TextButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primary,
              ),
              child: Text(
                'Confirm',
                style:
                    TextStyle(color: Theme.of(context).colorScheme.onPrimary),
              ),
            ),
          ],
        );
      },
    );
  }

  /// Returns the animation path based on the dialog type.
  String _getAnimationPath(DialogType dialogType) {
    switch (dialogType) {
      case DialogType.success:
        return successAnimationPath;
      case DialogType.error:
        return errorAnimationPath;
      case DialogType.alert:
        return alertAnimationPath;
      case DialogType.general:
        return generalAnimationPath;
    }
  }
}
