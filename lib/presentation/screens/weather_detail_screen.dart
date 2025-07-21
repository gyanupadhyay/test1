import 'package:flutter/material.dart';
import 'package:test1/models/weather_model.dart';

class WeatherDetailScreen extends StatelessWidget {
  const WeatherDetailScreen({super.key, required this.weatherModel});

  final WeatherModel weatherModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Weather Detail Screen')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          spacing: 10,
          children: [
            Text(weatherModel.name),
            Text(weatherModel.clouds.all.toString()),
            Text(weatherModel.coord.lat.toString()),
            Text(weatherModel.coord.lon.toString()),
          ],
        ),
      ),
    );
  }
}
