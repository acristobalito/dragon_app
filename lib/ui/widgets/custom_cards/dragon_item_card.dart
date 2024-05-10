import 'package:dragon_store/config/foundations/typo.dart';
import 'package:dragon_store/domain/entities/dragon.dart';
import 'package:dragon_store/domain/entities/dragon_element.dart';
import 'package:flutter/material.dart';

class DragonItemCard extends StatelessWidget {
  final Dragon dragon;
  final VoidCallback onTap;
  const DragonItemCard({super.key, required this.dragon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: () {
          onTap.call();
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: Transform.flip(
                  flipX: true,
                  child: Image(
                    image: AssetImage(dragon.image),
                    height: 80,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _InfoViewText(
                      subLabel: 'Nombre',
                      data: dragon.name,
                    ),
                    _InfoViewText(
                      subLabel: 'Nivel',
                      data: dragon.level.toString(),
                    ),
                    _ElementViewText(
                      subLabel: 'Elemento',
                      element: dragon.element,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _InfoViewText extends StatelessWidget {
  final String subLabel, data;
  const _InfoViewText({
    required this.subLabel,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Align(
          alignment: Alignment.bottomCenter,
          child: Text(
            '$subLabel: ',
            style: const TextStyle(
                fontFamily: TypographyFoundation.poppinsFontFamily,
                fontWeight: FontWeight.w400,
                fontSize: 12),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Text(
            data,
            style: const TextStyle(
                fontFamily: TypographyFoundation.poppinsFontFamily,
                fontWeight: FontWeight.w600,
                fontSize: 15),
          ),
        )
      ],
    );
  }
}

class _ElementViewText extends StatelessWidget {
  final String subLabel;
  final ElementDragon element;
  const _ElementViewText({required this.subLabel, required this.element});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Align(
          alignment: Alignment.bottomCenter,
          child: Text(
            '$subLabel: ',
            style: const TextStyle(
                fontFamily: TypographyFoundation.poppinsFontFamily,
                fontWeight: FontWeight.w400,
                fontSize: 12),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Text(
            ElementDragonUtils.getStringElement(element),
            style: TextStyle(
                fontFamily: TypographyFoundation.poppinsFontFamily,
                fontWeight: FontWeight.w600,
                fontSize: 15,
                color: ElementDragonUtils.getColorElement(element)),
          ),
        )
      ],
    );
  }
}
