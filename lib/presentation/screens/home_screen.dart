import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:test1/bloc/cubit/weather_cubit.dart';
import 'package:test1/bloc/cubit/weather_state.dart';
import 'package:test1/router/router_constants.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<WeatherCubit>().getWeatherByCity('Delhi');
  }

  @override
  void dispose() {
    super.dispose();
    textEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: BlocBuilder<WeatherCubit, WeatherCubitState>(
          builder: (context, state) {
            if (state is WeatherCubitLoading) {
              return CircularProgressIndicator();
            }

            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    // keyboardType: TextInputType.text,
                    controller: textEditingController,
                    decoration: InputDecoration(
                      label: Text('Please Enter the City'),
                    ),
                  ),
                ),

                ElevatedButton(
                  onPressed: () {
                    context.read<WeatherCubit>().getWeatherByCity(
                      textEditingController.text,
                    );
                  },
                  child: Text('Get City Weather'),
                ),

                if (state is WeatherCubitLoaded)
                  ElevatedButton(
                    onPressed: () {
                      context.push(
                        AppRouteNames.detailScreen,
                        extra: state.weatherModel,
                      );
                    },
                    child: Text('Open Detail Weather Screen'),
                  ),
              ],
            );
          },
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
