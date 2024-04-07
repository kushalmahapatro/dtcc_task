import 'dart:ui';

/// `ColorExtension` is an extension on the `Color` class.
///
/// It provides additional properties to get medium and light variants of a color
/// which is handled with the change in the opacity if the color.
///
/// Example:
/// ```dart
/// Color color = Colors.red;
/// Color mediumColor = color.medium;
/// Color lightColor = color.light;
/// ```
extension ColorExtension on Color {
  /// Returns a medium opacity variant of the color.
  ///
  /// The opacity is set to 0.7.
  Color get medium => withOpacity(0.7);

  /// Returns a light opacity variant of the color.
  ///
  /// The opacity is set to 0.4.
  Color get light => withOpacity(0.4);
}
