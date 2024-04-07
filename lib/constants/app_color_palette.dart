import 'dart:ui';

/// `AppColorPalette` is a class that provides a palette of colors used throughout the application.
///
/// This class is not meant to be instantiated or extended; this class is a way to namespace or "scope" the color constants.
///
/// The `AppColorPalette` class provides the following color constants:
///   * `primaryText`: The primary text color used in the application.
///   * `secondaryText`: The secondary text color used in the application.
///   * `tertiaryText`: The tertiary text color used in the application.
///   * `accountCardGradient1`, `accountCardGradient2`, `accountCardGradient3`: The gradient colors used for the background of account cards.
///   * `creditCardGradient1`, `creditCardGradient2`, `creditCardGradient3`: The gradient colors used for the background of credit cards.
///   * `loanCardGradient1`, `loanCardGradient2`, `loanCardGradient3`: The gradient colors used for the background of loan cards.
///   * `positiveGreen`: The color used to represent positive values or increases.
///   * `negativeRed`: The color used to represent negative values or decreases.
///
/// Example:
/// ```dart
/// Container(
///   color: AppColorPalette.primaryText,
///   child: Text('Hello, World!'),
/// )
/// ```
class AppColorPalette {
  const AppColorPalette._();

  /// #FFFFFF / Color(0xFFFFFFFF)
  static const Color primaryText = Color(0xFFFFFFFF);

  /// #687684 / Color(0xFF687684)
  static const Color secondaryText = Color(0xFF687684);

  /// #14865F / Color(0xFF14865F)
  static const Color tertiaryText = Color(0xFF14865F);

  /// #0C6B5D / Color(0xFF0C6B5D)
  static const Color accountCardGradient1 = Color(0xFF0C6B5D);

  /// #1CA677 / Color(0xFF1CA677)
  static const Color accountCardGradient2 = Color(0xFF1CA677);

  /// #EAFABC / Color(0xFFEAFABC)
  static const Color accountCardGradient3 = Color(0xFFEAFABC);

  /// #25797C / Color(0xFF25797C)
  static const Color creditCardGradient1 = Color(0xFF25797C);

  /// #6DA0BC / Color(0xFF6DA0BC)
  static const Color creditCardGradient2 = Color(0xFF6DA0BC);

  /// #E6C5FF / Color(0xFFE6C5FF)
  static const Color creditCardGradient3 = Color(0xFFE6C5FF);

  /// #995B12 / Color(0xFF995B12)
  static const Color loanCardGradient1 = Color(0xFF995B12);

  /// #DDC18A / Color(0xFFDDC18A)
  static const Color loanCardGradient2 = Color(0xFFDDC18A);

  /// #E0E378 / Color(0xFFE0E378)
  static const Color loanCardGradient3 = Color(0xFFE0E378);

  /// #74CD3B / Color(0xFF74CD3B)
  static const Color positiveGreen = Color(0xFF74CD3B);

  /// #E87171 / Color(0xFFE87171)
  static const Color negativeRed = Color(0xFFE87171);
}
