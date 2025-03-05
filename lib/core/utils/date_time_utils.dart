import 'package:expensetracker/core/theme/theme_import.dart';
import 'package:expensetracker/core/utils/check_locale.dart';
import 'package:expensetracker/core/utils/log.dart';
import 'package:expensetracker/core/utils/text_utils.dart';
import 'package:intl/intl.dart';
import 'package:nepali_utils/nepali_utils.dart';

class DateTimeUtils {
  static String getFormattedDateInStringEn(String? date,
      [bool toLocal = false]) {
    try {
      if (date == null || date.isEmpty) {
        return "";
      }

      DateTime? dateTime;

      dateTime = DateTime.tryParse(date);

      if (dateTime != null) {
        return DateFormat('yyyy-MM-dd')
            .format(toLocal ? dateTime.toLocal() : dateTime);
      } else {
        dateTime =
            DateTime.fromMillisecondsSinceEpoch(int.tryParse(date) ?? 0 * 1000);

        return DateFormat('yyyy-MM-dd').format(dateTime);
      }
    } catch (e) {
      Log.e(e);
      return "";
    }
  }

  static convertAdIntoBs(String value) {
    try {
      final NepaliDateFormat formatter = NepaliDateFormat('MMMM d, y',
          CheckLocal.isEnglish() ? Language.english : Language.nepali);

      final temp = DateTime.tryParse(value);
      if (temp != null) {
        return formatter.format(temp.toNepaliDateTime());
      }
      return "";
    } catch (e) {
      return _convertAdIntoBsString(value);
    }
  }

  // static convertDateTimeToLocal(String? date) {
  //   try {
  //     if (date == null || date.isEmpty) {
  //       return "";
  //     }

  //     DateTime? dateTime;

  //     dateTime = DateTime.tryParse(date);

  //     if (dateTime != null) {
  //       return DateFormat('MMMM d, y').format(dateTime.toLocal());
  //     } else {
  //       dateTime =
  //           DateTime.fromMillisecondsSinceEpoch(int.tryParse(date) ?? 0 * 1000);

  //       return DateFormat('MMMM d, y').format(dateTime);
  //     }
  //   } catch (e) {
  //     Log.e(e);
  //     return "";
  //   }
  // }

  static convertBsIntoBs(String value) {
    try {
      final NepaliDateFormat formatter = NepaliDateFormat('MMMM d, y',
          CheckLocal.isEnglish() ? Language.english : Language.nepali);

      final temp = NepaliDateTime.tryParse(value);

      if (temp != null) {
        return formatter.format(temp);
      }
      return "";
    } catch (e) {
      return value.toNepali();
    }
  }

  static String _convertAdIntoBsString(String value) {
    try {
      final NepaliDateFormat formatter = NepaliDateFormat('y-MM-dd');

      final temp = DateTime.tryParse(value);
      if (temp != null) {
        final value = formatter.format(temp.toNepaliDateTime());

        return value.toNepali();
      }
      return "";
    } catch (e) {
      return value;
    }
  }

  static String formatTimeOfDay(TimeOfDay timeOfDay) {
    try {
      final hour = timeOfDay.hour.toString().padLeft(2, '0');
      final minute = timeOfDay.minute.toString().padLeft(2, '0');
      return '$hour:$minute';
    } catch (e) {
      Log.e(e);
      return "";
    }
  }

  static String formatTimeInAmPm(String value) {
    try {
      final DateFormat inputFormat = DateFormat('HH:mm');
      final DateFormat outputFormat = DateFormat('hh:mm a');
      final DateTime time = inputFormat.parse(value);
      return outputFormat.format(time);
    } catch (e) {
      debugPrint(e.toString());
      return "";
    }
  }

  static String convertDateIntoTime(String? value, [bool isLocal = false]) {
    if (value == null) {
      return "";
    }
    DateTime? date = DateTime.tryParse(value);

    if (date != null) {
      if (CheckLocal.isEnglish()) {
        final DateFormat outputFormat = DateFormat('hh:mm a');

        return outputFormat.format(isLocal ? date.toLocal() : date);
      } else {
        NepaliDateTime _date = NepaliDateTime.parse(date.toIso8601String());

        return NepaliDateFormat('hh:mm a', Language.nepali).format(_date);
      }
    } else {
      return "";
    }
  }

  static String convertDateIntoTimeBs(String value) {
    final temp = DateTime.tryParse(value);

    if (temp != null) {
      return NepaliDateFormat('hh:mm a',
              CheckLocal.isEnglish() ? Language.english : Language.nepali)
          .format(temp.toNepaliDateTime());
    } else {
      return "";
    }
  }

  static String getWeekDayFromDataTime(String value) {
    DateTime? date = DateTime.tryParse(value);

    if (date != null) {
      if (CheckLocal.isEnglish()) {
        return DateFormat('EEEE').format(date);
      } else {
        return NepaliDateFormat('EEE', Language.nepali)
            .format(date.toNepaliDateTime());
      }
    } else {
      return "";
    }
  }

  static String getChatMesageDate(String value) {
    DateTime? date = DateTime.tryParse(value);

    if (date != null) {
      return DateFormat('MMMM d, hh:mm a').format(date);
    } else {
      return "";
    }
  }

  static bool isAfter(String time) {
    DateTime? _time = DateTime.tryParse(time);

    if (_time != null) {
      DateTime currentTime = DateTime.now();

      return currentTime.isAfter(_time);
    }
    return false;
  }

  static String combineDateAndTime(DateTime date, TimeOfDay time) {
    return DateTime(date.year, date.month, date.day, time.hour, time.minute)
        .toIso8601String();
  }

  static String convertDateIntoDateTime(String date, [bool toLocal = false]) {
    try {
      if (date == null || date.isEmpty) {
        return "";
      }

      DateTime? dateTime;

      dateTime = DateTime.tryParse(date);

      if (dateTime != null) {
        return DateFormat('MMMM d, y,hh:mm a')
            .format(toLocal ? dateTime.toLocal() : dateTime);
      } else {
        dateTime =
            DateTime.fromMillisecondsSinceEpoch(int.tryParse(date) ?? 0 * 1000);

        return DateFormat('MMMM d, y').format(dateTime);
      }
    } catch (e) {
      Log.e(e);
      return "";
    }

    //   if (value == null) {
    //   return "";
    // }
    // DateTime? date = DateTime.tryParse(value);

    // if (date != null) {
    //   if (CheckLocal.isEnglish()) {
    //     final DateFormat outputFormat = DateFormat('hh:mm a');

    //     return outputFormat.format(isLocal ? date.toLocal() : date);
    //   } else {
    //     NepaliDateTime _date = NepaliDateTime.parse(date.toIso8601String());

    //     return NepaliDateFormat('hh:mm a', Language.nepali).format(_date);
    //   }
    // } else {
    //   return "";
    // }
  }
}
