import 'package:flutter/material.dart';
import 'package:myapp/pages/weather_page.dart';


void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Widget build(BuildContext context) {
    return const MaterialApp(
       debugShowCheckedModeBanner: false,
       home: WeatherPage(),
    ) ;
  }
  
  
}

