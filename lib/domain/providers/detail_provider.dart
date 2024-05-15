import 'package:dragon_store/domain/entities/dragon_entity.dart';
import 'package:flutter/material.dart';

class DetailProvider extends ChangeNotifier {
  late DragonEntity dragonSend;
  bool isReadArguments = false;
  void setParameters(DragonEntity dragon) {
    if (!isReadArguments) {
      dragonSend = dragon;
      isReadArguments = true;
    }
  }

  void updateParameters(DragonEntity dragon) {
    dragonSend = dragon;
    notifyListeners();
  }
}
