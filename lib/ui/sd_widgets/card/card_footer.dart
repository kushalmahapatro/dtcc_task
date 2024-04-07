part of 'card_widget.dart';

/// `CardFooter` is an abstract class that extends `StatelessWidget` and mixes in `_CardStyles`.
/// It represents the footer section of a card widget.
///
abstract class CardFooter extends StatelessWidget with _CardStyles {
  /// The `CardFooter` provides a base for creating card footers with a title, an indicator for positive assets,
  /// and a customizable trailing widget.
  ///
  /// Parameters:
  ///   * `key`: A key that uniquely identifies this widget in the widget tree.
  ///   * `cardFooterTitle`: The title of the card footer.
  ///   * `isPositiveAsset`: A boolean value that indicates whether the asset is positive or not.
  ///
  /// Subclasses must implement the `trailingWidget` method to provide the trailing content of the footer.
  ///
  /// Example of subclass:
  /// ```dart
  /// class CustomCardFooter extends CardFooter {
  ///   const CustomCardFooter({
  ///     super.key,
  ///     required super.cardFooterTitle,
  ///     required super.isPositiveAsset,
  ///   });
  ///
  ///   @override
  ///   Widget trailingWidget(BuildContext context) {
  ///     return Text('Custom trailing content');
  ///   }
  /// }
  /// ```
  const CardFooter({
    super.key,
    required this.cardFooterTitle,
    required this.isPositiveAsset,
  });

  /// The title of the card footer.
  final String cardFooterTitle;

  /// Indicates whether the asset associated with the footer is positive.
  final bool isPositiveAsset;

  /// Generates the widget to be displayed as trailing content in the footer.
  ///
  /// This method returns a widget representing the trailing content of the footer.
  /// Subclasses must implement this method to customize the appearance of the
  /// trailing content based on the specific requirements of the card footer.
  Widget trailingWidget(BuildContext context);

  factory CardFooter.none() => const _NoCardFooter();

  @override
  Widget build(BuildContext context) {
    return Card(
      color: footerColor,
      shape: footerCardShape,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppDimens.horizontalM,
          vertical: AppDimens.verticalM,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            /// Footer title and indicator widget
            Expanded(
              child: Row(
                children: [
                  /// Footer title
                  _footerTitle(context),

                  /// Spacing widget
                  const SizedBox(width: 8),

                  /// Footer indicator
                  _footerIndicator(),
                ],
              ),
            ),

            /// Trailing widget
            Flexible(
              child: trailingWidget(context),
            )
          ],
        ),
      ),
    );
  }

  DecoratedBox _footerIndicator() {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: footerIndicatorColor(isPositive: isPositiveAsset),
        borderRadius: BorderRadius.circular(AppDimens.radiusS),
      ),
      child: const SizedBox(
        width: AppDimens.radiusS,
        height: AppDimens.radiusS,
      ),
    );
  }

  Text _footerTitle(BuildContext context) {
    return Text(
      cardFooterTitle,
      style: footerTitleStyle(context),
    );
  }
}

class _NoCardFooter extends CardFooter {
  const _NoCardFooter()
      : super(key: null, cardFooterTitle: '', isPositiveAsset: true);

  @override
  Widget trailingWidget(BuildContext context) {
    return const SizedBox();
  }

  @override
  Widget build(BuildContext context) {
    return const Row(children: []);
  }
}
