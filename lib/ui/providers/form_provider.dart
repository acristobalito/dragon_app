import 'package:dragon_store/domain/entities/dragon.dart';
import 'package:dragon_store/domain/entities/dragon_element.dart';
import 'package:flutter/material.dart';

class FormProvider extends ChangeNotifier {
  String nameDragon = '', description = '', level = '';
  ElementDragon elementSelected = ElementDragon.earth;
  bool hasGetParameters = false;

  void getParameters(Dragon? dragon) {
    if (dragon != null && !hasGetParameters) {
      nameDragon = dragon.name;
      description = dragon.description;
      level = dragon.level.toString();
      elementSelected = dragon.element;
      hasGetParameters = true;
    }
  }

  Dragon? createDragon() {
    if (nameDragon.isEmpty || description.isEmpty || level.isEmpty) return null;
    return Dragon(
        description: description,
        name: nameDragon,
        level: int.parse(level),
        element: elementSelected);
  }

  void updateElement(ElementDragon newElement) {
    elementSelected = newElement;
    notifyListeners();
  }

  void setNameDragon(String nameDragon) {
    this.nameDragon = nameDragon;
    notifyListeners();
  }

  void setDescriptionDragon(String descriptionDragon) {
    description = descriptionDragon;
    notifyListeners();
  }

  void setLevelDragon(String levelDragon) {
    level = levelDragon;
    notifyListeners();
  }
}
