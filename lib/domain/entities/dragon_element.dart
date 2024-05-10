import 'package:flutter/material.dart';

enum ElementDragon { earth, fire, water, nature }

class ElementDragonUtils {
  static Color getColorElement(ElementDragon elementDragon) {
    return switch (elementDragon) {
      ElementDragon.earth => Colors.brown,
      ElementDragon.fire => Colors.red,
      ElementDragon.water => Colors.blue,
      ElementDragon.nature => Colors.green
    };
  }

  static String getStringElement(ElementDragon elementDragon) {
    return switch (elementDragon) {
      ElementDragon.earth => 'Tierra',
      ElementDragon.fire => 'Fuego',
      ElementDragon.water => 'Agua',
      ElementDragon.nature => 'Naturaleza'
    };
  }

  static ElementDragon getWeaknesElement(ElementDragon elementDragon) {
    return switch (elementDragon) {
      ElementDragon.earth => ElementDragon.fire,
      ElementDragon.fire => ElementDragon.nature,
      ElementDragon.nature => ElementDragon.water,
      ElementDragon.water => ElementDragon.fire
    };
  }

  static String getIcon(ElementDragon elementDragon) {
    return 'assets/icons/${switch (elementDragon) {
      ElementDragon.earth => 'earthicon',
      ElementDragon.fire => 'fireicon',
      ElementDragon.water => 'watericon',
      ElementDragon.nature => 'natureicon'
    }}.png';
  }

  static String getImageDragon(ElementDragon elementDragon) {
    return 'assets/images/${switch (elementDragon) {
      ElementDragon.earth => 'earthdragon',
      ElementDragon.fire => 'firedragon',
      ElementDragon.nature => 'naturedragon',
      ElementDragon.water => 'waterdragon'
    }}.jpeg';
  }
}
