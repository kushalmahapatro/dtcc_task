import 'package:dtcc_task/constants/assets.dart';
import 'package:dtcc_task/ui/sd_widgets/card/card_widget.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'account_card_model.freezed.dart';
part 'account_card_model.g.dart';

/// `AccountCardAssets` is an enumeration that represents the different types of assets
/// that can be associated with an account card in the application.
///
/// Each asset type is associated with a `type` string and an `assetPath` string.
/// The `type` string represents the type of the asset and the `assetPath` string represents
/// the path to the asset's image.
///
/// The `AccountCardAssets` enumeration has the following values:
///   * `eth`: Represents the Ethereum asset. The `type` string is 'ETH' and the `assetPath` string is `R.ASSETS_IMAGES_ETH_PNG`.
///   * `liGold`: Represents the LiGold asset. The `type` string is 'LiGold' and the `assetPath` string is `R.ASSETS_IMAGES_LIGOLD_PNG`.
///   * `usdt`: Represents the USDT asset. The `type` string is 'USDT' and the `assetPath` string is `R.ASSETS_IMAGES_USTD_PNG`.
///   * `none`: Represents no asset. The `type` string is '' and the `assetPath` string is ''.
///
/// Example:
/// ```dart
/// AccountCardAssets.eth
/// ```
@JsonEnum(valueField: 'type')
enum AccountCardAssets {
  eth('ETH', assetPath: Assets.ASSETS_IMAGES_ETH_PNG),
  liGold('LiGold', assetPath: Assets.ASSETS_IMAGES_LIGOLD_PNG),
  usdt('USDT', assetPath: Assets.ASSETS_IMAGES_USTD_PNG),
  none('', assetPath: '');

  final String type;
  final String assetPath;
  const AccountCardAssets(this.type, {required this.assetPath});
}

@freezed
class AccountCardModel with _$AccountCardModel {
  // Added constructor. Must not have any parameter
  const AccountCardModel._();

  const factory AccountCardModel({
    required CardType type,
    required String cardTitle,
    required String cardName,
    required double networth,
    required String increment,
    required String walletAddress,
    required List<AccountCardAssets> assets,
  }) = _AccountCardModel;

  factory AccountCardModel.fromJson(Map<String, dynamic> json) =>
      _$AccountCardModelFromJson(json);

  bool get isPositiveAsset => increment.contains('+');
}
