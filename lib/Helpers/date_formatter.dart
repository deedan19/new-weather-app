import 'package:intl/intl.dart';

String formattedDate() {
  final DateTime now = DateTime.now();
  final String formattedDate = DateFormat('EEE d MMM').format(now);
  return formattedDate;
}
