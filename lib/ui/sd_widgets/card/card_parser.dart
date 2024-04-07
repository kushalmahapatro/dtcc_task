import 'package:dtcc_task/ui/sd_widgets/card/account_card/parsers/account_card_parser.dart';
import 'package:dtcc_task/ui/sd_widgets/card/credit_card/parsers/credit_card_parser.dart';
import 'package:dtcc_task/ui/sd_widgets/card/loan_card/parsers/loan_card_parser.dart';
import 'package:mirai/mirai.dart';

/// `CardParser` is a utility class for accessing card parsers.
///
/// This class provides a collection of parsers for different types of cards,
/// allowing for the parsing of card data into corresponding card models.
///
/// The `CardParser` class cannot be instantiated directly, and instead provides
/// a static list of parsers through the `parsers` getter.
///
/// Example:
/// ```dart
/// List<MiraiParser> cardParsers = CardParser.parsers;
/// ```
class CardParser {
  /// Private constructor to prevent instantiation.
  const CardParser._();

  /// Returns a list of parsers for various types of cards.
  ///
  /// The returned list includes parsers for account cards, credit cards, and loan cards.
  static List<MiraiParser> get parsers => [
        const AccountCardParser(),
        const CreditCardParser(),
        const LoanCardParser()
      ];
}
