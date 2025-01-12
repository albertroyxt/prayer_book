import 'package:flutter/material.dart';
import 'package:prayer_book/config/theme_extensions/text_style_extensions.dart';
import 'package:prayer_book/constants/app_constants.dart';

final lightTheme = ThemeData(fontFamily: kDefaultFont, extensions: [
  TextStyleExtensions(
    bold60: TextStyle(
      fontFamily: kDefaultFont,
      fontSize: 60,
      fontWeight: FontWeight.bold,
    ),
  ),
]);
