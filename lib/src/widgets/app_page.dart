import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// A customizable home widget that provides a consistent layout for app screens.
///
/// This widget wraps a `Scaffold` with an `AnnotatedRegion` to configure the system UI overlay style.
/// It supports an app bar, bottom navigation bar, floating action button, and custom padding.
class CSHomeWidget extends StatelessWidget {
  /// The main content of the widget.
  final Widget? child;

  /// The app bar displayed at the top of the screen.
  final AppBar? appBar;

  /// The bottom navigation bar displayed at the bottom of the screen.
  final Widget? bottomNavigationBar;

  /// The floating action button displayed on the screen.
  final Widget? floatingActionButton;

  /// The padding around the main content.
  final EdgeInsetsGeometry? padding;

  /// Creates a customizable home widget.
  ///
  /// Parameters:
  /// - `child`: The main content of the widget.
  /// - `appBar`: The app bar displayed at the top of the screen.
  /// - `bottomNavigationBar`: The bottom navigation bar displayed at the bottom of the screen.
  /// - `floatingActionButton`: The floating action button displayed on the screen.
  /// - `padding`: The padding around the main content.
  const CSHomeWidget({
    Key? key,
    this.child,
    this.appBar,
    this.bottomNavigationBar,
    this.floatingActionButton,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light.copyWith(
        //=====Status Bar Configs=====
        statusBarColor: Theme.of(context).appBarTheme.backgroundColor,
        statusBarIconBrightness:
            Theme.of(context).brightness == Brightness.light
                ? Brightness.dark
                : Brightness.light,
        //=====Navigation Bar Configs=====
        // This color must be equal to the WaterDropNavBar backgroundColor
        systemNavigationBarColor:
            Theme.of(context).navigationBarTheme.backgroundColor,
        systemNavigationBarIconBrightness:
            Theme.of(context).brightness == Brightness.light
                ? Brightness.dark
                : Brightness.light,
      ),
      child: Scaffold(
        appBar: appBar,
        bottomNavigationBar: bottomNavigationBar,
        floatingActionButton: floatingActionButton,
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        body: SafeArea(
          child: Padding(
            padding: padding ?? EdgeInsets.zero,
            child: child,
          ),
        ),
      ),
    );
  }
}
