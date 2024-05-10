import 'package:dragon_store/domain/entities/dragon_element.dart';

class Dragon {
  final String name;
  final String description;
  final int level;
  final String image;
  final ElementDragon element;
  final ElementDragon weaknes;

  Dragon(
      {required this.description,
      required this.name,
      required this.level,
      required this.element})
      : weaknes = ElementDragonUtils.getWeaknesElement(element),
        image = ElementDragonUtils.getImageDragon(element);

  String launchAttack() {
    return '${switch (element) {
      ElementDragon.earth => 'Terremoto',
      ElementDragon.fire => 'Lluvia de meteoritos',
      ElementDragon.nature => 'Enredadera venenosa',
      ElementDragon.water => 'Tsunami'
    }} lanzado!!!';
  }
}
