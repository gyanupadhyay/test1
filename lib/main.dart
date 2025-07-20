import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test1/bloc/cubit/post_cubit.dart';
import 'package:test1/locator.dart';
import 'package:test1/router/app_router.dart';
import 'package:test1/services/posts_service.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator(); // Register dependencies
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _postsService = sl<PostsService>();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PostCubit(_postsService)..getPosts(),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: appRouter,
        title: 'Interview',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
      ),
    );
  }
}
