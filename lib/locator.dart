// lib/core/locator.dart
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void setupLocator() {
  // sl.registerLazySingleton<TodoService>(() => TodoService());
  // sl.registerFactory<TodoBloc>(() => TodoBloc(sl<TodoService>()));
}


//How to use in anywhere needed
// BlocProvider(
//       create: (_) => sl<TodoBloc>()..add(LoadTodos()),
  // final _todoService = sl<TodoService>();

// if not creating bloc di from here
// BlocProvider(
//   create: (_) => TodoBloc(sl<TodoService>())..add(LoadTodos()),
//   child: TodoScreen(),
// ),

