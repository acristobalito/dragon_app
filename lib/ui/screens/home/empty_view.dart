import 'package:dragon_store/ui/widgets/shared/text_extension.dart';
import 'package:flutter/material.dart';

class EmptyView extends StatelessWidget {
  const EmptyView({super.key});

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
