import 'package:dragon_store/config/foundations/colors.dart';
import 'package:dragon_store/domain/entities/form_screen_params.dart';
import 'package:dragon_store/domain/providers/dragon_list_provider.dart';
import 'package:dragon_store/ui/screens/detail/detail_screen.dart';
import 'package:dragon_store/ui/screens/form/form_screen.dart';
import 'package:dragon_store/ui/widgets/custom_cards/dragon_item_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:go_router/go_router.dart';

class DragonsListView extends StatelessWidget {
  final DragonListProvider dragonListProvider;
  const DragonsListView(this.dragonListProvider, {super.key});

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
                    backgroundColor: Colors.transparent,
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
                    backgroundColor: Colors.transparent,
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
