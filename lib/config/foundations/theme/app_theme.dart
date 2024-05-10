import 'package:dragon_store/config/foundations/colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  ThemeData getTheme() => ThemeData(
      colorSchemeSeed: ColorsFundation.secondaryColor,
      appBarTheme: const AppBarTheme(centerTitle: false));
}
