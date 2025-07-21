import 'package:go_router/go_router.dart';
import 'package:test1/models/weather_model.dart';
import 'package:test1/presentation/screens/home_screen.dart';
import 'package:test1/presentation/screens/weather_detail_screen.dart';
import 'package:test1/router/router_constants.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: AppRouteNames.home,
  routes: [
    GoRoute(
      path: AppRouteNames.home,
      builder: (context, state) => const MyHomePage(title: 'Test'),
    ),
    GoRoute(
      path: AppRouteNames.detailScreen,
      builder: (context, state) =>
          WeatherDetailScreen(weatherModel: state.extra as WeatherModel),
    ),
  ],
);
