import 'package:client/helper/toast.dart';
import 'package:intl/intl.dart';

class Util {
  static String formatDate(
    DateTime? date, {
    String pattern = 'dd MMM yyyy',
    bool showTime = false,
    String locale = 'en_US',
    String fallback = '',
  }) {
    if (date == null) return fallback;

    String fullPattern = showTime ? '$pattern, hh:mm a' : pattern;
    final formatter = DateFormat(fullPattern, locale);
    return formatter.format(date);
  }

  static showError(String message) {
    ToastUtils.showError(title: 'Auth Error', subtitle: message);
  }
}
