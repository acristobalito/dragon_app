import 'package:dragon_store/domain/entities/dragon_entity.dart';
import 'package:dragon_store/domain/entities/dragon_element_entity.dart';
import 'package:flutter/material.dart';

class FormProvider extends ChangeNotifier {
  String? nameDragon, description, level;
  DragonElementEntity elementSelected = DragonElementEntity.earth;
  bool hasGetParameters = false;

  void getParameters(DragonEntity? dragon) {
    if (dragon != null && !hasGetParameters) {
      nameDragon = dragon.name;
      description = dragon.description;
      level = dragon.level.toString();
      elementSelected = dragon.element;
      hasGetParameters = true;
    }
  }

  DragonEntity? createDragon() {
    if (nameDragon?.isEmpty == true ||
        description?.isEmpty == true ||
        level?.isEmpty == true) return null;
    return DragonEntity(
        description: description!,
        name: nameDragon!,
        level: int.parse(level!),
        element: elementSelected);
  }

  void updateElement(DragonElementEntity newElement) {
    elementSelected = newElement;
    notifyListeners();
  }

  void setNameDragon(String nameDragon) {
    this.nameDragon = nameDragon;
  }

  void setDescriptionDragon(String descriptionDragon) {
    description = descriptionDragon;
  }

  void setLevelDragon(String levelDragon) {
    level = levelDragon;
  }
}
