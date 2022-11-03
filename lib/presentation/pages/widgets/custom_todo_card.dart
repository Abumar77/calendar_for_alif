import 'package:flutter/material.dart';

import '../../../data/model/todo.dart';

class CustomTodoCard extends StatelessWidget {
  CustomTodoCard({
    Key? key,
    required this.todo,
    required this.color1,
    required this.color2,
    required this.color3,
  }) : super(key: key);

  final Todo todo;
  final Color color1;
  final Color color2;
  final Color color3;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 7),
      child: Container(
        width: MediaQuery.of(context).size.width - 56,
        height: 95,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                color: color3,
              ),
              height: 10,
              width: MediaQuery.of(context).size.width - 56,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                color: color2,
              ),
              height: 85,
              width: MediaQuery.of(context).size.width - 60,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 12.0,
                      left: 12,
                    ),
                    child: Container(
                      child: Text(
                        "${todo.name}",
                        style: TextStyle(
                            color: color1,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                    ),
                    child: Container(
                      child: Text(
                        "${todo.description}",
                        style: TextStyle(color: color1, fontSize: 8),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 13.5, top: 10),
                    child: Row(
                      children: [
                        Icon(
                          Icons.access_time_filled_rounded,
                          color: color1,
                        ),
                        Text(
                          "${todo.time}",
                          style: TextStyle(color: color1, fontSize: 10),
                        ),
                        Icon(
                          Icons.location_on,
                          color: color1,
                        ),
                        Text(
                          "${todo.location}",
                          style: TextStyle(color: color1, fontSize: 10),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
