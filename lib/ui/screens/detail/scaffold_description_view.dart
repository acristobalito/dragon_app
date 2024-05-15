import 'package:dragon_store/domain/entities/dragon_entity.dart';
import 'package:dragon_store/domain/providers/detail_provider.dart';
import 'package:dragon_store/domain/utils/dragon_element_utils.dart';
import 'package:dragon_store/ui/screens/detail/detail_dragon_view.dart';
import 'package:dragon_store/ui/widgets/shared/custom_background_image_view.dart';
import 'package:dragon_store/ui/widgets/shared/text_extension.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScaffoldDescriptionView extends StatelessWidget {
  final DragonEntity dragonSend;
  const ScaffoldDescriptionView({
    super.key,
    required this.dragonSend,
  });

  @override
  Widget build(BuildContext context) {
    final descriptionProvider = context.watch<DetailProvider>();
    descriptionProvider.setParameters(dragonSend);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Dragon ${descriptionProvider.dragonSend.name}').form(
            size: 25,
            color: DragonElementUtils.getColorElement(
                descriptionProvider.dragonSend.element)),
      ),
      body: SafeArea(
          child: Stack(
        children: [
          const CustomBackgroundImageView(
            pathImage: 'assets/images/escenario.jpeg',
            boxFit: BoxFit.cover,
            opacity: 0.5,
          ),
          DetailDragonView(descriptionProvider)
        ],
      )),
    );
  }
}
