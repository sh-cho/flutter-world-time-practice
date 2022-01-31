import 'package:flutter/material.dart';
import 'package:timezone/data/latest.dart' as tz;

import 'pages/choose_location.dart';
import 'pages/home.dart';
import 'pages/loading.dart';

void main() {
  tz.initializeTimeZones();

  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => Loading(),
      '/home': (context) => Home(),
      '/location': (context) => ChooseLocation(),
    },
  ));
}
