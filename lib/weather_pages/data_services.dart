import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:untitled3/weather_pages/model.dart';

class DataService {
  Future<WeatherResponse> getWeather(String lat, String lon) async {

    //https://api.openweathermap.org/data/2.5/weather?lat={lat}&lon={lon}&appid={API key}

    final queryParameters = {
      'lat': lat,
      'lon': lon,
      'appid': '4695af36bd3410fd702fb4b65d217fcf',
      'units' : 'metric'
    };
    final uri = Uri.https(
        'api.openweathermap.org', '/data/2.5/weather', queryParameters);

    final response = await http.get(uri);


    final json = jsonDecode(response.body);
    return WeatherResponse.fromJson(json);
  }
}
