import 'package:dtcc_task/constants/app_color_palette.dart';
import 'package:dtcc_task/constants/app_dimens.dart';
import 'package:dtcc_task/constants/app_strings.dart';
import 'package:dtcc_task/constants/assets.dart';
import 'package:dtcc_task/ui/internal_widgets/amount_widget.dart';
import 'package:dtcc_task/utils/extensions/_extensions.dart';
import 'package:flutter/material.dart';

part 'card_footer.dart';
part 'card_styles.dart';

enum CardType { accountCard, creditCard, loanCard }

/// `CardWidget` is an abstract class that extends `StatelessWidget` and mixes in `_CardStyles`.
/// It represents a card widget in the application.
///
abstract class CardWidget extends StatelessWidget with _CardStyles {
  /// The `CardWidget` provides a base for creating card widgets with a title, primary and secondary balances,
  /// card name, and a footer section.
  ///
  /// Parameters:
  ///   * `key`: A key that uniquely identifies this widget in the widget tree.
  ///   * `cardTitle`: The title of the card.
  ///   * `balance`: The primary balance displayed on the card.
  ///   * `secondaryBalance`: The secondary balance displayed on the card.
  ///   * `cardName`: The name or identifier of the card.
  ///   * `cardFooter`: The footer section of the card.
  ///
  /// Subclasses must implement the `cardType` getter to specify the type of the card and the `secondaryBalanceWidget` method
  /// to provide the widget for displaying the secondary balance.
  ///
  /// Example of subclass:
  /// ```dart
  /// class CustomCardWidget extends CardWidget {
  ///   const CustomCardWidget({
  ///     super.key,
  ///     required super.cardTitle,
  ///     required super.balance,
  ///     required super.secondaryBalance,
  ///     required super.cardName,
  ///     required super.cardFooter,
  ///   });
  ///
  ///   @override
  ///   CardType get cardType => CardType.customCard;
  ///
  ///   @override
  ///   List<InlineSpan> secondaryBalanceWidget(BuildContext context) {
  ///     return [TextSpan(text: 'Custom secondary balance')];
  ///   }
  /// }
  /// ```
  const CardWidget({
    super.key,
    required this.cardTitle,
    required this.balance,
    required this.secondaryBalance,
    required this.cardName,
    required this.cardFooter,
  });

  /// The title of the card.
  final String cardTitle;

  /// The primary balance displayed on the card.
  final String balance;

  /// The secondary balance displayed on the card.
  final String secondaryBalance;

  /// The name or identifier of the card.
  final String cardName;

  /// The footer section of the card.
  final CardFooter cardFooter;

  /// Gets the type of the card.
  ///
  /// Subclasses must override this getter to specify the type of the card.
  CardType get cardType;

  /// Generates the widget for displaying the secondary balance.
  ///
  /// This method returns a list of inline spans representing the secondary balance
  /// widget. Subclasses must implement this method to customize the appearance
  /// of the secondary balance on the card.
  List<InlineSpan> secondaryBalanceWidget(BuildContext context);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: cardMargin,
      shape: cardShape,
      child: Stack(
        children: [
          Container(
            decoration: cardDecoration(cardType),
            padding: cardPadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Vertical Spacing
                const SizedBox(height: AppDimens.verticalXL),

                /// Card Title
                Text(
                  cardTitle,
                  style: titleStyle(context),
                ),

                /// Amount Widget with prefix symbol, amount, suffix and decimal style
                AmountWidget(
                  amount: balance,
                  prefixSymbol: AppStrings.currency,
                  amountStyle: balanceStyle(context),
                  decimalStyle: balanceDecimalStyle(context),
                  suffix: [
                    const WidgetSpan(
                      child: SizedBox(
                        width: AppDimens.horizontalS,
                      ),
                    ),
                    ...secondaryBalanceWidget(context),
                  ],
                ),

                /// Vertical Spacing
                const SizedBox(height: AppDimens.verticalS),

                /// Card Name
                Text(
                  cardName,
                  style: nameStyle(context),
                ),

                /// Vertical Spacing
                const SizedBox(height: AppDimens.verticalXXL),

                /// Card Footer
                cardFooter,
              ],
            ),
          ),

          /// Overlay line art
          const _OverlayLineArt(),
        ],
      ),
    );
  }
}

class _OverlayLineArt extends StatelessWidget {
  const _OverlayLineArt();

  @override
  Widget build(BuildContext context) {
    return PositionedDirectional(
      end: 0,
      top: 0,
      child: Image.asset(Assets.ASSETS_IMAGES_LINE_ART_PNG),
    );
  }
}
