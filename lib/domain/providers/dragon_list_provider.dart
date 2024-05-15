import 'package:dragon_store/domain/entities/dragon_entity.dart';
import 'package:dragon_store/domain/entities/dragon_element_entity.dart';
import 'package:flutter/material.dart';

class DragonListProvider extends ChangeNotifier {
  List<DragonEntity> dragonsList = [
    DragonEntity(
        description: 'Prueba largaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa',
        name: 'Prueba largaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa',
        level: 1,
        element: DragonElementEntity.earth),
    DragonEntity(
        description: 'Prueba2',
        name: 'Prueba2',
        level: 2,
        element: DragonElementEntity.nature),
  ];
  bool isOnBoardingComplete = false;

  void addDragon(DragonEntity newDragon) {
    dragonsList.add(newDragon);
    notifyListeners();
  }

  void removeDragon(DragonEntity dragon) {
    dragonsList.remove(dragon);
    notifyListeners();
  }

  void updateDragon(DragonEntity newDragon, DragonEntity tarjetDragon) {
    final position = dragonsList.indexOf(tarjetDragon);
    if (position >= 0) {
      dragonsList[position] = newDragon;
      notifyListeners();
    }
  }

  void setOnBoardingComplete() {
    isOnBoardingComplete = true;
    notifyListeners();
  }
}
