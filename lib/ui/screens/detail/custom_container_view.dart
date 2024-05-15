import 'package:dragon_store/config/foundations/colors.dart';
import 'package:dragon_store/domain/entities/dragon_entity.dart';
import 'package:dragon_store/ui/widgets/shared/element_item_view.dart';
import 'package:dragon_store/ui/widgets/shared/text_extension.dart';
import 'package:flutter/material.dart';

class CustomContainerView extends StatelessWidget {
  final DragonEntity dragon;

  const CustomContainerView({
    super.key,
    required this.dragon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
        child: Column(
          children: [
            Text('Nivel ${dragon.level.toString()}')
                .form(size: 50, color: ColorsFundation.secondaryColor),
            Align(
                alignment: Alignment.centerLeft,
                child: const Text('Descripción').form(size: 17)),
            const SizedBox(height: 10),
            Align(
                alignment: Alignment.centerLeft,
                child: Text(dragon.description).form(
                    size: 17,
                    fontW: FontWeight.w300,
                    textA: TextAlign.justify)),
            const SizedBox(height: 20),
            Align(
                alignment: Alignment.centerLeft,
                child: const Text('Vulnerable a:').form(size: 17)),
            const SizedBox(height: 10),
            ElementItemView(element: dragon.weaknes)
          ],
        ),
      ),
    );
  }
}
