import 'package:dragon_store/config/foundations/typo.dart';
import 'package:dragon_store/domain/providers/dragon_list_provider.dart';
import 'package:dragon_store/ui/screens/home/dragon_list_view.dart';
import 'package:dragon_store/ui/screens/home/empty_view.dart';
import 'package:dragon_store/ui/screens/home/onboarding_view.dart';
import 'package:dragon_store/ui/screens/screens.dart';
import 'package:dragon_store/ui/widgets/custom_buttons/custom_floating_action_button.dart';
import 'package:dragon_store/ui/widgets/shared/custom_background_image_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  static const String name = 'home_screen';
  static const String path = '/';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dragonListProvider = context.watch<DragonListProvider>();
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Image.network(
              'https://kevin.games/assets/images/new/dragon-city.jpg'),
        ),
        title: const Text(
          'Guardería de dragones',
          style: TextStyle(
              fontFamily: TypographyFoundation.poppinsFontFamily,
              fontWeight: FontWeight.w500),
        ),
      ),
      body: SafeArea(
          child: Stack(children: [
        dragonListProvider.dragonsList.isEmpty
            ? const EmptyView()
            : const CustomBackgroundImageView(
                pathImage: 'assets/images/island.png'),
        if (dragonListProvider.dragonsList.isNotEmpty)
          DragonsListView(dragonListProvider),
        if (!dragonListProvider.isOnBoardingComplete)
          OnBoardingView(dragonListProvider)
      ])),
      floatingActionButton: CustomFloatingActionButton(
        onClick: () {
          context.pushNamed(FormScreen.name);
        },
      ),
    );
  }
}
