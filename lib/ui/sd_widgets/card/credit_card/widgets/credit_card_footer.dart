import 'package:dtcc_task/ui/sd_widgets/card/card_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

/// `CreditCardFooter` is a widget that extends the `CardFooter` widget.
/// It represents the footer section of a credit card widget in the application.
///
class CreditCardFooter extends CardFooter {
  /// The `CreditCardFooter` provides information such as the payment due status and due date.
  ///
  /// Parameters:
  ///   * `key`: A key that uniquely identifies this widget in the widget tree.
  ///   * `cardFooterTitle`: The title of the card footer.
  ///   * `isPositiveAsset`: A boolean value that indicates whether the asset is positive or not.
  ///   * `dueDate`: The due date of the payment, represented as milliseconds since epoch.
  ///
  /// Example:
  /// ```dart
  /// CreditCardFooter(
  ///   key: UniqueKey(),
  ///   cardFooterTitle: 'Payment Due',
  ///   isPositiveAsset: false,
  ///   dueDate: DateTime.now().millisecondsSinceEpoch,
  /// )
  /// ```
  const CreditCardFooter({
    super.key,
    required super.cardFooterTitle,
    required super.isPositiveAsset,
    required this.dueDate,
  });

  /// The due date of the payment, represented as milliseconds/seconds since epoch in `int`.
  final int dueDate;

  @override
  Widget trailingWidget(BuildContext context) => Text(
        _getStringDate(),
        style: super.footerTrailingTextStyle(context),
      );

  String _getStringDate() {
    final date = DateTime.fromMillisecondsSinceEpoch(dueDate);
    final currentDate = DateTime.now().millisecondsSinceEpoch;
    final DateFormat dateFormat = DateFormat.MMMd();

    if (currentDate - date.millisecondsSinceEpoch >
        currentDate - date.millisecondsSinceEpoch * 1000) {
      return dateFormat
          .format(DateTime.fromMillisecondsSinceEpoch(dueDate * 1000));
    } else {
      return dateFormat.format(date);
    }
  }
}
