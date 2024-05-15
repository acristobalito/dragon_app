import 'package:dragon_store/domain/entities/dragon_element_entity.dart';
import 'package:dragon_store/domain/utils/dragon_element_utils.dart';

class DragonEntity {
  final String name;
  final String description;
  final int level;
  final String image;
  final DragonElementEntity element;
  final DragonElementEntity weaknes;

  DragonEntity(
      {required this.description,
      required this.name,
      required this.level,
      required this.element})
      : weaknes = DragonElementUtils.getWeaknesElement(element),
        image = DragonElementUtils.getImageDragon(element);

  String launchAttack() {
    return '${switch (element) {
      DragonElementEntity.earth => 'Terremoto',
      DragonElementEntity.fire => 'Lluvia de meteoritos',
      DragonElementEntity.nature => 'Enredadera venenosa',
      DragonElementEntity.water => 'Tsunami'
    }} lanzado!!!';
  }
}
