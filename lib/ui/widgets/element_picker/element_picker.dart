import 'package:dragon_store/domain/entities/dragon_element_entity.dart';
import 'package:dragon_store/domain/utils/dragon_element_utils.dart';
import 'package:flutter/material.dart';

class ElementPicker extends StatelessWidget {
  final List<DragonElementEntity> elements;
  final Function(DragonElementEntity) onSelectElement;

  const ElementPicker(
      {super.key, required this.elements, required this.onSelectElement});

  @override
  Widget build(BuildContext context) {
    final List<Widget> elementsWidgets = [];
    for (var element in elements) {
      elementsWidgets.add(_CustomButtonIcon(
        element: element,
        onClick: () {
          onSelectElement.call(element);
        },
      ));
    }
    return SizedBox(
      width: double.infinity,
      child: Wrap(
        alignment: WrapAlignment.center,
        spacing: 30,
        children: elementsWidgets,
      ),
    );
  }
}

class _CustomButtonIcon extends StatelessWidget {
  final DragonElementEntity element;
  final VoidCallback onClick;

  const _CustomButtonIcon({
    required this.element,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: Material(
        color: DragonElementUtils.getColorElement(element).withOpacity(0.5),
        child: InkWell(
            onTap: () {
              onClick.call();
            },
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Image(
                image: AssetImage(DragonElementUtils.getIcon(element)),
                height: 40,
                width: 40,
              ),
            )),
      ),
    );
  }
}
