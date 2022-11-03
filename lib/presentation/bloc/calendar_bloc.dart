import 'dart:async';
import 'package:calendar_for_alif/domain/usecases/get_monthly_todos.dart';
import 'package:calendar_for_alif/utils/calendar_components/functions.dart';
import 'package:intl/intl.dart';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../data/model/days.dart';
import '../../data/model/todo.dart';
import '../../domain/usecases/delete_all.dart';
import '../../domain/usecases/delete_todo.dart';
import '../../domain/usecases/get_todos.dart';
import '../../domain/usecases/insert_todo.dart';
import '../../domain/usecases/update_todo.dart';
import '../../utils/enums.dart';

part 'calendar_event.dart';
part 'calendar_state.dart';

class CalendarBloc extends Bloc<CalendarEvent, CalendarState>
    with CalendarFunctions {
  final DeleteAllTodo deleteAllTodo;
  final DeleteTodo deleteTodo;
  final GetTodos getTodos;
  final GetMonthlyTodos getMonthlyTodos;
  final InsertTodos insertTodos;
  final UpdateTodo updateTodo;

  CalendarBloc(
      {required this.deleteAllTodo,
      required this.deleteTodo,
      required this.getMonthlyTodos,
      required this.getTodos,
      required this.insertTodos,
      required this.updateTodo})
      : super(CalendarState()) {
    on<GetTodosEvent>(_getTodo);
    on<GetMonthlyTodosEvent>(_getMonthlyTodo);
    on<EditTodoEvent>(_editTodos);
    on<InsertTodoEvent>(_insertTodos);
    on<DeleteTodoEvent>(_deleteTodo);
  }

  FutureOr<void> _getTodo(
      GetTodosEvent event, Emitter<CalendarState> emit) async {
    emit(state.copyWith(status: Statuses.loading));
    var formattedDate =
        "${event.date!.year}-${event.date!.month}-${event.date!.day}";
    final response = await getTodos.call(formattedDate.toString());

    response.fold(
        (left) => emit(
              state.copyWith(
                status: Statuses.error,
                errorMessage: left.message,
              ),
            ), (right) {
      if (right != state.todos) {
        emit(
          state.copyWith(
            status: Statuses.success,
            todos: right,
          ),
        );
      }

      emit(
        state.copyWith(
          status: Statuses.success,
          date: event.date,
        ),
      );
    });
  }

  FutureOr<void> _getMonthlyTodo(
      GetMonthlyTodosEvent event, Emitter<CalendarState> emit) async {
    emit(state.copyWith(status: Statuses.loading));

    final response = await getMonthlyTodos.call(event.monthYear.toString());

    var sorted;
    response.fold(
        (left) => emit(
              state.copyWith(
                status: Statuses.error,
                errorMessage: left.message,
              ),
            ), (right) {
      if (right != state.todos) {
        var date = DateTime(int.parse(event.monthYear!.substring(0, 4)),
            int.parse(event.monthYear!.substring(5, 7).replaceAll("-", "")));
        sorted = sortTodos(todos: right, monthYear: date);

        emit(
          state.copyWith(
            status: Statuses.success,
            todos: right,
            days: sorted,
          ),
        );
      }

      emit(
        state.copyWith(
          status: Statuses.success,
          date: state.date,
          todos: right,
          days: sorted,
        ),
      );
    });
  }

  FutureOr<void> _editTodos(
      EditTodoEvent event, Emitter<CalendarState> emit) async {
    emit(state.copyWith(status: Statuses.loading));

    final response = await updateTodo.call(event.todo);

    response.fold(
        (left) => emit(
              state.copyWith(
                status: Statuses.error,
                errorMessage: left.message,
              ),
            ), (right) {
      _getTodo;
      if (right != bool) {
        emit(
          state.copyWith(
            status: Statuses.success,
          ),
        );
      }
      emit(
        state.copyWith(
          status: Statuses.success,
        ),
      );
    });
  }

  FutureOr<void> _insertTodos(
      InsertTodoEvent event, Emitter<CalendarState> emit) async {
    emit(state.copyWith(status: Statuses.loading));

    final response = await insertTodos.call(event.todo);

    response.fold(
        (left) => emit(
              state.copyWith(
                status: Statuses.error,
                errorMessage: left.message,
              ),
            ), (right) {
      _getTodo;
      if (right != bool) {
        emit(
          state.copyWith(
            status: Statuses.success,
          ),
        );
      }
      emit(
        state.copyWith(
          status: Statuses.success,
        ),
      );
    });
  }

  FutureOr<void> _deleteTodo(
      DeleteTodoEvent event, Emitter<CalendarState> emit) async {
    emit(state.copyWith(status: Statuses.loading));

    final response = await deleteTodo.call(event.id.toString());

    response.fold(
        (left) => emit(
              state.copyWith(
                status: Statuses.error,
                errorMessage: left.message,
              ),
            ), (right) {
      _getTodo;
      if (right != bool) {
        emit(
          state.copyWith(
            status: Statuses.success,
          ),
        );
      }
      emit(
        state.copyWith(
          status: Statuses.success,
        ),
      );
    });
  }
}
