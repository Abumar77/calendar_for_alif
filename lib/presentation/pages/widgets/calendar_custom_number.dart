import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/calendar_bloc.dart';

class CalendarNumbersCustom extends StatelessWidget {
  CalendarNumbersCustom({
    Key? key,
    required this.num,
    this.taskQuantity,
  }) : super(key: key);

  final String num;
  int? taskQuantity;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalendarBloc, CalendarState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            context.read<CalendarBloc>().add(
                  GetTodosEvent(DateTime(
                      state.date!.year, state.date!.month, int.parse(num))),
                );
          },
          child: Container(
            alignment: Alignment.center,
            width: 52,
            height: 50,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: state.date?.day.toString() == num
                          ? Colors.blue
                          : Colors.white,
                      borderRadius: BorderRadius.circular(30)),
                  child: Text(
                    num == "0" ? " " : num,
                    style: const TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                taskQuantity == 1
                    ? Text("·")
                    : taskQuantity == 2
                        ? Text("··")
                        : taskQuantity == 3
                            ? Text("···")
                            : SizedBox()
              ],
            ),
          ),
        );
      },
    );
  }
}
