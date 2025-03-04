import 'dart:ui';

import 'package:flutter/material.dart';

// Enum to define the position of the Snackbar
enum SnackbarPosition { top, bottom }

// Main class to control and show the Snackbar
class CSSnackBar {
  /// Static method to show a Snackbar
  ///
  /// Parameters:
  /// - [BuildContext] context: The context to access the overlay for displaying the Snackbar.
  /// - [String] message: The main message of the Snackbar.
  /// - [String?] title: An optional title for the Snackbar.
  /// - [TextStyle?] titleTextStyle: Custom text style for the title.
  /// - [Color?] backgroundColor: Background color of the Snackbar.
  /// - [TextStyle?] textStyle: Text style for the Snackbar's message.
  /// - [double] borderRadius: Radius of the Snackbar's corners.
  /// - [Widget?] icon: Optional icon to display in the Snackbar.
  /// - [Duration] duration: Duration of the Snackbar's visibility.
  /// - [SnackbarPosition] position: Position of the Snackbar (top or bottom).
  /// - [EdgeInsets?] margin: Margin around the Snackbar.
  /// - [EdgeInsets?] padding: Padding inside the Snackbar.
  /// - [Curve] animationCurve: Animation curve for the entry/exit animations.
  /// - [Duration] animationDuration: Duration of the animation.
  /// - [bool] isError: Boolean to determine if it's an error Snackbar.
  static void show({
    required BuildContext context,
    required String message,
    String? title,
    TextStyle? titleTextStyle,
    Color? backgroundColor,
    TextStyle? textStyle,
    double borderRadius = 10.0,
    Widget? icon,
    Duration duration = const Duration(seconds: 3),
    SnackbarPosition position = SnackbarPosition.top,
    EdgeInsets? margin,
    EdgeInsets? padding,
    Curve animationCurve = Curves.easeInOut,
    Duration animationDuration = const Duration(milliseconds: 400),
    bool isError = false,
  }) {
    // Access the current Overlay
    final overlay = Overlay.of(context);

    // Create an OverlayEntry for the Snackbar to render in the widget tree above everything
    final overlayEntry = OverlayEntry(
      builder: (context) => CustomSnackbar(
        message: message,
        title: title,
        titleTextStyle: titleTextStyle,
        backgroundColor: backgroundColor,
        textStyle: textStyle,
        borderRadius: borderRadius,
        icon: icon,
        duration: duration,
        position: position,
        margin: margin,
        padding: padding,
        animationCurve: animationCurve,
        animationDuration: animationDuration,
        isError: isError,
      ),
    );

    // Insert the Snackbar entry into the overlay
    overlay.insert(overlayEntry);

    // Automatically remove the Snackbar entry after the given duration + animation time
    Future.delayed(duration + animationDuration, () {
      overlayEntry.remove();
    });
  }
}

// Widget for the custom Snackbar
class CustomSnackbar extends StatefulWidget {
  final String? title;
  final TextStyle? titleTextStyle;
  final String message;
  final TextStyle? textStyle;
  final Color? backgroundColor;
  final double borderRadius;
  final Widget? icon;
  final Duration duration;
  final SnackbarPosition position;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final Curve animationCurve;
  final Duration animationDuration;
  final bool isError;

  const CustomSnackbar({
    super.key,
    this.title,
    this.titleTextStyle,
    required this.message,
    this.textStyle,
    this.backgroundColor,
    this.borderRadius = 12.0,
    this.icon,
    this.duration = const Duration(seconds: 3),
    this.position = SnackbarPosition.bottom,
    this.margin,
    this.padding,
    this.animationCurve = Curves.easeInOut,
    this.animationDuration = const Duration(milliseconds: 300),
    this.isError = false,
  });

  @override
  _CustomSnackbarState createState() => _CustomSnackbarState();
}

// State of the CustomSnackbar widget
class _CustomSnackbarState extends State<CustomSnackbar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller; // Controls animations
  late Animation<double> _fadeAnimation; // Handles opacity of the Snackbar
  late Animation<Offset> _slideAnimation; // Handles sliding into the screen

  @override
  void initState() {
    super.initState();

    // Initialize Animation Controller
    _controller = AnimationController(
      duration: widget.animationDuration,
      vsync: this,
    );

    // Entry position for slide animation
    final startOffset =
        widget.position == SnackbarPosition.top ? Offset(0, -1) : Offset(0, 1);

    // Create slide animation (0 means in the screen, -1/1 means off-screen)
    _slideAnimation = Tween<Offset>(
      begin: startOffset,
      end: Offset(0, 0),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: widget.animationCurve,
    ));

    // Create fade animation from transparent to fully opaque
    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(_controller);

    // Start entry animation
    _controller.forward();

    // Auto-dismiss the Snackbar based on the specified duration
    Future.delayed(widget.duration, () {
      if (mounted) {
        _controller.reverse().then((_) {
          if (mounted) {
            Navigator.of(context)
                .pop(); // Remove Snackbar when animation completes
          }
        });
      }
    });
  }

  @override
  void dispose() {
    // Dispose the animation controller when the widget is removed
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Wrap the Snackbar content with `SlideTransition` and `FadeTransition` for animations
    return SafeArea(
      child: Stack(
        children: [
          Positioned(
            // Position Snackbar based on whether it's at the top or bottom
            top: widget.position == SnackbarPosition.top
                ? widget.margin?.top ?? 16
                : null,
            bottom: widget.position == SnackbarPosition.bottom
                ? widget.margin?.bottom ?? 16
                : null,
            left: widget.margin?.left ?? 16,
            right: widget.margin?.right ?? 16,
            child: SlideTransition(
              position: _slideAnimation, // Apply the slide animation
              child: FadeTransition(
                opacity: _fadeAnimation, // Apply the fade animation
                child: Material(
                  color: Colors.transparent, // For glass-like effect
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(widget.borderRadius),
                    child: BackdropFilter(
                      // Adds the frosted glass effect
                      filter: ImageFilter.blur(
                        sigmaX: 10.0,
                        sigmaY: 10.0,
                      ),
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(
                          maxWidth: 400, // Max width of the Snackbar
                        ),
                        child: Container(
                          padding: widget.padding ??
                              const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 15,
                              ), // Padding inside the Snackbar
                          decoration: BoxDecoration(
                            color: widget.backgroundColor?.withOpacity(0.4) ??
                                (widget.isError
                                    ? Theme.of(context)
                                        .colorScheme
                                        .error
                                        .withOpacity(0.4)
                                    : Theme.of(context)
                                        .colorScheme
                                        .primary
                                        .withOpacity(0.4)),
                            borderRadius:
                                BorderRadius.circular(widget.borderRadius),
                            border: Border.all(
                              color: Colors.white.withOpacity(0.2),
                              width: 1.5,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                blurRadius: 10,
                              ),
                            ],
                          ),
                          child: IntrinsicHeight(
                            // Contains dynamic height content inside
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                if (widget.icon != null) ...[
                                  widget.icon!,
                                  const SizedBox(width: 10),
                                ],
                                Flexible(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      if (widget.title != null)
                                        Text(
                                          widget.title!,
                                          style: widget.titleTextStyle ??
                                              Theme.of(context)
                                                  .textTheme
                                                  .titleMedium!
                                                  .copyWith(
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .onPrimary,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      if (widget.title != null)
                                        const SizedBox(height: 4),
                                      Text(
                                        widget.message,
                                        style: widget.textStyle ??
                                            Theme.of(context)
                                                .textTheme
                                                .bodyMedium!
                                                .copyWith(
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .onPrimary,
                                                ),
                                        textAlign: TextAlign.start,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
