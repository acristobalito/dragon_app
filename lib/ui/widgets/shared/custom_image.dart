import 'package:dragon_store/config/foundations/colors.dart';
import 'package:dragon_store/domain/entities/dragon_element.dart';
import 'package:flutter/material.dart';

class CustomImageView extends StatelessWidget {
  final ElementDragon element;
  final bool onlyImage;
  final double size;
  const CustomImageView(
      {super.key,
      required this.element,
      this.onlyImage = false,
      this.size = 100});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: !onlyImage
              ? ElementDragonUtils.getColorElement(element).withOpacity(0.5)
              : null,
          border: !onlyImage
              ? Border.all(color: ColorsFundation.secondaryColor, width: 3)
              : null,
          borderRadius: const BorderRadius.all(Radius.circular(25)),
        ),
        child: Image(
          image: AssetImage(ElementDragonUtils.getImageDragon(element)),
          height: size,
          width: size,
        ),
      ),
    );
  }
}
