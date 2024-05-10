import 'package:flutter/material.dart';

class CustomBackgroundImage extends StatelessWidget {
  final String pathImage;
  final BoxFit? boxFit;
  final double opacity;
  const CustomBackgroundImage(
      {super.key, required this.pathImage, this.boxFit, this.opacity = 0.2});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      pathImage,
      height: double.infinity,
      width: double.infinity,
      color: Colors.white.withOpacity(opacity),
      colorBlendMode: BlendMode.modulate,
      fit: boxFit,
    );
  }
}
