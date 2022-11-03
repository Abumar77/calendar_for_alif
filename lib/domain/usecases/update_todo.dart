import 'package:calendar_for_alif/utils/import_links.dart';

class UpdateTodo implements UseCase<bool, Todo> {
  final CalendarRepository repo;

  UpdateTodo(this.repo);

  @override
  Future<Either<Failure, bool>> call(Todo? todo) async {
    return await repo.updateTodo(todo!);
  }
}
