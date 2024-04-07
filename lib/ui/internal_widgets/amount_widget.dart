import 'package:dtcc_task/utils/extensions/_extensions.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

/// `AmountWidget` is a stateless widget that displays a monetary amount.
///

class AmountWidget extends StatelessWidget {
  /// The `AmountWidget` takes an amount as a string, parses it into integer and decimal parts,
  /// and displays them with different styles. It also supports prefix symbols and suffixes.
  ///
  /// Parameters:
  ///   * `key`: A key that uniquely identifies this widget in the widget tree.
  ///   * `amount`: The monetary amount to display.
  ///   * `amountStyle`: The text style for the integer part of the amount.
  ///   * `decimalStyle`: The text style for the decimal part of the amount. If not provided, `amountStyle` is used.
  ///   * `suffix`: A list of inline spans to display after the amount.
  ///   * `prefixSymbol`: A string to display before the amount.
  ///
  /// Example:
  /// ```dart
  /// AmountWidget(
  ///   amount: '1234.56',
  ///   amountStyle: TextStyle(color: Colors.black, fontSize: 24),
  ///   decimalStyle: TextStyle(color: Colors.grey, fontSize: 20),
  ///   suffix: [TextSpan(text: ' USD')],
  ///   prefixSymbol: '\$',
  /// )
  /// ```
  const AmountWidget({
    super.key,
    required this.amount,
    required this.amountStyle,
    this.decimalStyle,
    this.suffix = const [],
    this.prefixSymbol = '',
  });

  /// The monetary amount to display.
  final String amount;

  /// The text style for the integer part of the amount.
  final TextStyle amountStyle;

  /// The text style for the decimal part of the amount.
  final TextStyle? decimalStyle;

  /// A list of inline spans to display after the amount.
  final List<InlineSpan> suffix;

  /// A string to display before the amount.
  final String prefixSymbol;

  @override
  Widget build(BuildContext context) {
    final parsedAmount = _parseAmount(amount);

    return RichText(
      text: TextSpan(
        children: [
          /// Display the integer part of the amount
          TextSpan(
            text: '$prefixSymbol${parsedAmount.integerPart}',
            style: amountStyle,
          ),

          /// Display the decimal part of the amount
          if (parsedAmount.decimalPart > 0)
            TextSpan(
              text: '.${parsedAmount.decimalPart.toString()}',
              style: decimalStyle ?? amountStyle,
            ),

          /// Display the suffix
          ...suffix
        ],
      ),
    );
  }

  /// Parses the amount into integer and decimal parts.
  ///
  /// This method takes a string representing a monetary amount, removes any non-numeric characters,
  /// and splits it into integer and decimal parts.
  ///
  /// Returns a map with keys 'integerPart' and 'decimalPart'.
  ({String integerPart, int decimalPart}) _parseAmount(String amount) {
    final double amountInDouble = amount.toDouble;

    // Parse the amount and separate integer and decimal parts
    final formatter = NumberFormat("#,##0.00", "en_US");
    final formattedAmount = formatter.format(amountInDouble);

    final parts = formattedAmount.split('.');
    final integerPart = parts[0];
    final decimalPart = int.tryParse(parts.length > 1 ? parts[1] : '0') ?? 0;

    /// Return the integer part as formatted `String`and decimal part as `int`
    return (integerPart: integerPart, decimalPart: decimalPart);
  }
}
