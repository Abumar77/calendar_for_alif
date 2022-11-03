import 'package:calendar_for_alif/utils/import_links.dart';

class DeleteTodo implements UseCase<bool, String> {
  final CalendarRepository repo;

  DeleteTodo(this.repo);

  @override
  Future<Either<Failure, bool>> call(String id) async {
    return await repo.deleteTodoById(id);
  }
}
