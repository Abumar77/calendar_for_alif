import 'package:calendar_for_alif/utils/failure.dart';
import 'package:dartz/dartz.dart';
import '../../data/model/todo.dart';
import '../../utils/usecase.dart';
import '../repositories/calendar_repository.dart';

class InsertTodos implements UseCase<bool, Todo> {
  final CalendarRepository repo;

  InsertTodos(this.repo);

  @override
  Future<Either<Failure, bool>> call(Todo? todo) async {
    return await repo.insertTodo(todo!);
  }
}
