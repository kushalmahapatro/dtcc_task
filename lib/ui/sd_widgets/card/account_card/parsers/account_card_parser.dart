import 'package:dtcc_task/ui/sd_widgets/card/account_card/models/account_card_model.dart';
import 'package:dtcc_task/ui/sd_widgets/card/account_card/widgets/account_card_widget.dart';
import 'package:dtcc_task/ui/sd_widgets/card/card_widget.dart';
import 'package:flutter/widgets.dart';
import 'package:mirai/mirai.dart';

class AccountCardParser extends MiraiParser<AccountCardModel> {
  const AccountCardParser();

  @override
  AccountCardModel getModel(Map<String, dynamic> json) =>
      AccountCardModel.fromJson(json);

  @override
  String get type => CardType.accountCard.name;

  @override
  Widget parse(BuildContext context, AccountCardModel model) {
    return AccountCardWidget(accountCard: model);
  }
}
