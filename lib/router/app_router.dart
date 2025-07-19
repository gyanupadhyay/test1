import 'package:go_router/go_router.dart';
import 'package:test1/presentation/screens/home_screen.dart';
import 'package:test1/router/router_constants.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: AppRouteNames.home,
  routes: [
    GoRoute(
      path: AppRouteNames.home,
      builder: (context, state) => const MyHomePage(title: 'test',),
    ),
    // GoRoute(
    //   path: '/todo/:id',
    //   name: 'todoDetail',
    //   builder: (context, state) {
    //     final id = state.params['id']!;
    //     return TodoDetailScreen(todoId: id);
    //   },
    // ),
  ],
);