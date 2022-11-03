part of 'calendar_bloc.dart';

class CalendarState extends Equatable {
  final Statuses status;
  final String? errorMessage;
  final List<Todo?>? todos;
  final DateTime? date;
  final String? month;
  final List<List<Days?>?>? days;

  CalendarState({
    this.status = Statuses.initial,
    this.errorMessage,
    this.todos,
    this.date,
    this.month,
    this.days,
  });

  CalendarState copyWith({
    Statuses? status,
    String? errorMessage,
    List<Todo?>? todos,
    List<List<Days?>?>? days,
    DateTime? date,
  }) {
    return CalendarState(
      todos: todos ?? this.todos,
      date: date ?? this.date,
      days: days ?? this.days,
      status: status ?? this.status,
      month: month ?? this.month,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        status,
        errorMessage,
        date,
        todos,
        month,
        days,
      ];
}
