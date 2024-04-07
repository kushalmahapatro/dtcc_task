import 'package:dtcc_task/constants/app_dimens.dart';
import 'package:dtcc_task/constants/app_strings.dart';
import 'package:dtcc_task/constants/assets.dart';
import 'package:dtcc_task/ui/internal_widgets/conditional_widget.dart';
import 'package:dtcc_task/ui/sd_widgets/card/card_widget.dart';
import 'package:flutter/widgets.dart';

/// `LoanCardFooter` is a widget that extends the `CardFooter` widget.
/// It represents the footer part of a loan card in the application.
///

class LoanCardFooter extends CardFooter {
  /// The `LoanCardFooter` provides information such as the payment due status.
  ///
  /// Parameters:
  ///   * `key`: A key that uniquely identifies this widget in the widget tree.
  ///   * `cardFooterTitle`: The title of the card footer.
  ///   * `isPositiveAsset`: A boolean value that indicates whether the asset is positive or not.
  ///
  /// Example:
  /// ```dart
  /// LoanCardFooter(
  ///   key: UniqueKey(),
  ///   cardFooterTitle: 'My Loan',
  ///   isPositiveAsset: false,
  /// )
  /// ```
  const LoanCardFooter({
    super.key,
    required super.cardFooterTitle,
    required super.isPositiveAsset,
  });

  @override
  Widget trailingWidget(BuildContext context) => ConditionalWidget(
        condition: isPositiveAsset,
        trueBuilder: (context) => const SizedBox.shrink(),
        falseBuilder: (context) => Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            /// Pre-pay icon
            Image.asset(
              Assets.ASSETS_IMAGES_ARROW_PNG,
              height: AppDimens.verticalL,
              width: AppDimens.horizontalL,
            ),

            /// horizontal spacing
            const SizedBox(width: AppDimens.horizontalXS),

            /// Pre-pay text
            Text(
              AppStrings.prePayLoan,
              style: super.footerTrailingPrePayTextStyle(context),
            )
          ],
        ),
      );
}
