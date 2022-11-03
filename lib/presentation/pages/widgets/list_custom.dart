import 'package:flutter/material.dart';

import '../../../data/model/days.dart';
import '../main_home_screen.dart';
import 'calendar_custom_number.dart';

class ListCustomDate extends StatelessWidget {
  const ListCustomDate({
    Key? key,
    required this.list,
  }) : super(key: key);

  final List<Days?>? list;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        CalendarNumbersCustom(
          num: "${list?[0]?.number.toString() ?? " "}",
          taskQuantity: list?[0]?.taskColorNumber?.length,
        ),
        CalendarNumbersCustom(
          num: "${list?[1]?.number.toString() ?? " "}",
          taskQuantity: list?[1]?.taskColorNumber?.length,
        ),
        CalendarNumbersCustom(
          num: "${list?[2]?.number.toString() ?? " "}",
          taskQuantity: list?[2]?.taskColorNumber?.length,
        ),
        CalendarNumbersCustom(
          num: "${list?[3]?.number.toString() ?? " "}",
          taskQuantity: list?[3]?.taskColorNumber?.length,
        ),
        CalendarNumbersCustom(
          num: "${list?[4]?.number.toString() ?? " "}",
          taskQuantity: list?[4]?.taskColorNumber?.length,
        ),
        CalendarNumbersCustom(
          num: "${list?[5]?.number.toString() ?? " "}",
          taskQuantity: list?[5]?.taskColorNumber?.length,
        ),
        CalendarNumbersCustom(
          num: "${list?[6]?.number.toString() ?? " "}",
          taskQuantity: list?[6]?.taskColorNumber?.length,
        ),
      ],
    );
  }
}
