import 'package:dragon_store/config/foundations/colors.dart';
import 'package:dragon_store/config/foundations/typo.dart';
import 'package:dragon_store/domain/entities/dragon.dart';
import 'package:dragon_store/domain/entities/dragon_element.dart';
import 'package:dragon_store/domain/entities/form_screen_params.dart';
import 'package:dragon_store/ui/providers/detail_provider.dart';
import 'package:dragon_store/ui/providers/dragon_list_provider.dart';
import 'package:dragon_store/ui/providers/form_provider.dart';
import 'package:dragon_store/ui/widgets/element_picker/element_picker.dart';
import 'package:dragon_store/ui/widgets/inputs/custom_edit_text.dart';
import 'package:dragon_store/ui/widgets/shared/custom_button.dart';
import 'package:dragon_store/ui/widgets/shared/custom_image.dart';
import 'package:dragon_store/ui/widgets/shared/custom_image_background.dart';
import 'package:dragon_store/ui/widgets/shared/element_item.dart';
import 'package:dragon_store/ui/widgets/shared/text_extension.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class FormScreen extends StatelessWidget {
  final FormScreenParams? params;
  static const String name = 'form_screen';
  static const String path = '/form';
  const FormScreen({super.key, this.params});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => FormProvider(),
        )
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Arbol de cría',
            style: TextStyle(
                fontFamily: TypographyFoundation.poppinsFontFamily,
                fontWeight: FontWeight.w500),
          ),
        ),
        body: SafeArea(
          child: Stack(
            children: [
              const CustomBackgroundImage(
                  pathImage: 'assets/images/arbolcria.jpeg'),
              _DragonFormView(
                  dragon: params?.dragon, fromHome: params?.fromHome)
            ],
          ),
        ),
      ),
    );
  }
}

class _DragonFormView extends StatelessWidget {
  final Dragon? dragon;
  final bool? fromHome;
  const _DragonFormView({this.dragon, this.fromHome});

  @override
  Widget build(BuildContext context) {
    final dragonListProvider = context.watch<DragonListProvider>();
    final detailProvider = context.watch<DetailProvider>();
    final formProvider = context.watch<FormProvider>();
    formProvider.getParameters(dragon);
    return Container(
      padding: const EdgeInsetsDirectional.symmetric(horizontal: 30),
      height: double.infinity,
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.center,
              child: const Text('¡Eclosiona un nuevo dragon!').form(
                  color: const Color.fromARGB(255, 210, 189, 2), size: 24),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text('Nombre:').form(size: 15),
            const SizedBox(
              height: 10,
            ),
            CustomEditText(
              initialText: formProvider.nameDragon,
              hintText: 'Escribe un nombre a tu nuevo dragon',
              onChangeValue: (value) {
                formProvider.setNameDragon(value);
              },
            ),
            const SizedBox(
              height: 10,
            ),
            const Text('Descripcion:').form(size: 15),
            CustomEditText(
              initialText: formProvider.description,
              hintText: 'Describe aqui a tu nuevo dragon',
              lines: 3,
              onChangeValue: (value) {
                formProvider.setDescriptionDragon(value);
              },
            ),
            const SizedBox(
              height: 10,
            ),
            const Text('Nivel:').form(size: 15),
            const SizedBox(
              height: 10,
            ),
            CustomEditText(
              initialText: formProvider.level,
              hintText: 'Del 1 al 100',
              keyBoardType: TextInputType.number,
              onChangeValue: (value) {
                formProvider.setLevelDragon(value);
              },
            ),
            const SizedBox(
              height: 10,
            ),
            const Text('Selecciona un elemento:').form(size: 15),
            const SizedBox(
              height: 10,
            ),
            ElementPicker(
                elements: ElementDragon.values,
                onSelectElement: (element) {
                  formProvider.updateElement(element);
                }),
            const SizedBox(
              height: 10,
            ),
            CustomImageView(
              element: formProvider.elementSelected,
            ),
            const SizedBox(
              height: 10,
            ),
            const Text('Vulnerable a:').form(size: 15),
            const SizedBox(
              height: 10,
            ),
            ElementItemView(
              element: ElementDragonUtils.getWeaknesElement(
                  formProvider.elementSelected),
            ),
            const SizedBox(
              height: 20,
            ),
            CustomButtonView(
              buttonColor: dragon != null
                  ? ColorsFundation.primaryColor
                  : ColorsFundation.secondaryColor,
              textButton: dragon != null ? 'Editar' : 'Guardar',
              onClick: () {
                final newDragon = formProvider.createDragon();
                if (newDragon == null) return;
                if (dragon != null) {
                  dragonListProvider.updateDragon(newDragon, dragon!);
                  if (fromHome != true) {
                    detailProvider.updateParameters(newDragon);
                  }
                } else {
                  dragonListProvider.addDragon(newDragon);
                }
                context.pop();
              },
            ),
            const SizedBox(
              height: 10,
            ),
            CustomButtonView(
              buttonColor: ColorsFundation.errorColor,
              textButton: 'Cancelar',
              onClick: () {
                context.pop();
              },
            )
          ],
        ),
      ),
    );
  }
}
