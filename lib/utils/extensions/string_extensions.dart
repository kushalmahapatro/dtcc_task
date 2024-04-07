extension StringExtension on String {
  double get toDouble {
    return double.tryParse(replaceAll(RegExp(r'[^0-9.]'), '')) ?? 0.0;
  }
}
