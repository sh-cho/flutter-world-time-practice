import 'package:flutter/material.dart';

import '../services/world_time.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  WorldTime _worldTime = WorldTime(
    countryCode: 'N/A',
    timezone: 'N/A',
    cityName: 'N/A',
  );

  @override
  Widget build(BuildContext context) {
    _worldTime = _worldTime.countryCode == 'N/A'
        ? ModalRoute.of(context)!.settings.arguments as WorldTime
        : _worldTime;
    String bgPath = 'assets/${_worldTime.isDayTime ? 'day.jpg' : 'night.jpg'}';
    Color bgColor =
        _worldTime.isDayTime ? Colors.lightBlue[100]! : Colors.deepPurple;
    Color pointColor = _worldTime.isDayTime ? Colors.black : Colors.white;

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(bgPath),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 120),
            child: Column(
              children: [
                TextButton.icon(
                  onPressed: () async {
                    WorldTime selected =
                        await Navigator.pushNamed(context, '/location')
                            as WorldTime;

                    setState(() {
                      _worldTime = selected;
                    });
                  },
                  icon: Icon(
                    Icons.edit_location,
                    color: pointColor,
                  ),
                  label: Text(
                    'Edit Location',
                    style: TextStyle(
                      color: pointColor,
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                Center(
                  child: Text(
                    _worldTime.cityName,
                    style: TextStyle(
                      fontSize: 28.0,
                      letterSpacing: 2.0,
                      color: pointColor,
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                Center(
                  child: Text(
                    _worldTime.jm,
                    style: TextStyle(
                      fontSize: 66,
                      color: pointColor,
                    ),
                  ),
                ),
                SizedBox(height: 10.0),
                Center(
                  child: Text(
                    _worldTime.yMMMMd,
                    style: TextStyle(
                      fontSize: 15,
                      color: pointColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
