part of 'card_widget.dart';

/// `_CardStyles` is a mixin that provides common styles, gradients, colors, shapes, and decorations
/// used in card widgets.
///
/// It provides methods to get text styles for various parts of a card widget, such as the primary balance,
/// the decimal part of the balance, the secondary balance, the account card increment, the title, the name,
/// the footer title, the trailing text in the footer, and the pre-pay trailing text in the footer.
///
/// Each method takes a `BuildContext` and returns a `TextStyle`.
///
/// Example:
/// ```dart
/// class CustomCardWidget extends CardWidget with _CardStyles {
///   ...
///   @override
///   Widget build(BuildContext context) {
///     return Text(
///       '1234.56',
///       style: balanceStyle(context),
///     );
///   }
/// }
/// ```
mixin _CardStyles {
  /// Returns the text style for the primary balance.
  TextStyle balanceStyle(BuildContext context) => context.large.bold.withColor(
        AppColorPalette.primaryText,
      );

  /// Returns the text style for the decimal part of the balance.
  TextStyle balanceDecimalStyle(BuildContext context) =>
      context.large.regular.withColor(
        AppColorPalette.primaryText.light,
      );

  /// Returns the text style for the secondary balance.
  TextStyle secondaryBalanceStyle(BuildContext context) =>
      context.medium.semiBold.withColor(
        AppColorPalette.primaryText.medium,
      );

  /// Returns the text style for the account card increment.
  TextStyle accountCardIncrementStyle(BuildContext context) =>
      context.medium.semiBold.withColor(
        AppColorPalette.primaryText,
      );

  /// Returns the text style for the title.
  TextStyle titleStyle(BuildContext context) => context.medium.medium.withColor(
        AppColorPalette.primaryText.medium,
      );

  /// Returns the text style for the name.
  TextStyle nameStyle(BuildContext context) => context.small.medium.withColor(
        AppColorPalette.primaryText.light,
      );

  /// Returns the text style for the footer title.
  TextStyle footerTitleStyle(BuildContext context) =>
      context.medium.medium.withColor(
        AppColorPalette.secondaryText,
      );

  /// Returns the text style for the trailing text in the footer.
  TextStyle footerTrailingTextStyle(BuildContext context) =>
      context.small.medium.withColor(
        AppColorPalette.secondaryText.medium,
      );

  /// Returns the text style for the pre-pay trailing text in the footer.
  TextStyle footerTrailingPrePayTextStyle(BuildContext context) =>
      context.small.bold.withColor(
        AppColorPalette.tertiaryText,
      );

  LinearGradient _gradient({required List<Color> colors}) => LinearGradient(
        colors: colors,
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      );

  Gradient get _accountCardGradient => _gradient(
        colors: const [
          AppColorPalette.accountCardGradient1,
          AppColorPalette.accountCardGradient2,
          AppColorPalette.accountCardGradient3,
        ],
      );
  Gradient get _creditCardGradient => _gradient(
        colors: const [
          AppColorPalette.creditCardGradient1,
          AppColorPalette.creditCardGradient2,
          AppColorPalette.creditCardGradient3,
        ],
      );
  Gradient get _loanCardGradient => _gradient(
        colors: const [
          AppColorPalette.loanCardGradient1,
          AppColorPalette.loanCardGradient2,
          AppColorPalette.loanCardGradient3,
        ],
      );

  /// Retrieves the appropriate gradient based on the card type.
  Gradient cardGradient(CardType cardType) => switch (cardType) {
        CardType.accountCard => _accountCardGradient,
        CardType.creditCard => _creditCardGradient,
        CardType.loanCard => _loanCardGradient,
      };

  /// Retrieves the color for the footer indicator based on whether it's positive or negative.
  Color footerIndicatorColor({bool isPositive = false}) =>
      isPositive ? AppColorPalette.positiveGreen : AppColorPalette.negativeRed;

  /// Retrieves the footer text color.
  Color get footerColor => AppColorPalette.primaryText;

  /// Retrieves the shape for the footer card.
  RoundedRectangleBorder get footerCardShape => RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppDimens.radiusS),
      );

  /// Retrieves the shape for the general card.
  RoundedRectangleBorder get cardShape => RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppDimens.radiusM),
      );

  /// Retrieves the margins for the card.
  EdgeInsets get cardMargin => const EdgeInsets.symmetric(
        horizontal: AppDimens.horizontalS,
      );

  /// Retrieves the padding for the card.
  EdgeInsets get cardPadding => const EdgeInsets.symmetric(
        horizontal: AppDimens.horizontalXL,
        vertical: AppDimens.verticalXL,
      );

  /// Retrieves the decoration for the card based on its type.
  Decoration cardDecoration(CardType cardType) => BoxDecoration(
        gradient: cardGradient(cardType),
        borderRadius: BorderRadius.circular(AppDimens.radiusM),
      );
}
