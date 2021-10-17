import 'package:intl/intl.dart';

String dateFormat(DateTime date) {
  return DateFormat('MMMM yyyy').format(date);
}
