import 'package:dartz/dartz.dart';

import '../../data/model/days.dart';
import '../../data/model/todo.dart';
import '../../utils/failure.dart';

abstract class CalendarRepository {
  Future<Either<Failure, List<Todo?>?>> getTodos(String date);
  Future<Either<Failure, List<Todo?>?>> getMonthlyTodos(String yearMonth);
  Future<Either<Failure, bool>> insertTodo(Todo todo);
  Future<Either<Failure, bool>> updateTodo(Todo todo);
  Future<Either<Failure, bool>> deleteTodoById(String id);
  Future<Either<Failure, bool>> deleteAllTodos(String date);
}
