import 'package:dtcc_task/ui/sd_widgets/card/account_card/models/account_card_model.dart';
import 'package:dtcc_task/ui/sd_widgets/card/account_card/widgets/account_card_footer.dart';
import 'package:dtcc_task/ui/sd_widgets/card/card_widget.dart';
import 'package:flutter/material.dart';

/// `AccountCardWidget` is a widget that extends the `CardWidget` widget.
/// It represents an account card in the application.
///
class AccountCardWidget extends CardWidget {
  /// The `AccountCardWidget` displays information related to an account card, including the card title,
  /// balance, secondary balance, card name, and a footer section.
  ///
  /// Parameters:
  ///   * `key`: A key that uniquely identifies this widget in the widget tree.
  ///   * `accountCard`: The `AccountCardModel` containing the data for the card.
  ///
  /// Example:
  /// ```dart
  /// AccountCardWidget(
  ///   key: UniqueKey(),
  ///   accountCard: AccountCardModel(
  ///     cardTitle: 'My Account',
  ///     networth: 5000,
  ///     increment: '+100',
  ///     cardName: 'Account Card',
  ///     walletAddress: '0x3D...7f',
  ///     assets: <AccountCardAssets>[
  ///      AccountCardAssets.eth,
  ///      AccountCardAssets.liGold,
  ///    ],
  ///   ),
  /// )
  /// ```
  AccountCardWidget({
    super.key,
    required this.accountCard,
  }) : super(
          cardTitle: accountCard.cardTitle,
          balance: accountCard.networth.toString(),
          secondaryBalance: accountCard.increment,
          cardName: accountCard.cardName,
          cardFooter: AccountCardFooter(
            cardFooterTitle: accountCard.walletAddress,
            isPositiveAsset: accountCard.isPositiveAsset,
            assets: accountCard.assets,
          ),
        );

  /// The `AccountCardModel` containing the data for the card.
  final AccountCardModel accountCard;

  @override
  CardType get cardType => CardType.accountCard;

  @override
  List<InlineSpan> secondaryBalanceWidget(BuildContext context) {
    return [
      TextSpan(
        text: accountCard.increment,
        style: super.accountCardIncrementStyle(context),
      ),
    ];
  }
}
