import 'package:intl/intl.dart';

import '../../data/model/days.dart';
import '../../data/model/todo.dart';

mixin CalendarFunctions {
  List<List<Days?>?> sortTodos(
      {List<Todo?>? todos, required DateTime monthYear}) {
    DateTime time = DateTime(monthYear.year, monthYear.month, 1);

    int daysCount;

    List<Days?>? res = [];

    switch (monthYear.month.toString()) {
      case "1":
        {
          daysCount = 31;
          break;
        }
      case "2":
        {
          daysCount = 28;
          break;
        }
      case "3":
        {
          daysCount = 31;
          break;
        }
      case "4":
        {
          daysCount = 30;
          break;
        }
      case "5":
        {
          daysCount = 31;
          break;
        }
      case "6":
        {
          daysCount = 30;
          break;
        }
      case "7":
        {
          daysCount = 31;
          break;
        }
      case "8":
        {
          daysCount = 31;
          break;
        }
      case "9":
        {
          daysCount = 30;
          break;
        }
      case "10":
        {
          daysCount = 30;
          break;
        }
      case "11":
        {
          daysCount = 30;
          break;
        }
      default:
        {
          daysCount = 31;
          break;
        }
    }
    int weknum = 1;
    DateTime nowad = time;
    for (int i = 1; i < daysCount + 1; i++) {
      res.add(
        Days(
            number: i,
            weekday: nowad.weekday.toString(),
            year: nowad.year.toString(),
            weekNumber: weknum.toString(),
            month: nowad.month.toString(),
            date: DateTime(
                int.parse(nowad.year.toString()),
                int.parse(
                  nowad.month.toString(),
                ),
                i),
            taskColorNumber: []),
      );
      if (nowad.weekday == 7) {
        weknum++;
      }
      nowad = nowad.add(Duration(days: 1));
    }

    if (todos != null || todos!.isNotEmpty) {
      for (int i = 1; i < daysCount - 1; i++) {
        for (int s = 0; s < todos.length; s++) {
          DateTime todoDate = DateTime(
              int.parse(todos[s]!.date!.substring(0, 4)),
              int.parse(todos[s]!.date!.substring(5, 7).replaceAll("-", "")),
              int.parse(todos[s]!.date!.substring(7).replaceAll("-", "")));

          if (res[i]?.number == todoDate.day) {
            res[i]?.taskColorNumber?.add(todos[s]!.color!);
            print("Yahoo");
          }
        }
      }
    }

    List<List<Days?>?>? result = [[], [], [], [], []];
    int? numberToStartWith = int.parse("${res[0]?.weekday}");

    for (int s = 0; s < numberToStartWith - 1; s++) {
      result[0]?.add(
        Days(
          number: 0,
        ),
      );
    }
    int su = 7 - numberToStartWith;
    for (int i = 0; i < 5; i++) {
      if (i == 0) {
        for (int z = 0; z < su + 1; z++) {
          result[0]?.add(res[z]);
        }
      } else {
        for (int s = 1; s < 8; s++) {
          result[1]?.add(res[s + su]);
        }
        for (int s = 1; s < 8; s++) {
          result[2]?.add(res[s + su + 7]);
        }
        for (int s = 1; s < 8; s++) {
          result[3]?.add(res[s + su + 14]);
        }
        int len = 35 - numberToStartWith - 29;
        for (int s = 0; s < len - 1; s++) {
          result[4]?.add(res[s + 27]);
        }
        int list_lenght = 7 - result[4]!.length;

        for (int s = 0; s < list_lenght; s++) {
          result[4]?.add(
            Days(
              number: 0,
            ),
          );
        }
        return result;
      }
    }
    return result;
  }
}
