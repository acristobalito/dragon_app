import 'package:dragon_store/config/foundations/colors.dart';
import 'package:dragon_store/domain/entities/dragon.dart';
import 'package:dragon_store/domain/entities/dragon_element.dart';
import 'package:dragon_store/ui/providers/dragon_list_provider.dart';
import 'package:dragon_store/ui/screens/form/form_screen.dart';
import 'package:dragon_store/ui/widgets/shared/custom_button.dart';
import 'package:dragon_store/ui/widgets/shared/custom_image.dart';
import 'package:dragon_store/ui/widgets/shared/custom_image_background.dart';
import 'package:dragon_store/ui/widgets/shared/element_item.dart';
import 'package:dragon_store/ui/widgets/shared/text_extension.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class DetailScreen extends StatelessWidget {
  final int indexSend;

  static const String name = 'detail_screen';
  static const String path = '/detail';
  const DetailScreen({super.key, required this.indexSend});

  @override
  Widget build(BuildContext context) {
    final dragonListProvider = context.watch<DragonListProvider>();
    final Dragon dragon = dragonListProvider.dragonsList[indexSend];

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Dragon ${dragon.name}').form(
            size: 25,
            color: ElementDragonUtils.getColorElement(dragon.element)),
      ),
      body: SafeArea(
          child: Stack(
        children: [
          const CustomBackgroundImage(
            pathImage: 'assets/images/escenario.jpeg',
            boxFit: BoxFit.cover,
            opacity: 0.5,
          ),
          _DetailDragonView(dragon, dragonListProvider)
        ],
      )),
    );
  }
}

class _DetailDragonView extends StatelessWidget {
  final Dragon dragon;
  final DragonListProvider dragonListProvider;
  const _DetailDragonView(this.dragon, this.dragonListProvider);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomImageView(
                  element: dragon.element,
                  onlyImage: true,
                  size: 200,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: ElementItemView(element: dragon.element),
                )
              ],
            ),
            const SizedBox(height: 20),
            _CustomContainer(dragon: dragon),
            const SizedBox(height: 20),
            CustomButtonView(
              buttonColor: ColorsFundation.buttonAtackColor!,
              textButton: 'Ataque',
              onClick: () {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(dragon.launchAttack())));
              },
            ),
            const SizedBox(height: 10),
            CustomButtonView(
              buttonColor: ColorsFundation.primaryColor,
              textButton: 'Editar',
              onClick: () {
                context.pushNamed(FormScreen.name, extra: dragon);
              },
            ),
            const SizedBox(height: 10),
            CustomButtonView(
              buttonColor: ColorsFundation.errorColor,
              textButton: 'Eliminar',
              onClick: () {
                context.pop(true);
              },
            )
          ],
        ),
      ),
    );
  }
}

class _CustomContainer extends StatelessWidget {
  final Dragon dragon;

  const _CustomContainer({
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