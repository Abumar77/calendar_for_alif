import 'package:calendar_for_alif/utils/import_links.dart';

class DeleteAllTodo implements UseCase<bool, String> {
  final CalendarRepository repo;

  DeleteAllTodo(this.repo);

  @override
  Future<Either<Failure, bool>> call(String date) async {
    return await repo.deleteAllTodos(date);
  }
}
