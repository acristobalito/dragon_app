import 'package:dragon_store/domain/entities/dragon.dart';
import 'package:flutter/material.dart';

class DetailProvider extends ChangeNotifier {
  late Dragon dragonSend;
  bool isReadArguments = false;
  void setParameters(Dragon dragon) {
    if (!isReadArguments) {
      dragonSend = dragon;
      isReadArguments = true;
    }
  }

  void updateParameters(Dragon dragon) {
    dragonSend = dragon;
    notifyListeners();
  }
}
