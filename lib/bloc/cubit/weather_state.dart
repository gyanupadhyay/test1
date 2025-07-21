import 'package:equatable/equatable.dart';
import 'package:test1/models/weather_model.dart';

abstract class WeatherCubitState extends Equatable {
  const WeatherCubitState();

  @override
  List<Object> get props => [];
}

class WeatherCubitInitial extends WeatherCubitState {}

class WeatherCubitLoading extends WeatherCubitState {}

class WeatherCubitLoaded extends WeatherCubitState {
  final WeatherModel weatherModel;

  const WeatherCubitLoaded(this.weatherModel);
}

class WeatherCubitError extends WeatherCubitState {
  final String error;
  const WeatherCubitError(this.error);
}
