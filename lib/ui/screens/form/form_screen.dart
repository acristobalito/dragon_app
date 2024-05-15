import 'package:dragon_store/config/foundations/typo.dart';
import 'package:dragon_store/domain/entities/form_screen_params.dart';
import 'package:dragon_store/domain/providers/form_provider.dart';
import 'package:dragon_store/ui/screens/form/dragon_form_view.dart';
import 'package:dragon_store/ui/widgets/shared/custom_background_image_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FormScreen extends StatelessWidget {
  final FormScreenParams? params;
  static const String name = 'form_screen';
  static const String path = '/form';
  const FormScreen({super.key, this.params});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => FormProvider(),
        )
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Arbol de cría',
            style: TextStyle(
                fontFamily: TypographyFoundation.poppinsFontFamily,
                fontWeight: FontWeight.w500),
          ),
        ),
        body: SafeArea(
          child: Stack(
            children: [
              const CustomBackgroundImageView(
                  pathImage: 'assets/images/arbolcria.jpeg'),
              DragonFormView(
                dragon: params?.dragon,
                fromHome: params?.fromHome,
                detailProvider: params?.detailProvider,
              )
            ],
          ),
        ),
      ),
    );
  }
}
