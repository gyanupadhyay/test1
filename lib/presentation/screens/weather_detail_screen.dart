import 'package:flutter/material.dart';
import 'package:test1/models/weather_model.dart';

class WeatherDetailScreen extends StatelessWidget {
  const WeatherDetailScreen({super.key, required this.weatherModel});

  final WeatherModel weatherModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Weather Detail Screen')),
      body: Column(children: [Text(weatherModel.name)]),
    );
  }
}
