import 'package:dragon_store/domain/providers/dragon_list_provider.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class OnBoardingView extends StatelessWidget {
  final DragonListProvider provider;
  const OnBoardingView(this.provider, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => provider.setOnBoardingComplete(),
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white.withOpacity(0.5),
        child: Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 50),
            child: Lottie.asset("assets/animations/swipe_gesture.json",
                width: 100, height: 100),
          ),
        ),
      ),
    );
  }
}
