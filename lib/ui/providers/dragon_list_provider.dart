import 'package:dragon_store/domain/entities/dragon.dart';
import 'package:dragon_store/domain/entities/dragon_element.dart';
import 'package:flutter/material.dart';

class DragonListProvider extends ChangeNotifier {
  List<Dragon> dragonsList = [
    Dragon(
        description: 'Prueba',
        name: 'Prueba',
        level: 1,
        element: ElementDragon.earth),
    Dragon(
        description: 'Prueba2',
        name: 'Prueba2',
        level: 2,
        element: ElementDragon.nature),
  ];

  void addDragon(Dragon newDragon) {
    dragonsList.add(newDragon);
    notifyListeners();
  }

  void removeDragon(Dragon dragon) {
    dragonsList.remove(dragon);
    notifyListeners();
  }

  void updateDragon(Dragon newDragon, Dragon tarjetDragon) {
    final position = dragonsList.indexOf(tarjetDragon);
    if (position >= 0) {
      dragonsList[position] = newDragon;
      notifyListeners();
    }
  }
}
