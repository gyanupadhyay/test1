import 'package:get_it/get_it.dart';
import 'package:test1/services/posts_service.dart';

final sl = GetIt.instance;

void setupLocator() {
  sl.registerLazySingleton<PostsService>(() => PostsService());
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

