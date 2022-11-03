import 'package:calendar_for_alif/data/model/days.dart';
import 'package:calendar_for_alif/data/model/todo.dart';
import 'package:calendar_for_alif/domain/repositories/calendar_repository.dart';
import 'package:calendar_for_alif/utils/failure.dart';
import 'package:dartz/dartz.dart';

import '../dao/dao.dart';

class CalendarRepositoryImpl implements CalendarRepository {
  final todoDao = TodoDao();

  @override
  Future<Either<Failure, List<Todo?>?>> getTodos(String date) async {
    try {
      final data = await todoDao.getTodosByDay(query: date);
      return Right(data);
    } catch (e) {
      return Left(e as Failure);
    }
  }

  @override
  Future<Either<Failure, bool>> deleteAllTodos(String date) async {
    try {
      final data = await todoDao.deleteAllTodos(date);
      return Right(data == 1 ? true : false);
    } catch (e) {
      return Left(e as Failure);
    }
  }

  @override
  Future<Either<Failure, bool>> deleteTodoById(String id) async {
    try {
      final data = await todoDao.deleteTodo(int.parse(id));
      return Right(data == 1 ? true : false);
    } catch (e) {
      return Left(e as Failure);
    }
  }

  @override
  Future<Either<Failure, bool>> insertTodo(Todo todo) async {
    try {
      final data = await todoDao.createTodo(todo);
      print(data);
      return const Right(true);
    } catch (e) {
      return Left(e as Failure);
    }
  }

  @override
  Future<Either<Failure, bool>> updateTodo(Todo todo) async {
    try {
      final data = await todoDao.updateTodo(todo);

      return Right(data == 1 ? true : false);
    } catch (e) {
      return Left(e as Failure);
    }
  }

  @override
  Future<Either<Failure, List<Todo?>?>> getMonthlyTodos(
      String yearMonth) async {
    try {
      final data = await todoDao.getTodosByMonth(query: yearMonth);
      return Right(data);
    } catch (e) {
      return Left(e as Failure);
    }
  }
}
