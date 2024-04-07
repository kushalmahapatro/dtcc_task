import 'package:dtcc_task/constants/app_strings.dart';
import 'package:dtcc_task/ui/internal_widgets/amount_widget.dart';
import 'package:dtcc_task/ui/sd_widgets/card/card_widget.dart';
import 'package:dtcc_task/ui/sd_widgets/card/loan_card/models/loan_card_model.dart';
import 'package:dtcc_task/ui/sd_widgets/card/loan_card/widgets/loan_card_footer.dart';
import 'package:flutter/material.dart';

/// `LoanCardWidget` is a widget that extends the `CardWidget` widget.
/// It represents a loan card in the application.
///

class LoanCardWidget extends CardWidget {
  /// The `LoanCardWidget` displays information related to a loan card, including the card title,
  /// remaining balance, total loan, card name, and a footer section.
  ///
  /// Parameters:
  ///   * `key`: A key that uniquely identifies this widget in the widget tree.
  ///   * `loanCard`: The `LoanCardModel` containing the data for the card.
  ///
  /// Example:
  /// ```dart
  /// LoanCardWidget(
  ///   key: UniqueKey(),
  ///   loanCard: LoanCardModel(
  ///     cardTitle: 'My Loan',
  ///     remainingBalance: 5000,
  ///     totalLoan: 10000,
  ///     cardName: 'Loan Card',
  ///     plan: 'Plan A',
  ///   ),
  /// )
  /// ```
  LoanCardWidget({
    super.key,
    required this.loanCard,
  }) : super(
          cardTitle: loanCard.cardTitle,
          balance: loanCard.remainingBalance,
          secondaryBalance: loanCard.totalLoan,
          cardName:
              '${loanCard.cardName} ${AppStrings.dotDivider} ${loanCard.plan}',
          cardFooter: _loanCardFooter(loanCard),
        );

  static CardFooter _loanCardFooter(LoanCardModel loanCard) {
    if (loanCard.isPositiveAsset) {
      return CardFooter.none();
    }

    return LoanCardFooter(
      cardFooterTitle: AppStrings.paymentDue,
      isPositiveAsset: loanCard.isPositiveAsset,
    );
  }

  /// The `LoanCardModel` containing the data for the card.
  final LoanCardModel loanCard;

  @override
  CardType get cardType => CardType.loanCard;

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
