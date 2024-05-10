import 'package:dragon_store/config/foundations/typo.dart';
import 'package:flutter/material.dart';

extension TextExtended on Text {
  Text form(
      {Color? color,
      required double size,
      FontWeight fontW = FontWeight.bold,
      TextAlign textA = TextAlign.center}) {
    return Text(
      data ?? '',
      textAlign: textA,
      style: TextStyle(
          color: color,
          fontFamily: TypographyFoundation.poppinsFontFamily,
          fontWeight: fontW,
          fontSize: size),
    );
  }
}
