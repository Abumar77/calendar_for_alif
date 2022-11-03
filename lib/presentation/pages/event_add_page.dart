import 'package:auto_route/auto_route.dart';
import 'package:calendar_for_alif/presentation/bloc/calendar_bloc.dart';
import 'package:calendar_for_alif/presentation/pages/main_home_screen.dart';
import 'package:calendar_for_alif/utils/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/model/todo.dart';

class EventAddPage extends StatefulWidget {
  EventAddPage({Key? key, this.initialTodo, required this.date})
      : super(key: key);
  static const routeName = '/event-add-screen';

  final DateTime date;
  Todo? initialTodo;
  @override
  State<EventAddPage> createState() => _EventAddPageState();
}

class _EventAddPageState extends State<EventAddPage> {
  @override
  void initState() {
    if (widget.initialTodo != null) {
      nameController.text = "${widget.initialTodo?.name}";
      descriptionController.text = "${widget.initialTodo?.description}";
      locationController.text = "${widget.initialTodo?.location}";
      colorController = widget.initialTodo?.color ?? 0;
      timeController.text = "${widget.initialTodo?.time}";
    }
    super.initState();
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  var colorController = 0;
  TextEditingController timeController = TextEditingController();
  var customPadding = const EdgeInsets.all(8.0);
  @override
  Widget build(BuildContext context) {
    final router = AutoRouter.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: () {
            router.pop();
          },
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: customPadding,
                child: Text(
                  "Event name",
                  style: kBlack14Text,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  autofocus: true,
                  controller: nameController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: customPadding,
                child: Text(
                  "Event description",
                  style: kBlack14Text,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 110,
                  child: TextField(
                    controller: descriptionController,
                    maxLines: 9,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey[200],
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: customPadding,
                child: Text(
                  "Event location",
                  style: kBlack14Text,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: locationController,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                    filled: true,
                    suffix: const Icon(
                      Icons.location_on,
                      size: 25,
                      color: Colors.blue,
                    ),
                    fillColor: Colors.grey[200],
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: customPadding,
                child: Text(
                  "Priority color",
                  style: kBlack14Text,
                ),
              ),
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            ListTile(
                              leading: Icon(Icons.cancel, color: Colors.red),
                              title: Text('Red color',
                                  style: TextStyle(color: Colors.red)),
                              onTap: () {
                                setState(() {
                                  colorController = 0;
                                });

                                Navigator.pop(context);
                              },
                            ),
                            ListTile(
                              leading: Icon(Icons.restart_alt_outlined,
                                  color: Colors.blue),
                              title: Text('Blue color',
                                  style: TextStyle(color: Colors.blue)),
                              onTap: () {
                                setState(() {
                                  colorController = 1;
                                });

                                Navigator.pop(context);
                              },
                            ),
                            ListTile(
                              leading:
                                  Icon(Icons.dark_mode, color: Colors.yellow),
                              title: Text('Yellow color',
                                  style: TextStyle(color: Colors.yellow)),
                              onTap: () {
                                setState(() {
                                  colorController = 2;
                                });

                                Navigator.pop(context);
                              },
                            ),
                            ListTile(
                              leading: Icon(Icons.done, color: Colors.green),
                              title: Text('Green color',
                                  style: TextStyle(color: Colors.green)),
                              onTap: () {
                                setState(() {
                                  colorController = 3;
                                });

                                Navigator.pop(context);
                              },
                            ),
                          ],
                        );
                      });
                },
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(10)),
                      width: 75,
                      height: 40,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                              width: 20,
                              height: 20,
                              color: colorController == 0
                                  ? Color.fromRGBO(246, 207, 198, 1)
                                  : colorController == 1
                                      ? Colors.blue
                                      : colorController == 2
                                          ? Colors.yellow
                                          : Colors.green),
                          const Icon(Icons.keyboard_arrow_down,
                              color: Colors.blue, size: 30),
                        ],
                      ),
                    )),
              ),
              Padding(
                  padding: customPadding,
                  child: Text("Event time", style: kBlack14Text)),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: timeController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10.0)),
                  ),
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 25),
              child: BlocBuilder<CalendarBloc, CalendarState>(
                builder: (context, state) {
                  return TextButton(
                    style: TextButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                            horizontal: MediaQuery.of(context).size.width - 250,
                            vertical: 23),
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)
                            // side: BorderSide(color: Colors.red),
                            )),
                    child: const Text(
                      "+ Add Event",
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                    onPressed: () {
                      var todoCreated = Todo(
                        id: widget.initialTodo?.id,
                        date:
                            "${widget.date.year}-${widget.date.month}-${widget.date.day}",
                        name: nameController.text,
                        description: descriptionController.text,
                        location: locationController.text,
                        color: colorController,
                        time: timeController.text,
                        monthYear: "${widget.date.year}-${widget.date.month}",
                      );
                      if (widget.initialTodo != null) {
                        context.read<CalendarBloc>().add(
                              EditTodoEvent(todoCreated),
                            );

                        context.read<CalendarBloc>().add(
                              GetTodosEvent(state.date),
                            );
                        context.read<CalendarBloc>().add(
                              GetMonthlyTodosEvent(
                                  "${state.date?.year}-${state.date?.month}"),
                            );
                      } else {
                        context.read<CalendarBloc>().add(
                              InsertTodoEvent(todoCreated),
                            );

                        context.read<CalendarBloc>().add(
                              GetTodosEvent(state.date),
                            );
                        context.read<CalendarBloc>().add(
                              GetMonthlyTodosEvent(
                                  "${state.date?.year}-${state.date?.month}"),
                            );
                      }

                      router.pushNamed(
                        MainHScreen.routeName,
                      );
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
