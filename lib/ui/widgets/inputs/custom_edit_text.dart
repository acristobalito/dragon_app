import 'package:dragon_store/config/foundations/typo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomEditText extends StatelessWidget {
  final String hintText;
  final String? initialText;
  final int lines;
  final TextInputType keyBoardType;
  final textController = TextEditingController();
  final Function(String?) onChangeValue;

  CustomEditText(
      {super.key,
      required this.hintText,
      required this.onChangeValue,
      this.lines = 1,
      this.keyBoardType = TextInputType.name,
      this.initialText}) {
    textController.text = initialText ?? '';
  }

  @override
  Widget build(BuildContext context) {
    final outlinedInputBorder = UnderlineInputBorder(
        borderSide: const BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.circular(lines > 1 ? 18 : 25));
    final inputDecoration = InputDecoration(
        hintText: hintText,
        enabledBorder: outlinedInputBorder,
        focusedBorder: outlinedInputBorder,
        filled: true);
    return TextFormField(
        style:
            const TextStyle(fontFamily: TypographyFoundation.poppinsFontFamily),
        keyboardType: keyBoardType,
        minLines: lines,
        maxLines: lines,
        controller: textController,
        decoration: inputDecoration,
        onChanged: (_) {
          onChangeValue.call(textController.text);
        },
        inputFormatters: [
          FilteringTextInputFormatter.allow(
              (keyBoardType == TextInputType.number)
                  ? RegExp(r"^[1-9][0-9]?$|^100$")
                  : RegExp(r".")),
          LengthLimitingTextInputFormatter((lines != 1) ? 200 : 30)
        ],
        validator: (value) => (value == null || value.isEmpty)
            ? 'Los campos no pueden estar vacíos'
            : null);
  }
}
