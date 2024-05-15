import 'package:dragon_store/config/foundations/colors.dart';
import 'package:dragon_store/domain/entities/form_screen_params.dart';
import 'package:dragon_store/domain/providers/detail_provider.dart';
import 'package:dragon_store/ui/screens/detail/custom_container_view.dart';
import 'package:dragon_store/ui/screens/form/form_screen.dart';
import 'package:dragon_store/ui/widgets/custom_buttons/custom_button.dart';
import 'package:dragon_store/ui/widgets/shared/custom_image_view.dart';
import 'package:dragon_store/ui/widgets/shared/element_item_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DetailDragonView extends StatelessWidget {
  final DetailProvider descriptionProvider;
  const DetailDragonView(this.descriptionProvider, {super.key});

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
                  element: descriptionProvider.dragonSend.element,
                  onlyImage: true,
                  size: 200,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: ElementItemView(
                      element: descriptionProvider.dragonSend.element),
                )
              ],
            ),
            const SizedBox(height: 20),
            CustomContainerView(dragon: descriptionProvider.dragonSend),
            const SizedBox(height: 20),
            CustomButtonView(
              buttonColor: ColorsFundation.buttonAtackColor!,
              textButton: 'Ataque',
              onClick: () {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content:
                        Text(descriptionProvider.dragonSend.launchAttack())));
              },
            ),
            const SizedBox(height: 10),
            CustomButtonView(
              buttonColor: ColorsFundation.primaryColor,
              textButton: 'Editar',
              onClick: () {
                context.pushNamed(FormScreen.name,
                    extra: FormScreenParams(
                        fromHome: false,
                        dragon: descriptionProvider.dragonSend,
                        detailProvider: descriptionProvider));
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
