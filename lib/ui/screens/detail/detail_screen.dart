import 'package:dragon_store/domain/entities/dragon_entity.dart';
import 'package:dragon_store/domain/providers/detail_provider.dart';
import 'package:dragon_store/ui/screens/detail/scaffold_description_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailScreen extends StatelessWidget {
  final DragonEntity dragonSend;

  static const String name = 'detail_screen';
  static const String path = '/detail';
  const DetailScreen({super.key, required this.dragonSend});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DetailProvider()),
      ],
      child: ScaffoldDescriptionView(dragonSend: dragonSend),
    );
  }
}
