import 'dart:convert';

import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:timezone/standalone.dart' as tz;

class WorldTime {
  // Two digits. ex) South Korea -> "kr"
  final String countryCode;

  // TZ. ex) Europe/Berlin
  final String timezone;

  // city name to be printed
  final String cityName;

  late tz.TZDateTime dateTime;

  WorldTime({
    required this.countryCode,
    required this.timezone,
    required this.cityName,
  });

  Future<void> getTime() async {
    Response response =
        await get(Uri.http('worldtimeapi.org', '/api/timezone/$timezone'));
    Map data = jsonDecode(response.body);

    var loc = tz.getLocation(timezone);
    dateTime = tz.TZDateTime.parse(loc, data['datetime']);
  }

  String get flagPath {
    return 'assets/flags/${countryCode.toLowerCase()}.png';
  }

  String get jm {
    return DateFormat.jm().format(dateTime);
  }

  String get yMMMMd {
    return DateFormat.yMMMMd().format(dateTime);
  }

  bool get isDayTime {
    return dateTime.hour > 6 && dateTime.hour < 20;
  }
}
