import 'package:avatar_stack/avatar_stack.dart';
import 'package:avatar_stack/positions.dart';
import 'package:flutter/material.dart';

/// `HorizontalOverlapWidget` is a stateless widget that extends the `AvatarStack` widget.
/// It represents a horizontal stack of avatars with an overlap effect.
///
class HorizontalOverlapWidget extends StatelessWidget {
  /// The `HorizontalOverlapWidget` displays a list of images as avatars, with a specified height and optional border color.
  ///
  /// Parameters:
  ///   * `key`: A key that uniquely identifies this widget in the widget tree.
  ///   * `children`: A list of `ImageProvider<Object>` that provides the images for the avatars.
  ///   * `height`: The height of the avatars.
  ///   * `borderColor`: The color of the border around the avatars. This is optional.
  ///
  /// Example:
  /// ```dart
  /// HorizontalOverlapWidget(
  ///   key: UniqueKey(),
  ///   children: [
  ///     NetworkImage('https://example.com/image1.png'),
  ///     NetworkImage('https://example.com/image2.png'),
  ///     NetworkImage('https://example.com/image3.png'),
  ///   ],
  ///   height: 50.0,
  ///   borderColor: Colors.blue,
  /// )
  /// ```
  const HorizontalOverlapWidget({
    super.key,
    required this.children,
    required this.height,
    this.borderColor,
  });

  /// A list of `ImageProvider<Object>` that provides the images for the avatars.
  final List<ImageProvider<Object>> children;

  /// The height of the avatars.
  final double height;

  /// The color of the border around the avatars. This is optional.
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return AvatarStack(
      height: height,
      borderWidth: 1,
      borderColor: borderColor,
      settings: RestrictedPositions(
        minCoverage: 0.3,
        align: StackAlign.right,
        laying: StackLaying.first,
      ),
      avatars: children,
    );
  }
}
