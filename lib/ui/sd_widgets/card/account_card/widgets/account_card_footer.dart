import 'package:dtcc_task/constants/_constants.dart';
import 'package:dtcc_task/ui/external_widgets/_external_widgets.dart';
import 'package:dtcc_task/ui/sd_widgets/card/account_card/models/account_card_model.dart';
import 'package:dtcc_task/ui/sd_widgets/card/card_widget.dart';
import 'package:flutter/material.dart';

/// `AccountCardFooter` is a widget that extends the `CardFooter` widget.
/// It represents the footer part of an account card in the application.
class AccountCardFooter extends CardFooter {
  /// The `AccountCardFooter` requires a list of `AccountCardAssets` which represents
  /// the assets associated with the account.
  ///
  /// Parameters:
  ///   * `key`: A key that uniquely identifies this widget in the widget tree.
  ///   * `cardFooterTitle`: The title of the card footer.
  ///   * `isPositiveAsset`: A boolean value that indicates whether the asset is positive or not.
  ///   * `assets`: A list of `AccountCardAssets` that represents the assets of the account.
  ///
  /// Example:
  /// ```dart
  /// AccountCardFooter(
  ///   key: UniqueKey(),
  ///   cardFooterTitle: 'My Account',
  ///   isPositiveAsset: true,
  ///   assets: <AccountCardAssets>[
  ///     AccountCardAssets.eth,
  ///     AccountCardAssets.btc,
  ///   ],
  /// )
  /// ```
  const AccountCardFooter({
    super.key,
    required super.cardFooterTitle,
    required super.isPositiveAsset,
    required this.assets,
  });

  /// A list of `AccountCardAssets` that represents the assets of the account.
  final List<AccountCardAssets> assets;

  @override
  Widget trailingWidget(BuildContext context) => HorizontalOverlapWidget(
        height: AppDimens.verticalXL,
        children: assets
            .where((element) => element.assetPath.isNotEmpty)
            .map((e) => AssetImage(e.assetPath))
            .toList(),
      );
}
