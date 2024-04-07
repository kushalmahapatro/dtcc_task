import 'package:dtcc_task/constants/app_font_sizes.dart';
import 'package:flutter/material.dart';

/// `BuildContextExtension` is an extension on the `BuildContext` class.
///
/// It provides additional properties to get large, medium, and small text styles from the current theme.
///
/// Example:
/// ```dart
/// BuildContext context = ...;
/// TextStyle largeTextStyle = context.large;
/// TextStyle mediumTextStyle = context.medium;
/// TextStyle smallTextStyle = context.small;
/// ```
extension BuildContextExtension on BuildContext {
  /// Private getter to access the `TextTheme` of the current theme.
  TextTheme get _theme => Theme.of(this).textTheme;

  /// Returns a large text style from the current theme.
  ///
  /// The font size is set to `AppFontSizes.large`.
  TextStyle get large => _theme.bodyLarge!.copyWith(
        fontSize: AppFontSizes.large,
      );

  /// Returns a medium text style from the current theme.
  ///
  /// The font size is set to `AppFontSizes.medium`.
  TextStyle get medium => _theme.bodyMedium!.copyWith(
        fontSize: AppFontSizes.medium,
      );

  /// Returns a small text style from the current theme.
  ///
  /// The font size is set to `AppFontSizes.small`.
  TextStyle get small => _theme.bodySmall!.copyWith(
        fontSize: AppFontSizes.small,
      );
}
