part of 'calendar_bloc.dart';

abstract class CalendarEvent extends Equatable {
  const CalendarEvent();
}

class GetTodosEvent extends CalendarEvent {
  final DateTime? date;

  GetTodosEvent(this.date);

  @override
  List<Object?> get props => [date];
}

class GetMonthlyTodosEvent extends CalendarEvent {
  final String? monthYear;

  const GetMonthlyTodosEvent(this.monthYear);

  @override
  List<Object?> get props => [monthYear];
}

class EditTodoEvent extends CalendarEvent {
  Todo? todo;

  EditTodoEvent(this.todo);

  @override
  List<Object?> get props => [todo];
}

class InsertTodoEvent extends CalendarEvent {
  Todo? todo;

  InsertTodoEvent(this.todo);

  @override
  List<Object?> get props => [todo];
}

class DeleteTodoEvent extends CalendarEvent {
  String? id;

  DeleteTodoEvent(this.id);

  @override
  List<Object?> get props => [id];
}
