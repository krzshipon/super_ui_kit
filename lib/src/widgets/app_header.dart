import 'package:flutter/material.dart';

import 'app_buttons.dart';
import 'app_text.dart';

/// Represents the type of header.
///
/// - `home`: A header with a home icon.
/// - `other`: A header with a back arrow icon.
enum HeaderType { home, other }

/// A customizable header widget with a title, leading icon, and optional trailing widget.
///
/// This widget provides a consistent design for headers in your app. It supports
/// a leading icon (home or back arrow), a centered title, and an optional trailing widget.
class CSHeader extends StatelessWidget {
  /// The title displayed in the center of the header.
  final String title;

  /// Whether to show the leading icon.
  /// Default: `true`.
  final bool showLeading;

  /// An optional widget displayed at the end of the header.
  final Widget? trailing;

  /// The type of header (home or other).
  /// Default: `HeaderType.other`.
  final HeaderType headerType;

  /// Callback function triggered when the leading icon is clicked.
  final void Function()? onLeftIconClick;

  /// Creates a customizable header widget.
  ///
  /// Parameters:
  /// - `title`: The title displayed in the center of the header.
  /// - `showLeading`: Whether to show the leading icon.
  /// - `trailing`: An optional widget displayed at the end of the header.
  /// - `headerType`: The type of header (home or other).
  /// - `onLeftIconClick`: Callback function triggered when the leading icon is clicked.
  const CSHeader({
    Key? key,
    this.title = '',
    this.showLeading = true,
    this.trailing,
    this.headerType = HeaderType.other,
    this.onLeftIconClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Leading icon (home or back arrow)
        Expanded(
          flex: 2,
          child: showLeading
              ? Center(
                  child: CSIconButton(
                    icon: (headerType == HeaderType.home)
                        ? Icons.home_sharp
                        : Icons.arrow_back_sharp,
                    onTap: (onLeftIconClick != null)
                        ? onLeftIconClick
                        : (headerType == HeaderType.home)
                            ? null
                            : () => Navigator.of(context).pop(),
                  ),
                )
              : const SizedBox.shrink(),
        ),
        // Centered title
        Expanded(
          flex: 6,
          child: Align(
            alignment: Alignment.center,
            child: CSText(
              title,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
        ),
        // Trailing widget
        Expanded(
          flex: 2,
          child: Container(
            child: trailing,
          ),
        ),
      ],
    );
  }
}
