import 'package:flutter/material.dart';

import '../services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(
      countryCode: 'de',
      timezone: 'Europe/Berlin',
      cityName: 'Berlin',
    ),
    WorldTime(
      countryCode: 'gb',
      timezone: 'Europe/London',
      cityName: 'London',
    ),
    WorldTime(
      countryCode: 'gr',
      timezone: 'Europe/Athens',
      cityName: 'Athens',
    ),
    WorldTime(
      countryCode: 'us',
      timezone: 'America/Chicago',
      cityName: 'Chicago',
    ),
    WorldTime(
      countryCode: 'us',
      timezone: 'America/New_York',
      cityName: 'New York',
    ),
    WorldTime(
      countryCode: 'eg',
      timezone: 'Africa/Cairo',
      cityName: 'Cairo',
    ),
    WorldTime(
      countryCode: 'ke',
      timezone: 'Africa/Nairobi',
      cityName: 'Nairobi',
    ),
    WorldTime(
      countryCode: 'kr',
      timezone: 'Asia/Seoul',
      cityName: 'Seoul',
    ),
    WorldTime(
      countryCode: 'id',
      timezone: 'Asia/Jakarta',
      cityName: 'Jakarta',
    ),
    WorldTime(
      countryCode: 'ck',
      timezone: 'Pacific/Rarotonga',
      cityName: 'Rarotonga',
    ),
  ];

  Future<void> updateTime(int index) async {
    WorldTime worldTime = locations[index];
    await worldTime.getTime();

    Navigator.pop(context, worldTime);
  }

  @override
  Widget build(BuildContext context) {
    print('build!');
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose a location'),
        backgroundColor: Colors.indigo,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          WorldTime worldTime = locations[index];

          return Card(
            child: ListTile(
              onTap: () {
                updateTime(index);
              },
              leading: CircleAvatar(
                foregroundImage: AssetImage(worldTime.flagPath),
              ),
              title: Text(worldTime.cityName),
            ),
          );
        },
      ),
    );
  }
}
