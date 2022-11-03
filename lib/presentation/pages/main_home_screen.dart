import 'package:auto_route/auto_route.dart';
import 'package:calendar_for_alif/presentation/bloc/calendar_bloc.dart';
import 'package:calendar_for_alif/presentation/pages/event_add_page.dart';
import 'package:calendar_for_alif/presentation/pages/todo_detailed.dart';
import 'package:calendar_for_alif/presentation/pages/widgets/custom_navigate_button.dart';
import 'package:calendar_for_alif/presentation/pages/widgets/custom_todo_card.dart';
import 'package:calendar_for_alif/presentation/pages/widgets/list_custom.dart';
import 'package:calendar_for_alif/presentation/pages/widgets/weekdays.dart';
import 'package:calendar_for_alif/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/model/days.dart';
import '../../utils/components.dart';
import '../../utils/functions.dart';

class MainHScreen extends StatefulWidget {
  MainHScreen({Key? key}) : super(key: key);
  static const routeName = '/main-home-screen';

  @override
  State<MainHScreen> createState() => _MainHScreenState();
}

class _MainHScreenState extends State<MainHScreen> {
  var fundamentalPadding = const EdgeInsets.symmetric(
    horizontal: 28.0,
    vertical: 16,
  );

  var blueBlackCustom = Color.fromRGBO(5, 110, 161, 1);

  @override
  void initState() {
    DateTime now = DateTime.now();
    context.read<CalendarBloc>().add(
          GetTodosEvent(now),
        );
    context.read<CalendarBloc>().add(
          GetMonthlyTodosEvent("${now.year}-${now.month}"),
        );
  }

  @override
  Widget build(BuildContext context) {
    DateTime? now;
    final router = AutoRouter.of(context);
    return BlocBuilder<CalendarBloc, CalendarState>(
      builder: (context, state) {
        if (state.date == null) {
          now = DateTime.now();
          var formattedDate = "${now!.year}-${now!.month}-${now!.day}";
          print(formattedDate.toString());
        } else {
          now = state.date;
        }
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 12.0, left: 20),
                  child: Text(
                    "${weekDayString(now?.weekday)}",
                    style: kBlack14textBold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 45.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "${now?.day} ${monthString(now?.month)} ${now?.year}",
                        style: kBlack12Text,
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.keyboard_arrow_down_outlined,
                            color: Colors.black,
                          )),
                    ],
                  ),
                ),
              ],
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 25.0),
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.notifications,
                    color: Colors.black,
                    size: 40,
                  ),
                ),
              )
            ],
          ),
          backgroundColor: Colors.white,
          body: Column(
            children: [
              Padding(
                padding: fundamentalPadding,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${monthString(now?.month)}",
                      style: kBlack14textBold,
                    ),
                    Row(
                      children: [
                        CustomNavigateButton(
                          icon: Icon(Icons.navigate_before),
                          callback: () {
                            context.read<CalendarBloc>().add(
                                  GetTodosEvent(DateTime(
                                      state.date!.year, state.date!.month - 1)),
                                );
                          },
                        ),
                        CustomNavigateButton(
                          icon: Icon(Icons.navigate_next),
                          callback: () {
                            context.read<CalendarBloc>().add(
                                  GetTodosEvent(DateTime(
                                      state.date!.year, state.date!.month + 1)),
                                );
                          },
                        ),
                      ],
                    )
                  ],
                ),
              ),
              CalendarCustom(),
              Padding(
                padding: fundamentalPadding,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Schedule",
                      style: kBlack14textBold,
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        padding:
                            EdgeInsets.symmetric(horizontal: 22, vertical: 8),
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          // side: BorderSide(color: Colors.red),
                        ),
                      ),
                      child: const Text(
                        "+ Add Event",
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                      onPressed: () {
                        router.pushWidget(
                          EventAddPage(date: now!),
                        );
                      },
                    ),
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.width - 90,
                child: state.status == Statuses.loading
                    ? CircularProgressIndicator()
                    : ListView.builder(
                        shrinkWrap: true,
                        itemCount: state.todos?.length ?? 0,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              router.pushWidget(
                                TodoDetailed(
                                  todo: state.todos![index]!,
                                ),
                              );
                            },
                            child: CustomTodoCard(
                              todo: state.todos![index]!,
                              color1:
                                  getColor(state.todos?[index]?.color ?? 1, 1),
                              color2:
                                  getColor(state.todos?[index]?.color ?? 1, 2),
                              color3:
                                  getColor(state.todos?[index]?.color ?? 1, 3),
                            ),
                          );
                        },
                      ),
              )
            ],
          ),
        );
      },
    );
  }
}

class CalendarCustom extends StatelessWidget {
  const CalendarCustom({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      width: MediaQuery.of(context).size.width - 25,
      height: 290,
      child: BlocBuilder<CalendarBloc, CalendarState>(
        builder: (context, state) {
          if (state.status == Statuses.loading) {
            return CircularProgressIndicator();
          } else if (state.status == Statuses.error) {
            return Center(
              child: Text("Error"),
            );
          } else if (state.status == Statuses.success) {
            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    weekdays("Mon"),
                    weekdays("Tue"),
                    weekdays("Wed"),
                    weekdays("Thu"),
                    weekdays("Fri"),
                    weekdays("Sat"),
                    weekdays("Sun"),
                  ],
                ),
                ListCustomDate(list: state.days?[0]),
                ListCustomDate(list: state.days?[1]),
                ListCustomDate(list: state.days?[2]),
                ListCustomDate(list: state.days?[3]),
                ListCustomDate(list: state.days?[4]),
              ],
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
