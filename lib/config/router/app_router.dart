import 'package:dragon_store/domain/entities/dragon.dart';
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
        final index = state.extra as int;
        return DetailScreen(indexSend: index);
      }),
  GoRoute(
      path: FormScreen.path,
      name: FormScreen.name,
      builder: (context, state) {
        final dragon = state.extra as Dragon?;
        return FormScreen(dragon: dragon);
      }),
]);
