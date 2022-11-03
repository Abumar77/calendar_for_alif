import 'package:flutter/material.dart';

import '../../../utils/components.dart';

class weekdays extends StatelessWidget {
  const weekdays(this.name) : super();

  final String name;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 9.0, vertical: 7),
      child: Text(
        "$name",
        style: kGreyWeekday,
      ),
    );
  }
}
