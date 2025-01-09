import 'package:flutter/material.dart';
import 'package:super_ui_kit/super_ui_kit.dart';

/// Represents the type of card.
///
/// - `item`: A standard card, typically used for displaying content.
/// - `form`: A card designed for forms, with responsive width and padding.
/// - `listItem`: A card designed for list items, with horizontal padding.
enum CSCardType { item, form, listItem }

/// Default width for small cards.
const double kwCardWidthS = 250;

/// Default width for medium cards.
const double kwCardWidthM = 400;

/// Default width for large cards.
const double kwCardWidthL = 500;

/// Default margin for small cards.
const double kmCardMarginS = 10;

/// Default margin for medium cards.
const double kmCardMarginM = 15;

/// Default margin for large cards.
const double kmCardMarginL = 20;

/// Default padding for small cards.
const double kpCardPaddingS = 15;

/// Default padding for medium cards.
const double kpCardPaddingM = 20;

/// Default padding for large cards.
const double kpCardPaddingL = 30;

/// Alpha value for the card's splash color.
const int kCardSplashAlpha = 45;

/// A customizable card widget with support for different types, tap actions, and responsive design.
///
/// This widget can be used to create cards with various styles, including standard cards,
/// form cards, and list item cards. It supports tap and long-press actions, custom padding,
/// margin, and elevation.
class CSCard extends StatelessWidget {
  /// The callback function to execute when the card is tapped.
  final void Function()? onTap;

  /// The callback function to execute when the card is long-pressed.
  final void Function()? onLongTap;

  /// The list of widgets to display inside the card.
  final List<Widget> children;

  /// The type of card (item, form, or listItem).
  final CSCardType cardType;

  /// The padding around the card's content.
  final EdgeInsetsGeometry? padding;

  /// The margin around the card.
  final EdgeInsetsGeometry? margin;

  /// The corner radius of the card.
  final double? radius;

  /// The main axis alignment of the card's content.
  final MainAxisAlignment mainAxisAlignment;

  /// The elevation of the card.
  final double? elevation;

  /// Creates a customizable card widget.
  ///
  /// Parameters:
  /// - `onTap`: The callback function to execute when the card is tapped.
  /// - `onLongTap`: The callback function to execute when the card is long-pressed.
  /// - `children`: The list of widgets to display inside the card.
  /// - `cardType`: The type of card (default is `CSCardType.item`).
  /// - `padding`: The padding around the card's content.
  /// - `margin`: The margin around the card.
  /// - `radius`: The corner radius of the card.
  /// - `mainAxisAlignment`: The main axis alignment of the card's content (default is `MainAxisAlignment.start`).
  /// - `elevation`: The elevation of the card (default is `7`).
  const CSCard({
    super.key,
    this.onTap,
    required this.children,
    this.cardType = CSCardType.item,
    this.padding,
    this.margin,
    this.radius,
    this.elevation = kElevationLevelMedium,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.onLongTap,
  });

  @override
  Widget build(BuildContext context) =>
      LayoutBuilder(builder: (context, constraints) {
        return Card(
          clipBehavior: Clip.antiAlias,
          margin: (margin != null)
              ? margin
              : (cardType == CSCardType.form)
                  ? EdgeInsets.all(
                      constraints.responsiveValue(
                              small: kmCardMarginS,
                              medium: kmCardMarginM,
                              large: kmCardMarginL) ??
                          kmCardMarginL,
                    )
                  : (cardType == CSCardType.listItem)
                      ? const EdgeInsets.symmetric(
                          horizontal: kmCardMarginS,
                          vertical: kmCardMarginS / 2,
                        )
                      : const EdgeInsets.all(kmCardMarginS),
          elevation: elevation,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(radius ?? 15),
            ),
          ),
          child: InkWell(
            splashColor: Theme.of(context)
                .colorScheme
                .primary
                .withAlpha(kCardSplashAlpha),
            onTap: onTap,
            onLongPress: onLongTap,
            child: SizedBox(
              width: (cardType == CSCardType.form)
                  ? constraints.responsiveValue(
                        small:
                            (context.isLandscape) ? kwCardWidthL : kwCardWidthS,
                        medium: kwCardWidthM,
                        large: kwCardWidthL,
                      ) ??
                      kwCardWidthL
                  : null,
              child: Padding(
                padding: (padding != null)
                    ? padding!
                    : (cardType == CSCardType.form)
                        ? EdgeInsets.all(
                            constraints.responsiveValue(
                                    small: kpCardPaddingS,
                                    medium: kpCardPaddingM,
                                    large: kpCardPaddingL) ??
                                kpCardPaddingL,
                          )
                        : const EdgeInsets.all(kpCardPaddingM),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: mainAxisAlignment,
                  children: children,
                ),
              ),
            ),
          ),
        );
      });
}
