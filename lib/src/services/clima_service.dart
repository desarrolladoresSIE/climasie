import 'package:dio/dio.dart';

class ClimaService {
  ClimaService();

   Future<Response> httpGet() async {
    final dio = Dio();
    final response = await dio.get(
        'https://api.openweathermap.org/data/2.5/weather',
        queryParameters: {
          'lat': '32.22105812934381',
          'lon': '-115.03079740065172',
          'appid': '54b069e20c2b992cd7d5ad65e45220f4',
          'lang': 'es'
        });
    return response;
  }
}
