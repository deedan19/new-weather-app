import 'package:intl/intl.dart';

class Formatter {
  static String formatTimeOfDay(String timeString) {
    DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss");
    DateTime dateTime = dateFormat.parse(timeString);
    final time = DateFormat.j().format(dateTime);
    return time;
  }

  static String formatDay(String dayString) {
    DateFormat dayFormat = DateFormat("yyyy-MM-dd HH:mm:ss");
    DateTime dayTime = dayFormat.parse(dayString);
    final day = DateFormat('EEEE').format(dayTime);
    return day;
  }
}
