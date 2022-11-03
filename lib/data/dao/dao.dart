import 'dart:async';

import '../database/db.dart';
import '../model/todo.dart';

class TodoDao {
  final dbProvider = DatabaseProvider.dbProvider;

  Future<int?> createTodo(Todo todo) async {
    final db = await dbProvider.database;
    var result = await db!.insert(todoTABLE, todo.toDatabaseJson());
    return result;
  }

  Future<List<Todo>> getTodosByDay(
      {List<String>? columns, String? query}) async {
    final db = await dbProvider.database;
    List<Map<String, dynamic>>? result;
    if (query != null) {
      if (query.isNotEmpty) {
        result = await db?.query(todoTABLE,
            columns: columns, where: 'date LIKE ?', whereArgs: ["%$query%"]);
      }
    } else {
      result = await db?.query(todoTABLE, columns: columns);
    }

    List<Todo> todos = result!.isNotEmpty
        ? result.map((item) => Todo.fromDatabaseJson(item)).toList()
        : [];
    return todos;
  }

  Future<List<Todo>> getTodosByMonth(
      {List<String>? columns, String? query}) async {
    final db = await dbProvider.database;
    List<Map<String, dynamic>>? result;
    if (query != null) {
      if (query.isNotEmpty) {
        result = await db?.query(todoTABLE,
            columns: columns,
            where: 'monthYear LIKE ?',
            whereArgs: ["%$query%"]);
      }
    } else {
      result = await db?.query(todoTABLE, columns: columns);
    }

    List<Todo> todos = result!.isNotEmpty
        ? result.map((item) => Todo.fromDatabaseJson(item)).toList()
        : [];
    return todos;
  }

  Future<int?> updateTodo(Todo todo) async {
    final db = await dbProvider.database;

    var result = await db?.update(todoTABLE, todo.toDatabaseJson(),
        where: "id = ?", whereArgs: [todo.id]);

    return result;
  }

  Future<int?> deleteTodo(int id) async {
    final db = await dbProvider.database;
    var result = await db?.delete(todoTABLE, where: 'id = ?', whereArgs: [id]);

    return result;
  }

  Future deleteAllTodos(String date) async {
    final db = await dbProvider.database;
    var result = await db?.delete(
      todoTABLE,
    );

    return result;
  }
}
