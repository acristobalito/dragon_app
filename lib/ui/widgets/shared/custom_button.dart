import 'package:dragon_store/ui/widgets/shared/text_extension.dart';
import 'package:flutter/material.dart';

class CustomButtonView extends StatelessWidget {
  final Color buttonColor;
  final String textButton;
  final VoidCallback onClick;

  const CustomButtonView(
      {super.key,
      required this.buttonColor,
      required this.textButton,
      required this.onClick});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Material(
          color: buttonColor,
          child: InkWell(
            splashColor: Colors.amber[50],
            onTap: () {
              onClick.call();
            },
            child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Text(
                  textButton,
                ).form(size: 18, color: Colors.white)),
          ),
        ),
      ),
    );
  }
}
