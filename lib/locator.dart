import 'package:get_it/get_it.dart';
import 'package:test1/services/weather_service.dart';

final sl = GetIt.instance;

void setupLocator() {
  sl.registerLazySingleton<WeatherService>(() => WeatherService());
}
