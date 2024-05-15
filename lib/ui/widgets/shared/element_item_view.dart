import 'package:dragon_store/domain/entities/dragon_element_entity.dart';
import 'package:dragon_store/domain/utils/dragon_element_utils.dart';
import 'package:flutter/material.dart';

class ElementItemView extends StatelessWidget {
  final DragonElementEntity element;
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
                DragonElementUtils.getColorElement(element).withOpacity(0.5)),
        child: Image(
          image: AssetImage(DragonElementUtils.getIcon(element)),
          height: 40,
          width: 40,
        ),
      ),
    );
  }
}
