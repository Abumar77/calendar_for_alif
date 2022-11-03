import 'package:flutter/material.dart';

String? weekDayString(int? day) {
  String res;
  switch (day) {
    case 1:
      {
        res = "Monday";
        break;
      }

    case 2:
      {
        res = "Tuesday";

        break;
      }
    case 3:
      {
        res = "Wednesday";

        break;
      }
    case 4:
      {
        res = "Thursday";

        break;
      }
    case 5:
      {
        res = "Friday";

        break;
      }

    case 6:
      {
        res = "Saturday";

        break;
      }

    default:
      {
        res = "Sunday";

        break;
      }
  }
  return res;
}

Color getColor(int? colorNumber, int colorNumber2) {
  if (colorNumber == 1) {
    if (colorNumber2 == 1) {
      return Colors.red;
    } else if (colorNumber2 == 2) {
      return Colors.red.shade100;
    } else {
      return Colors.red.shade700;
    }
  }
  if (colorNumber == 2) {
    if (colorNumber2 == 1) {
      return Color.fromRGBO(5, 110, 161, 1);
    } else if (colorNumber2 == 2) {
      return Colors.blue.shade100;
    } else {
      return Colors.blue;
    }
  }
  if (colorNumber == 3) {
    if (colorNumber2 == 1) {
      return Colors.yellow.shade700;
    } else if (colorNumber2 == 2) {
      return Colors.yellow.shade100;
    } else {
      return Colors.yellow.shade700;
    }
  } else {
    if (colorNumber2 == 1) {
      return Colors.green.shade700;
    } else if (colorNumber2 == 2) {
      return Colors.green.shade100;
    } else {
      return Colors.green.shade700;
    }
  }
}

String? monthString(int? month) {
  String res;
  switch (month) {
    case 1:
      {
        res = "January";
        break;
      }

    case 2:
      {
        res = "February";

        break;
      }
    case 3:
      {
        res = "March";

        break;
      }
    case 4:
      {
        res = "April";

        break;
      }
    case 5:
      {
        res = "May";

        break;
      }

    case 6:
      {
        res = "June";

        break;
      }
    case 7:
      {
        res = "July";

        break;
      }
    case 8:
      {
        res = "August";

        break;
      }
    case 9:
      {
        res = "September";

        break;
      }
    case 10:
      {
        res = "October";

        break;
      }
    case 11:
      {
        res = "November";

        break;
      }

    default:
      {
        res = "December";

        break;
      }
  }
  return res;
}
