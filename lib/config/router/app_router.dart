import 'package:dragon_store/domain/entities/dragon_entity.dart';
import 'package:dragon_store/domain/entities/form_screen_params.dart';
import 'package:dragon_store/ui/screens/screens.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(initialLocation: HomeScreen.path, routes: [
  GoRoute(
    path: HomeScreen.path,
    name: HomeScreen.name,
    builder: (context, state) => const HomeScreen(),
  ),
  GoRoute(
      path: DetailScreen.path,
      name: DetailScreen.name,
      builder: (context, state) {
        final dragonSend = state.extra as DragonEntity;
        return DetailScreen(dragonSend: dragonSend);
      }),
  GoRoute(
      path: FormScreen.path,
      name: FormScreen.name,
      builder: (context, state) {
        final params = state.extra as FormScreenParams?;
        return FormScreen(
          params: params,
        );
      }),
]);
