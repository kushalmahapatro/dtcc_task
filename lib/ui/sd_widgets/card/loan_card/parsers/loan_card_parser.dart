import 'package:dtcc_task/ui/sd_widgets/card/card_widget.dart';
import 'package:dtcc_task/ui/sd_widgets/card/loan_card/models/loan_card_model.dart';
import 'package:dtcc_task/ui/sd_widgets/card/loan_card/widgets/loan_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:mirai/mirai.dart';

class LoanCardParser extends MiraiParser<LoanCardModel> {
  const LoanCardParser();

  @override
  LoanCardModel getModel(Map<String, dynamic> json) =>
      LoanCardModel.fromJson(json);

  @override
  String get type => CardType.loanCard.name;

  @override
  Widget parse(BuildContext context, LoanCardModel model) {
    return LoanCardWidget(loanCard: model);
  }
}
