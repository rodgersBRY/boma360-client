import 'package:intl/intl.dart';

class Util {
  static formatDate(DateTime date, {String pattern = 'dd MMM yyyy'}) {
    return DateFormat(pattern).format(date);
  }

  
}

