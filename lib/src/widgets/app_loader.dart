import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

/// A singleton class for showing and hiding a customizable loader dialog.
///
/// This widget uses Lottie animations to display a loader. It supports
/// custom animation paths and scaling.
class AppLoader {
  static final AppLoader _instance = AppLoader._internal();

  /// Returns the singleton instance of [AppLoader].
  factory AppLoader() => _instance;

  AppLoader._internal();

  /// The path to the Lottie animation file for the loader.
  /// Default: `'assets/animations/loader.json'`.
  String loaderAnimationPath = 'assets/animations/loader.json';

  /// The scale of the loader animation.
  /// Default: `1.0`.
  double loaderScale = 1.0;

  /// Configures the loader settings.
  ///
  /// Parameters:
  /// - `loaderAnimationPath`: The path to the Lottie animation file for the loader.
  /// - `loaderScale`: The scale of the loader animation.
  void configure({
    String? loaderAnimationPath,
    double? loaderScale,
  }) {
    this.loaderAnimationPath = loaderAnimationPath ?? this.loaderAnimationPath;
    this.loaderScale = loaderScale ?? this.loaderScale;
  }

  /// Shows a loader dialog.
  ///
  /// Parameters:
  /// - `context`: The build context.
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
  ///
  /// Parameters:
  /// - `context`: The build context.
  void hideLoader(BuildContext context) {
    Navigator.of(context).pop();
  }
}
