import 'dart:convert';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class _MyAppState extends State<MyApp> {
  List<Weather> weatherData = [];

  @override
  void initState() {
    super.initState();
    // JSON data
    final jsonData = '''
    [
      {
        "city": "New York",
        "temperature": 20,
        "condition": "Clear",
        "humidity": 60,
        "windSpeed": 5.5
      },
      {
        "city": "Los Angeles",
        "temperature": 25,
        "condition": "Sunny",
        "humidity": 50,
        "windSpeed": 6.8
      },
      {
        "city": "London",
        "temperature": 15,
        "condition": "Partly Cloudy",
        "humidity": 70,
        "windSpeed": 4.2
      },
      {
        "city": "Tokyo",
        "temperature": 28,
        "condition": "Rainy",
        "humidity": 75,
        "windSpeed": 8.0
      },
      {
        "city": "Sydney",
        "temperature": 22,
        "condition": "Cloudy",
        "humidity": 55,
        "windSpeed": 7.3
      }
    ]
    ''';

    final decodedData = json.decode(jsonData);
    weatherData = decodedData.map<Weather>((json) => Weather.fromJson(json)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Weather Information'),
        ),
        body: ListView.builder(
          itemCount: weatherData.length,
          itemBuilder: (context, index) {
            final weather = weatherData[index];
            return Card(
              child: ListTile(
                title: Text("City: ${weather.city}", style: TextStyle(
                  fontSize: 18,
                ),),
                subtitle: Text(
                  "Temperature: ${weather.temperature}°C\n"
                      "Condition: ${weather.condition}\n"
                      "Humidity: ${weather.humidity}%\n"
                      "Wind Speed: ${weather.windSpeed} km/h",style: TextStyle(
                  fontSize: 16,
                ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class Weather {
  final String city;
  final double temperature;
  final String condition;
  final int humidity;
  final double windSpeed;

  Weather({
    required this.city,
    required this.temperature,
    required this.condition,
    required this.humidity,
    required this.windSpeed,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      city: json['city'],
      temperature: json['temperature'].toDouble(),
      condition: json['condition'],
      humidity: json['humidity'],
      windSpeed: json['windSpeed'].toDouble(),
    );
  }
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}