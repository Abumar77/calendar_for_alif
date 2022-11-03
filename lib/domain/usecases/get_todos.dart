import 'package:calendar_for_alif/data/model/todo.dart';
import 'package:calendar_for_alif/domain/repositories/calendar_repository.dart';
import 'package:calendar_for_alif/utils/failure.dart';
import 'package:dartz/dartz.dart';
import '../../utils/usecase.dart';

class GetTodos implements UseCase<List<Todo?>?, String> {
  final CalendarRepository repo;

  GetTodos(this.repo);

  @override
  Future<Either<Failure, List<Todo?>?>> call(String date) async {
    return await repo.getTodos(date);
  }
}
