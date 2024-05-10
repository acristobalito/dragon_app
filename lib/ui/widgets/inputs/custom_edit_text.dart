import 'package:dragon_store/config/foundations/typo.dart';
import 'package:flutter/material.dart';

class CustomEditText extends StatelessWidget {
  final String hintText;
  final String? initialText;
  final int lines;
  final TextInputType keyBoardType;
  final Function(String) onChangeValue;

  const CustomEditText(
      {super.key,
      required this.hintText,
      required this.onChangeValue,
      this.lines = 1,
      this.keyBoardType = TextInputType.name,
      this.initialText});

  @override
  Widget build(BuildContext context) {
    final focusNode = FocusNode();
    final outlinedInputBorder = UnderlineInputBorder(
        borderSide: const BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.circular(lines > 1 ? 18 : 25));
    final inputDecoration = InputDecoration(
        hintText: hintText,
        enabledBorder: outlinedInputBorder,
        focusedBorder: outlinedInputBorder,
        filled: true);
    return TextFormField(
      initialValue: initialText,
      style:
          const TextStyle(fontFamily: TypographyFoundation.poppinsFontFamily),
      keyboardType: keyBoardType,
      minLines: lines,
      maxLines: lines,
      focusNode: focusNode,
      onTapOutside: (event) => focusNode.unfocus(),
      decoration: inputDecoration,
      onChanged: (value) {
        onChangeValue.call(value);
      },
    );
  }
}
