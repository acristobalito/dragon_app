import 'package:dragon_store/config/foundations/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomFloatingActionButton extends StatelessWidget {
  final VoidCallback onClick;
  const CustomFloatingActionButton({super.key, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        backgroundColor: ColorsFundation.floatingButtonColor,
        onPressed: () {
          onClick.call();
        },
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: SvgPicture.asset('assets/icons/egg_icon_add.svg'),
        ));
  }
}
