import 'package:dragon_store/config/foundations/colors.dart';
import 'package:dragon_store/config/foundations/typo.dart';
import 'package:dragon_store/domain/entities/form_screen_params.dart';
import 'package:dragon_store/ui/providers/dragon_list_provider.dart';
import 'package:dragon_store/ui/screens/screens.dart';
import 'package:dragon_store/ui/widgets/custom_cards/dragon_item_card.dart';
import 'package:dragon_store/ui/widgets/shared/custom_image_background.dart';
import 'package:dragon_store/ui/widgets/shared/text_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
          'Guarderia de dragones',
          style: TextStyle(
              fontFamily: TypographyFoundation.poppinsFontFamily,
              fontWeight: FontWeight.w500),
        ),
      ),
      body: SafeArea(
          child: Stack(children: [
        dragonListProvider.dragonsList.isEmpty
            ? const _EmptyView()
            : const CustomBackgroundImage(
                pathImage: 'assets/images/island.png'),
        if (dragonListProvider.dragonsList.isNotEmpty)
          _DragonsListView(dragonListProvider)
      ])),
      floatingActionButton: _CustomFloatingActionButton(
        onClick: () {
          context.pushNamed(FormScreen.name);
        },
      ),
    );
  }
}

class _DragonsListView extends StatelessWidget {
  final DragonListProvider dragonListProvider;
  const _DragonsListView(this.dragonListProvider);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: ListView.builder(
          itemBuilder: (context, index) {
            if (dragonListProvider.dragonsList.isNotEmpty) {
              return Slidable(
                closeOnScroll: true,
                key: Key(index.toString()),
                startActionPane:
                    ActionPane(motion: const BehindMotion(), children: [
                  SlidableAction(
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    autoClose: true,
                    onPressed: (context) {
                      dragonListProvider
                          .removeDragon(dragonListProvider.dragonsList[index]);
                    },
                    foregroundColor: ColorsFundation.errorColor,
                    icon: Icons.delete,
                  ),
                  SlidableAction(
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    autoClose: true,
                    onPressed: (context) {
                      context.pushNamed(FormScreen.name,
                          extra: FormScreenParams(
                              fromHome: true,
                              dragon: dragonListProvider.dragonsList[index]));
                    },
                    foregroundColor: ColorsFundation.primaryColor,
                    icon: Icons.edit,
                  ),
                ]),
                child: DragonItemCard(
                  dragon: dragonListProvider.dragonsList[index],
                  onTap: () async {
                    final bool? isDelete = await context.pushNamed<bool>(
                        DetailScreen.name,
                        extra: dragonListProvider.dragonsList[index]);
                    if (isDelete ?? false) {
                      dragonListProvider
                          .removeDragon(dragonListProvider.dragonsList[index]);
                    }
                  },
                ),
              );
            } else {
              return null;
            }
          },
          itemCount: dragonListProvider.dragonsList.length),
    );
  }
}

class _CustomFloatingActionButton extends StatelessWidget {
  final VoidCallback onClick;
  const _CustomFloatingActionButton({required this.onClick});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        backgroundColor: ColorsFundation.floatingButtonColor,
        onPressed: () {
          onClick.call();
        },
        child: SvgPicture.asset('assets/icons/egg_icon.svg'));
  }
}

class _EmptyView extends StatelessWidget {
  const _EmptyView();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/deus.jpeg',
            height: 200,
            width: 200,
            color: Colors.white.withOpacity(0.8),
            colorBlendMode: BlendMode.modulate,
          ),
          const SizedBox(
            height: 10,
          ),
          const Text('Ops! Al parecer no tenemos dragones')
              .form(color: const Color.fromARGB(125, 0, 0, 0), size: 20)
        ],
      ),
    );
  }
}
