import 'package:flutter/material.dart';

class TextStyleExtensions extends ThemeExtension<TextStyleExtensions> {
  final TextStyle? bold60;

  const TextStyleExtensions({required this.bold60});

  @override
  ThemeExtension<TextStyleExtensions> copyWith({
    TextStyle? bold60,
  }) {
    return TextStyleExtensions(
      bold60: bold60 ?? this.bold60,
    );
  }

  @override
  ThemeExtension<TextStyleExtensions> lerp(covariant ThemeExtension<TextStyleExtensions>? other, double t) {
    if (other is! TextStyleExtensions) {
      return this;
    } else {
      return TextStyleExtensions(bold60: TextStyle.lerp(bold60, other.bold60, t));
    }
  }
}
