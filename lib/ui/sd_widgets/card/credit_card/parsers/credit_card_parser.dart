import 'package:dtcc_task/ui/sd_widgets/card/card_widget.dart';
import 'package:dtcc_task/ui/sd_widgets/card/credit_card/models/credit_card_model.dart';
import 'package:dtcc_task/ui/sd_widgets/card/credit_card/widgets/credit_card_widget.dart';
import 'package:flutter/widgets.dart';
import 'package:mirai/mirai.dart';

class CreditCardParser extends MiraiParser<CreditCardModel> {
  const CreditCardParser();

  @override
  CreditCardModel getModel(Map<String, dynamic> json) =>
      CreditCardModel.fromJson(json);

  @override
  String get type => CardType.creditCard.name;

  @override
  Widget parse(BuildContext context, CreditCardModel model) {
    return CreditCardWidget(creditCard: model);
  }
}
