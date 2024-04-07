import 'package:dtcc_task/ui/sd_widgets/card/card_widget.dart';
import 'package:dtcc_task/utils/extensions/_extensions.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'loan_card_model.freezed.dart';
part 'loan_card_model.g.dart';

@freezed
class LoanCardModel with _$LoanCardModel {
  // Added constructor. Must not have any parameter
  const LoanCardModel._();

  const factory LoanCardModel({
    required CardType type,
    required String cardTitle,
    required String cardName,
    required String totalLoan,
    required String remainingBalance,
    required String plan,
  }) = _LoanCardModel;

  factory LoanCardModel.fromJson(Map<String, dynamic> json) =>
      _$LoanCardModelFromJson(json);

  bool get isPositiveAsset =>
      totalLoan.toDouble / remainingBalance.toDouble <= 1.0;
}
