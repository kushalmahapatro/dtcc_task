import 'package:flutter/material.dart';

/// `TextStyleExtension` is an extension on the `TextStyle` class.
///
/// It provides additional properties to get bold, semi-bold, medium, and regular font weights of a text style,
/// and a method to change the color of a text style.
///
/// Example:
/// ```dart
/// TextStyle textStyle = ...;
/// TextStyle boldTextStyle = textStyle.bold;
/// TextStyle semiBoldTextStyle = textStyle.semiBold;
/// TextStyle mediumTextStyle = textStyle.medium;
/// TextStyle regularTextStyle = textStyle.regular;
/// TextStyle coloredTextStyle = textStyle.withColor(Colors.red);
/// ```
extension TextStyleExtension on TextStyle {
  /// Returns a bold variant of the text style.
  ///
  /// The font weight is set to `FontWeight.w700`.
  TextStyle get bold => copyWith(fontWeight: FontWeight.w700);

  /// Returns a semi-bold variant of the text style.
  ///
  /// The font weight is set to `FontWeight.w600`.
  TextStyle get semiBold => copyWith(fontWeight: FontWeight.w600);

  /// Returns a medium variant of the text style.
  ///
  /// The font weight is set to `FontWeight.w500`.
  TextStyle get medium => copyWith(fontWeight: FontWeight.w500);

  /// Returns a regular variant of the text style.
  ///
  /// The font weight is set to `FontWeight.w400`.
  TextStyle get regular => copyWith(fontWeight: FontWeight.w400);

  /// Returns a new text style with the given color.
  ///
  /// The color is set to the provided `Color` value.
  TextStyle withColor(Color color) => copyWith(color: color);
}
