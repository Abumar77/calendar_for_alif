import 'package:calendar_for_alif/data/dao/dao.dart';
import 'package:calendar_for_alif/domain/repositories/calendar_repository.dart';
import 'package:calendar_for_alif/domain/usecases/delete_all.dart';
import 'package:calendar_for_alif/domain/usecases/get_monthly_todos.dart';
import 'package:calendar_for_alif/domain/usecases/get_todos.dart';
import 'package:calendar_for_alif/domain/usecases/insert_todo.dart';
import 'package:calendar_for_alif/domain/usecases/update_todo.dart';
import 'package:calendar_for_alif/presentation/bloc/calendar_bloc.dart';
import 'package:get_it/get_it.dart';

import '../data/repositories/calendar_repository_impl.dart';
import '../domain/usecases/delete_todo.dart';

final ls = GetIt.instance;

Future<void> setup() async {
  // /// Blocs

  //Auth
  ls.registerFactory<CalendarBloc>(() => CalendarBloc(
        deleteAllTodo: ls(),
        deleteTodo: ls(),
        getTodos: ls(),
        getMonthlyTodos: ls(),
        insertTodos: ls(),
        updateTodo: ls(),
      ));

  /// Repos

  //  Auth
  ls.registerLazySingleton<CalendarRepository>(
    () => CalendarRepositoryImpl(),
  );

  /// Usecases
  //Auth
  ls.registerLazySingleton<DeleteAllTodo>(
    () => DeleteAllTodo(ls()),
  );
  ls.registerLazySingleton<DeleteTodo>(
    () => DeleteTodo(ls()),
  );
  ls.registerLazySingleton<GetTodos>(
    () => GetTodos(ls()),
  );
  ls.registerLazySingleton<GetMonthlyTodos>(
    () => GetMonthlyTodos(ls()),
  );
  ls.registerLazySingleton<UpdateTodo>(
    () => UpdateTodo(ls()),
  );
  ls.registerLazySingleton<InsertTodos>(
    () => InsertTodos(ls()),
  );

  /// data sources
  //  ///Auth
  ls.registerLazySingleton<TodoDao>(
    () => TodoDao(),
  );
}
