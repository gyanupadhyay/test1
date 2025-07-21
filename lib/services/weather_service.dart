import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:test1/models/weather_model.dart';

class WeatherService {
  Future<WeatherModel> getWeatherForCity(String city) async {
    try {
      final response = await http.get(
        Uri.parse(
          'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=d7b950541d7264a3b3df80a8b6f2cbf7',
        ),
      );

      if (response.statusCode == 200) {
        final weatherModel = WeatherModel.fromJson(jsonDecode(response.body));
        return weatherModel;
      } else {
        throw Exception('Failed to load weather data: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching weather: $e');
    }
  }
}
