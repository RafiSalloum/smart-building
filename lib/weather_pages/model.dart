
/*
{
  "weather": [
    {
      "description": "moderate rain",
      "icon": "10d"
    }
  ],
  "main": {
    "temp": 298.48,
    "pressure": 1015,
    "humidity": 64,
    "sea_level": 1015,
  },
  "rain": {
    "1h": 3.16
  },
  "clouds": {
    "all": 100
  },
  "timezone": 7200,
  "name": "Zocca",
}

*/

class WeatherResponse
{
  final String cityName;
  final TemperatureInfo tempInfo;
  final WeatherInfo weatherInfo;

  String get iconUrl {return 'https://openweathermap.org/img/wn/${weatherInfo.icon}@2x.png';}

  WeatherResponse({required this.cityName, required this.tempInfo, required this.weatherInfo});

  factory WeatherResponse.fromJson(Map<String, dynamic> json)
  {
    final cityName = json['name'];

    final tempInfoJson = json['main'];
    final tempInfo = TemperatureInfo.fromJson(tempInfoJson);

    final weatherInfoJson = json['weather'][0];
    final weatherInfo = WeatherInfo.fromJson(weatherInfoJson);

    return WeatherResponse(cityName: cityName, tempInfo: tempInfo, weatherInfo: weatherInfo);
  }
}

class TemperatureInfo
{
  final double temperature;

  TemperatureInfo({required this.temperature});
  factory TemperatureInfo.fromJson(Map<String, dynamic> json)
  {
    final temperature = json['temp'];

    return TemperatureInfo(temperature: temperature);
  }
}

class WeatherInfo
{
  final String description;
  final String icon;

  WeatherInfo({required this.description, required this.icon});

  factory WeatherInfo.fromJson(Map<String, dynamic> json)
  {
    final description = json['description'];
    final icon = json['icon'];

    return WeatherInfo(description: description, icon: icon);
  }
}
