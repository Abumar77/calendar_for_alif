// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;

import '../data/model/todo.dart' as _i6;
import '../presentation/pages/event_add_page.dart' as _i1;
import '../presentation/pages/main_home_screen.dart' as _i3;
import '../presentation/pages/todo_detailed.dart' as _i2;

class AppRouter extends _i4.RootStackRouter {
  AppRouter([_i5.GlobalKey<_i5.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    EventAddRoute.name: (routeData) {
      final args = routeData.argsAs<EventAddRouteArgs>();
      return _i4.CustomPage<dynamic>(
        routeData: routeData,
        child: _i1.EventAddPage(
          key: args.key,
          initialTodo: args.initialTodo,
          date: args.date,
        ),
        transitionsBuilder: _i4.TransitionsBuilders.slideLeft,
        opaque: true,
        barrierDismissible: false,
      );
    },
    TodoDetailed.name: (routeData) {
      final args = routeData.argsAs<TodoDetailedArgs>();
      return _i4.CustomPage<dynamic>(
        routeData: routeData,
        child: _i2.TodoDetailed(
          key: args.key,
          todo: args.todo,
        ),
        transitionsBuilder: _i4.TransitionsBuilders.slideLeft,
        opaque: true,
        barrierDismissible: false,
      );
    },
    MainHScreen.name: (routeData) {
      final args = routeData.argsAs<MainHScreenArgs>(
          orElse: () => const MainHScreenArgs());
      return _i4.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i3.MainHScreen(key: args.key),
        fullscreenDialog: true,
      );
    },
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig(
          '/#redirect',
          path: '/',
          redirectTo: '/main-home-screen',
          fullMatch: true,
        ),
        _i4.RouteConfig(
          EventAddRoute.name,
          path: '/event-add-screen',
        ),
        _i4.RouteConfig(
          TodoDetailed.name,
          path: '/detailed-screen',
        ),
        _i4.RouteConfig(
          MainHScreen.name,
          path: '/main-home-screen',
        ),
      ];
}

/// generated route for
/// [_i1.EventAddPage]
class EventAddRoute extends _i4.PageRouteInfo<EventAddRouteArgs> {
  EventAddRoute({
    _i5.Key? key,
    _i6.Todo? initialTodo,
    required DateTime date,
  }) : super(
          EventAddRoute.name,
          path: '/event-add-screen',
          args: EventAddRouteArgs(
            key: key,
            initialTodo: initialTodo,
            date: date,
          ),
        );

  static const String name = 'EventAddRoute';
}

class EventAddRouteArgs {
  const EventAddRouteArgs({
    this.key,
    this.initialTodo,
    required this.date,
  });

  final _i5.Key? key;

  final _i6.Todo? initialTodo;

  final DateTime date;

  @override
  String toString() {
    return 'EventAddRouteArgs{key: $key, initialTodo: $initialTodo, date: $date}';
  }
}

/// generated route for
/// [_i2.TodoDetailed]
class TodoDetailed extends _i4.PageRouteInfo<TodoDetailedArgs> {
  TodoDetailed({
    _i5.Key? key,
    required _i6.Todo todo,
  }) : super(
          TodoDetailed.name,
          path: '/detailed-screen',
          args: TodoDetailedArgs(
            key: key,
            todo: todo,
          ),
        );

  static const String name = 'TodoDetailed';
}

class TodoDetailedArgs {
  const TodoDetailedArgs({
    this.key,
    required this.todo,
  });

  final _i5.Key? key;

  final _i6.Todo todo;

  @override
  String toString() {
    return 'TodoDetailedArgs{key: $key, todo: $todo}';
  }
}

/// generated route for
/// [_i3.MainHScreen]
class MainHScreen extends _i4.PageRouteInfo<MainHScreenArgs> {
  MainHScreen({_i5.Key? key})
      : super(
          MainHScreen.name,
          path: '/main-home-screen',
          args: MainHScreenArgs(key: key),
        );

  static const String name = 'MainHScreen';
}

class MainHScreenArgs {
  const MainHScreenArgs({this.key});

  final _i5.Key? key;

  @override
  String toString() {
    return 'MainHScreenArgs{key: $key}';
  }
}
