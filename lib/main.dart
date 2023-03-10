import 'package:clima/src/blocs/bloc/clima_bloc.dart';
import 'package:clima/src/pages/home_page.dart';
import 'package:clima/src/services/clima_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(
      MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => ClimaBloc(
              climaService: ClimaService(),
            ),
          )
        ],
        child: const MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Clima',
      initialRoute: '/',
      routes: {
        '/': (_) => const HomePage(),
      },
    );
  }
}
