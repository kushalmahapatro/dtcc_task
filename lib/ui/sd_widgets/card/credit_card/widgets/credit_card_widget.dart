import 'package:dtcc_task/constants/app_strings.dart';
import 'package:dtcc_task/ui/internal_widgets/_internal_widgets.dart';
import 'package:dtcc_task/ui/sd_widgets/card/card_widget.dart';
import 'package:dtcc_task/ui/sd_widgets/card/credit_card/models/credit_card_model.dart';
import 'package:dtcc_task/ui/sd_widgets/card/credit_card/widgets/credit_card_footer.dart';
import 'package:flutter/material.dart';

/// `CreditCardWidget` is a widget that extends the `CardWidget` widget.
/// It represents a credit card in the application.
///
class CreditCardWidget extends CardWidget {
  /// The `CreditCardWidget` displays information related to a credit card, including the card title,
  /// available credit, total credit, card name, card number, and a footer section.
  ///
  /// Parameters:
  ///   * `key`: A key that uniquely identifies this widget in the widget tree.
  ///   * `creditCard`: The `CreditCardModel` containing the data for the card.
  ///
  /// Example:
  /// ```dart
  /// CreditCardWidget(
  ///   key: UniqueKey(),
  ///   creditCard: CreditCardModel(
  ///     cardTitle: 'My Credit Card',
  ///     availableCredit: 5000,
  ///     totalCredit: 10000,
  ///     cardName: 'Credit Card',
  ///     cardNumber: '1234',
  ///     dueDate: DateTime.now().millisecondsSinceEpoch,
  ///   ),
  /// )
  /// ```
  CreditCardWidget({
    super.key,
    required this.creditCard,
  }) : super(
          cardTitle: creditCard.cardTitle,
          balance: creditCard.availableCredit,
          secondaryBalance: creditCard.totalCredit,
          cardName: '${creditCard.cardName} ${creditCard.cardNumber}',
          cardFooter: _creditCardFooter(creditCard),
        );

  static CardFooter _creditCardFooter(CreditCardModel creditCard) {
    if (creditCard.isPositiveAsset) {
      return CardFooter.none();
    }

    return CreditCardFooter(
      cardFooterTitle: AppStrings.paymentDue,
      isPositiveAsset: creditCard.isPositiveAsset,
      dueDate: creditCard.dueDate,
    );
  }

  /// The `CreditCardModel` containing the data for the card.
  final CreditCardModel creditCard;

  @override
  CardType get cardType => CardType.creditCard;

  @override
  List<InlineSpan> secondaryBalanceWidget(BuildContext context) {
    return [
      WidgetSpan(
        child: AmountWidget(
          amount: secondaryBalance,
          amountStyle: super.secondaryBalanceStyle(context),
          prefixSymbol: '${AppStrings.divider} ',
        ),
      )
    ];
  }
}
