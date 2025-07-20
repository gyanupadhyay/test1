import 'package:go_router/go_router.dart';
import 'package:test1/models/post_model.dart';
import 'package:test1/presentation/screens/home_screen.dart';
import 'package:test1/presentation/screens/post_detail_screen.dart';
import 'package:test1/router/router_constants.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: AppRouteNames.home,
  routes: [
    GoRoute(
      path: AppRouteNames.home,
      builder: (context, state) => const MyHomePage(),
    ),
    GoRoute(
      path: AppRouteNames.postDetail,
      builder: (context, state) {
        final PostModel postModel = state.extra as PostModel;
        return PostDetailScreen(postModel: postModel);
      },
    ),
  ],
);
