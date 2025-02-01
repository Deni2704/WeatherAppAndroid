import 'package:flutter/material.dart';
import 'package:myapp/models/weather_model.dart';
import 'package:myapp/services/weather_services.dart';
import 'package:lottie/lottie.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {

  //api key
  final _weatherService = WeatherServices('e075cfb98e94d5162a7fce8c83a37d16');
  Weather? _weather;

  //fetch weather 
  _fetchWeather() async {
    //get the current city 
     String cityName = await _weatherService.getCurrentCity();
    //get weather for city

    try {
      final weather = await _weatherService.getWeather(cityName);
      setState(() {
        _weather = weather;
      });
    }

    catch(e) {
      print(e);
    }
  }
  //weather animation
  

  //init state
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fetchWeather();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
       child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //cityname
          Text(_weather?.cityName ?? "loading city..."),
          Lottie.asset('assets/cloud.json'),
          //temp
          _weather==null ? CircularProgressIndicator()
          :
          Text('${_weather?.temperature.round()}C')
        ],
      ),
    )
    );
  }
}