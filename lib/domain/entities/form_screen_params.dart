import 'package:dragon_store/domain/entities/dragon.dart';
import 'package:dragon_store/ui/providers/detail_provider.dart';

class FormScreenParams {
  bool? fromHome;
  Dragon? dragon;
  DetailProvider? detailProvider;
  FormScreenParams({this.fromHome, this.dragon, this.detailProvider});
}
