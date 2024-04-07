import 'package:flutter/material.dart';

/// A widget that conditionally builds its child based on a boolean condition.
///
/// This widget evaluates a boolean condition and invokes one of two builder
/// functions based on the result of the condition. If the condition is true,
/// the [trueBuilder] function is invoked to build the child widget. If the
/// condition is false, the [falseBuilder] function is invoked instead.
class ConditionalWidget extends StatelessWidget {
  /// Creates a condition widget.
  ///
  /// The [condition] parameter represents the boolean condition to be evaluated.
  /// The [trueBuilder] function is invoked to build the child widget when the
  /// condition is true, and the [falseBuilder] function is invoked when the
  /// condition is false.
  const ConditionalWidget({
    super.key,
    required this.condition,
    required this.trueBuilder,
    required this.falseBuilder,
  });

  /// The boolean condition to be evaluated.
  final bool condition;

  /// The builder function invoked when the condition is true.
  final Function(BuildContext context) trueBuilder;

  /// The builder function invoked when the condition is false.
  final Function(BuildContext context) falseBuilder;

  @override
  Widget build(BuildContext context) {
    if (condition) {
      return trueBuilder(context);
    } else {
      return falseBuilder(context);
    }
  }
}
