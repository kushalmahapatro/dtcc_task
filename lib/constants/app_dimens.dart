/// `AppDimens` is a class that provides a set of constants used for defining dimensions throughout the application.
///
/// This class is not meant to be instantiated or extended; this class is a way to namespace or "scope" the dimension constants.
///
/// The `AppDimens` class provides the following dimension constants:
///   * `radiusS`, `radiusM`: The small and medium radius values used for rounding corners.
///   * `horizontalXS`, `horizontalS`, `horizontalM`, `horizontalL`, `horizontalXL`: The extra small, small, medium, large, and extra large horizontal padding or margin values.
///   * `verticalS`, `verticalM`, `verticalL`, `verticalXL`: The small, medium, large, and extra large vertical padding or margin values.
///
/// Example:
/// ```dart
/// Container(
///   margin: EdgeInsets.all(AppDimens.horizontalM),
///   child: Text('Hello, World!'),
/// )
/// ```
class AppDimens {
  const AppDimens._();

  /// Border Radius - 8
  static const double radiusS = 8;

  /// Border Radius - 12
  static const double radiusM = 12;

  /// 4
  static const double horizontalXS = 4;

  /// 8
  static const double horizontalS = 8;

  /// 12
  static const double horizontalM = 12;

  /// 16
  static const double horizontalL = 16;

  /// 24
  static const double horizontalXL = 24;

  /// 5
  static const double verticalS = 5;

  /// 8
  static const double verticalM = 8;

  /// 16
  static const double verticalL = 16;

  /// 12
  static const double verticalXL = 20;

  /// 45
  static const double verticalXXL = 45;
}
