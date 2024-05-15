import 'package:dragon_store/config/foundations/colors.dart';
import 'package:dragon_store/domain/entities/dragon_element_entity.dart';
import 'package:dragon_store/domain/entities/dragon_entity.dart';
import 'package:dragon_store/domain/providers/detail_provider.dart';
import 'package:dragon_store/domain/providers/dragon_list_provider.dart';
import 'package:dragon_store/domain/providers/form_provider.dart';
import 'package:dragon_store/domain/utils/dragon_element_utils.dart';
import 'package:dragon_store/ui/widgets/element_picker/element_picker.dart';
import 'package:dragon_store/ui/widgets/inputs/custom_edit_text.dart';
import 'package:dragon_store/ui/widgets/custom_buttons/custom_button.dart';
import 'package:dragon_store/ui/widgets/shared/custom_image_view.dart';
import 'package:dragon_store/ui/widgets/shared/element_item_view.dart';
import 'package:dragon_store/ui/widgets/shared/text_extension.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class DragonFormView extends StatelessWidget {
  final DragonEntity? dragon;
  final DetailProvider? detailProvider;
  final bool? fromHome;
  const DragonFormView(
      {super.key, this.dragon, this.fromHome, this.detailProvider});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final dragonListProvider = context.read<DragonListProvider>();
    final formProvider = context.watch<FormProvider>();
    formProvider.getParameters(dragon);
    return Form(
      key: formKey,
      child: Container(
        padding: const EdgeInsetsDirectional.symmetric(horizontal: 30),
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: const Text('¡Eclosiona un nuevo dragón!').form(
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
                  if (value != null) {
                    formProvider.setNameDragon(value);
                  }
                },
              ),
              const SizedBox(
                height: 10,
              ),
              const Text('Descripción:').form(size: 15),
              const SizedBox(
                height: 10,
              ),
              CustomEditText(
                initialText: formProvider.description,
                hintText: 'Describe aquí a tu nuevo dragón',
                lines: 3,
                onChangeValue: (value) {
                  if (value != null) {
                    formProvider.setDescriptionDragon(value);
                  }
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
                  if (value != null) {
                    formProvider.setLevelDragon(value);
                  }
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
                  elements: DragonElementEntity.values,
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
                element: DragonElementUtils.getWeaknesElement(
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
                  if (formKey.currentState!.validate()) {
                    final newDragon = formProvider.createDragon();
                    if (newDragon == null) return;
                    if (dragon != null) {
                      dragonListProvider.updateDragon(newDragon, dragon!);
                      if (fromHome != true) {
                        detailProvider?.updateParameters(newDragon);
                      }
                    } else {
                      dragonListProvider.addDragon(newDragon);
                    }
                    context.pop();
                  }
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
      ),
    );
  }
}
