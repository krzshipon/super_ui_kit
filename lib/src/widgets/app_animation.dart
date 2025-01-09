import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/material.dart';

/// Animation options for the LiveGrid or LiveList.
///
/// - `delay`: The delay before the animation starts.
/// - `showItemDuration`: The duration of the animation for each item.
/// - `visibleFraction`: The fraction of the item that must be visible to trigger the animation.
/// - `reAnimateOnVisibility`: Whether to re-animate the item when it becomes visible again.
const kAnimationOptions = LiveOptions(
  delay: Duration(seconds: 0),
  showItemDuration: Duration(milliseconds: 500),
  visibleFraction: 0.05,
  reAnimateOnVisibility: false,
);

/// Grid layout configuration for the LiveGrid.
///
/// - `crossAxisCount`: The number of columns in the grid.
/// - `crossAxisSpacing`: The spacing between columns.
/// - `mainAxisSpacing`: The spacing between rows.
/// - `childAspectRatio`: The ratio of the cross-axis to the main-axis extent of each child.
const kGridDelegate = SliverGridDelegateWithFixedCrossAxisCount(
  crossAxisCount: 2,
  crossAxisSpacing: 0,
  mainAxisSpacing: 0,
  childAspectRatio: 1.15,
);

/// Wraps a UI item with animation and padding.
///
/// This function is used to animate items in a list or grid. It applies a fade and slide animation
/// to each item and optionally adds padding around the item.
///
/// Parameters:
/// - `child`: A function that returns the widget to be animated, based on the item's index.
/// - `padding`: The padding to apply around the item (default is `EdgeInsets.zero`).
///
/// Returns:
/// A function that takes `BuildContext`, `index`, and `Animation<double>` and returns an animated widget.
Widget Function(
  BuildContext context,
  int index,
  Animation<double> animation,
) animationItemBuilder(
  Widget Function(int index) child, {
  EdgeInsets padding = EdgeInsets.zero,
}) =>
    (
      BuildContext context,
      int index,
      Animation<double> animation,
    ) =>
        FadeTransition(
          opacity: Tween<double>(
            begin: 0,
            end: 1,
          ).animate(animation),
          child: SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0, -0.1),
              end: Offset.zero,
            ).animate(animation),
            child: Padding(
              padding: padding,
              child: child(index),
            ),
          ),
        );
