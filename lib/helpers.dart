import 'package:intl/intl.dart';

String formatDate(DateTime date) {
  return DateFormat('d MMM y').format(date);
}
