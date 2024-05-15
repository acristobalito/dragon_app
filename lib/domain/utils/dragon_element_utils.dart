import 'package:dragon_store/domain/entities/dragon_element_entity.dart';
import 'package:flutter/material.dart';

class DragonElementUtils {
  static Color getColorElement(DragonElementEntity elementDragon) {
    return switch (elementDragon) {
      DragonElementEntity.earth => Colors.brown,
      DragonElementEntity.fire => Colors.red,
      DragonElementEntity.water => Colors.blue,
      DragonElementEntity.nature => Colors.green
    };
  }

  static String getStringElement(DragonElementEntity elementDragon) {
    return switch (elementDragon) {
      DragonElementEntity.earth => 'Tierra',
      DragonElementEntity.fire => 'Fuego',
      DragonElementEntity.water => 'Agua',
      DragonElementEntity.nature => 'Naturaleza'
    };
  }

  static DragonElementEntity getWeaknesElement(
      DragonElementEntity elementDragon) {
    return switch (elementDragon) {
      DragonElementEntity.earth => DragonElementEntity.fire,
      DragonElementEntity.fire => DragonElementEntity.nature,
      DragonElementEntity.nature => DragonElementEntity.water,
      DragonElementEntity.water => DragonElementEntity.fire
    };
  }

  static String getIcon(DragonElementEntity elementDragon) {
    return 'assets/icons/${switch (elementDragon) {
      DragonElementEntity.earth => 'earthicon',
      DragonElementEntity.fire => 'fireicon',
      DragonElementEntity.water => 'watericon',
      DragonElementEntity.nature => 'natureicon'
    }}.png';
  }

  static String getImageDragon(DragonElementEntity elementDragon) {
    return 'assets/images/${switch (elementDragon) {
      DragonElementEntity.earth => 'earthdragon',
      DragonElementEntity.fire => 'firedragon',
      DragonElementEntity.nature => 'naturedragon',
      DragonElementEntity.water => 'waterdragon'
    }}.jpeg';
  }
}
