import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

enum DialogType { success, error, alert, general }

class AppDialog {
  static final AppDialog _instance = AppDialog._internal();

  factory AppDialog() => _instance;

  AppDialog._internal();

  // Default Lottie animation paths
  String successAnimationPath = 'assets/animations/anim_dialog_success.json';
  String errorAnimationPath = 'assets/animations/anim_dialog_error.json';
  String alertAnimationPath = 'assets/animations/anim_dialog_alert.json';
  String generalAnimationPath = 'assets/animations/anim_dialog_info.json';

  /// Configures the dialog settings.
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
                width: 100,
                height: 100,
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
