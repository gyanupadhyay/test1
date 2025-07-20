import 'package:go_router/go_router.dart';
import 'package:test1/models/post_model.dart';
import 'package:test1/presentation/screens/add_edit_post_screen.dart';
import 'package:test1/presentation/screens/home_screen.dart';
import 'package:test1/router/router_constants.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: AppRouteNames.home,
  routes: [
    GoRoute(
      path: AppRouteNames.home,
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: AppRouteNames.add,
      builder: (context, state) => const AddEditPostScreen(),
    ),
    GoRoute(
      path: AppRouteNames.edit,
      builder: (context, state) {
        final post = state.extra as Post;
        return AddEditPostScreen(post: post);
      },
    ),
  ],
);
