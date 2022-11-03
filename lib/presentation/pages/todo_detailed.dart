import 'package:auto_route/auto_route.dart';
import 'package:calendar_for_alif/presentation/pages/event_add_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/model/todo.dart';
import '../../utils/components.dart';
import '../../utils/functions.dart';
import '../bloc/calendar_bloc.dart';

class TodoDetailed extends StatelessWidget {
  const TodoDetailed({Key? key, required this.todo}) : super(key: key);
  static const routeName = '/detailed-screen';

  final Todo todo;

  @override
  Widget build(BuildContext context) {
    final router = AutoRouter.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 250,
            decoration: BoxDecoration(
              color: getColor(todo.color ?? 1, 3),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 40.0),
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.white),
                              child: IconButton(
                                icon: const Icon(
                                  Icons.arrow_back_ios_new,
                                  size: 20,
                                ),
                                color: Colors.black,
                                onPressed: () {
                                  router.pop();
                                },
                              ),
                            ),
                          ),
                          Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 28.0, vertical: 12),
                              child: BlocBuilder<CalendarBloc, CalendarState>(
                                builder: (context, state) {
                                  return TextButton(
                                      onPressed: () {
                                        router.pushWidget(EventAddPage(
                                          initialTodo: todo,
                                          date: state.date!,
                                        ));
                                      },
                                      child: Row(children: const [
                                        Icon(
                                          Icons.edit,
                                          color: Colors.white,
                                          size: 15,
                                        ),
                                        Text("Edit",
                                            style:
                                                TextStyle(color: Colors.white))
                                      ]));
                                },
                              ))
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 28.0),
                        child: Text("${todo.name}", style: kWhiteTodoNameStyle),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 28.0),
                        child: Text("${todo.description}",
                            style: kWhiteTodoDescriptionStyle),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 28.0, vertical: 12),
                        child: Row(
                          children: [
                            const Icon(Icons.access_time_filled,
                                size: 20, color: Colors.white),
                            Text("${todo.time}",
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 12))
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 28.0),
                        child: Row(
                          children: [
                            const Icon(Icons.location_on,
                                size: 20, color: Colors.white),
                            Text("${todo.location}",
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 12))
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 28.0, bottom: 250),
            child: SizedBox(
              width: MediaQuery.of(context).size.width - 56,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Reminder",
                      style: kBlack16textBold,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "15 minutes before",
                      style: kGrey16Text,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Description",
                      style: kBlack16textBold,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      lorem,
                      style: kGrey10Text,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 25),
              child: BlocBuilder<CalendarBloc, CalendarState>(
                builder: (context, state) {
                  return TextButton(
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width - 280,
                          vertical: 13),
                      backgroundColor: Colors.red.shade50,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    child: Row(
                      children: const [
                        Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                        Text(
                          "Delete Event",
                          style: TextStyle(color: Colors.black, fontSize: 12),
                        ),
                      ],
                    ),
                    onPressed: () {
                      context.read<CalendarBloc>().add(
                            DeleteTodoEvent(todo.id.toString()),
                          );

                      context.read<CalendarBloc>().add(
                            GetTodosEvent(state.date),
                          );
                      router.pop();
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
