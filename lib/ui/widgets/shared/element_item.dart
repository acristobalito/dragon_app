import 'package:dragon_store/domain/entities/dragon_element.dart';
import 'package:flutter/material.dart';

class ElementItemView extends StatelessWidget {
  final ElementDragon element;
  const ElementItemView({super.key, required this.element});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(25)),
            color:
                ElementDragonUtils.getColorElement(element).withOpacity(0.5)),
        child: Image(
          image: AssetImage(ElementDragonUtils.getIcon(element)),
          height: 40,
          width: 40,
        ),
      ),
    );
  }
}
