import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test1/bloc/cubit/weather_state.dart';
import 'package:test1/services/weather_service.dart';

class WeatherCubit extends Cubit<WeatherCubitState> {
  final WeatherService weatherService;

  WeatherCubit(this.weatherService) : super(WeatherCubitInitial());

  void getWeatherByCity(String city) async {
    emit(WeatherCubitLoading());

    try {
      final weatherModel = await weatherService.getWeatherForCity(city);
      emit(WeatherCubitLoaded(weatherModel));
    } catch (e) {
      emit(WeatherCubitError(e.toString()));
    }
  }
}
