import 'package:intl/intl.dart';

class DateFormatManager {
  static String ddMMyyyyFormatter(DateTime date) {
    return DateFormat('dd/MM/yyyy').format(date);
  }
}
