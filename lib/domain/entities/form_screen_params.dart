import 'package:dragon_store/domain/entities/dragon_entity.dart';
import 'package:dragon_store/domain/providers/detail_provider.dart';

class FormScreenParams {
  bool? fromHome;
  DragonEntity? dragon;
  DetailProvider? detailProvider;
  FormScreenParams({this.fromHome, this.dragon, this.detailProvider});
}
