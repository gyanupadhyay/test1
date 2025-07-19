import 'package:flutter/material.dart';
import 'package:test1/locator.dart';
import 'package:test1/router/app_router.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator(); // Register dependencies
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,
      title: 'Interview',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
    );
  }
}
