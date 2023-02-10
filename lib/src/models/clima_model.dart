class ClimaModel {
  final Main main;
  final Weather weather;
  final int visibility;
  final String name;

  ClimaModel({
    required this.main,
    required this.weather,
    required this.visibility,
    required this.name,
  });

  factory ClimaModel.fromMapJson(Map<String, dynamic> json) => ClimaModel(
        main: Main.fromMapJson(json['main']),
        weather: Weather.fromMapJson(json['weather'].first),
        visibility: json['visibility'],
        name: json['name'],
      );
}

class Weather {
  final int id;
  final String main;
  final String description;
  final String icon;

  Weather({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  factory Weather.fromMapJson(Map<String, dynamic> json) => Weather(
        id: json['id'],
        main: json['main'],
        description: json['description'],
        icon: json['icon'],
      );

  String getUrlImageClima() {
    return 'http://openweathermap.org/img/wn/$icon@2x.png';
  }
}

class Main {
  final double temp;
  final double feelsLike;
  final double tempMin;
  final double tempMax;
  final int pressure;
  final int humidity;
  final int seaLevel;
  final int grndLevel;

  Main({
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.humidity,
    required this.seaLevel,
    required this.grndLevel,
  });

  factory Main.fromMapJson(Map<String, dynamic> json) => Main(
        temp: json['temp'],
        feelsLike: json['feels_like'],
        grndLevel: json['grnd_level'],
        humidity: json['humidity'],
        pressure: json['pressure'],
        seaLevel: json['sea_level'],
        tempMax: json['temp_max'],
        tempMin: json['temp_min'],
      );
}
