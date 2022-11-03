import 'package:calendar_for_alif/data/model/todo.dart';
import 'package:calendar_for_alif/domain/repositories/calendar_repository.dart';
import 'package:calendar_for_alif/utils/failure.dart';
import 'package:dartz/dartz.dart';
import '../../data/model/days.dart';
import '../../utils/usecase.dart';

class GetMonthlyTodos implements UseCase<List<Todo?>?, String> {
  final CalendarRepository repo;

  GetMonthlyTodos(this.repo);

  @override
  Future<Either<Failure, List<Todo?>?>> call(String yearMonth) async {
    return await repo.getMonthlyTodos(yearMonth);
  }
}
