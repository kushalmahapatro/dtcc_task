import 'package:dtcc_task/ui/sd_widgets/card/card_widget.dart';
import 'package:dtcc_task/utils/extensions/_extensions.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'credit_card_model.freezed.dart';
part 'credit_card_model.g.dart';

@freezed
class CreditCardModel with _$CreditCardModel {
  // Added constructor. Must not have any parameter
  const CreditCardModel._();

  const factory CreditCardModel({
    required CardType type,
    required String cardTitle,
    required String cardName,
    required String totalCredit,
    required String availableCredit,
    required String cardNumber,
    required int dueDate,
  }) = _CreditCardModel;

  factory CreditCardModel.fromJson(Map<String, dynamic> json) =>
      _$CreditCardModelFromJson(json);

  bool get isPositiveAsset =>
      totalCredit.toDouble / availableCredit.toDouble <= 1.0;
}
