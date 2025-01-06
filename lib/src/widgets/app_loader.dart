import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AppLoader {
  static final AppLoader _instance = AppLoader._internal();

  factory AppLoader() => _instance;

  AppLoader._internal();

  String loaderAnimationPath = 'assets/animations/loader.json';
  double loaderScale = 1.0;

  /// Configures the loader settings.
  void configure({
    String? loaderAnimationPath,
    double? loaderScale,
  }) {
    this.loaderAnimationPath = loaderAnimationPath ?? this.loaderAnimationPath;
    this.loaderScale = loaderScale ?? this.loaderScale;
  }

  /// Shows a loader dialog.
  void showLoader(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false, // Prevent dismissing by tapping outside
      builder: (context) {
        return Center(
          child: Transform.scale(
            scale: loaderScale,
            child: Lottie.asset(loaderAnimationPath),
          ),
        );
      },
    );
  }

  /// Hides the loader dialog.
  void hideLoader(BuildContext context) {
    Navigator.of(context).pop();
  }
}
