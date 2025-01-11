import 'package:flutter/material.dart';

/// Horizontal spacing constants for consistent layout.
///
/// These constants define the width of `SizedBox` widgets used to create
/// horizontal spacing between UI elements.
const Widget horizontalSpaceTiny = SizedBox(width: 5.0); // 5px horizontal space
const Widget horizontalSpaceSmall =
    SizedBox(width: 10.0); // 10px horizontal space
const Widget horizontalSpaceRegular =
    SizedBox(width: 18.0); // 18px horizontal space
const Widget horizontalSpaceMedium =
    SizedBox(width: 25.0); // 25px horizontal space
const Widget horizontalSpaceLarge =
    SizedBox(width: 50.0); // 50px horizontal space

/// Vertical spacing constants for consistent layout.
///
/// These constants define the height of `SizedBox` widgets used to create
/// vertical spacing between UI elements.
const Widget verticalSpaceTiny = SizedBox(height: 5.0); // 5px vertical space
const Widget verticalSpaceSmall = SizedBox(height: 10.0); // 10px vertical space
const Widget verticalSpaceRegular =
    SizedBox(height: 18.0); // 18px vertical space
const Widget verticalSpaceMedium =
    SizedBox(height: 25.0); // 25px vertical space
const Widget verticalSpaceLarge = SizedBox(height: 50.0); // 50px vertical space

/// An empty widget that takes up no space.
///
/// This constant is a `SizedBox.shrink()` widget, which can be used as a placeholder
/// or to represent an empty space in the UI.
const Widget emptyWidget = SizedBox.shrink();
