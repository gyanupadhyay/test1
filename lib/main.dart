import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test1/bloc/cubit/weather_cubit.dart';
import 'package:test1/locator.dart';
import 'package:test1/router/app_router.dart';
import 'package:test1/services/weather_service.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator(); // Register dependencies
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _weatherService = sl<WeatherService>();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherCubit(_weatherService),
      child: ScreenUtilInit(
        designSize: const Size(432, 927),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) => MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: appRouter,
          title: 'Interview',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          ),
        ),
      ),
    );
  }
}
