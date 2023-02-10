import 'package:clima/src/blocs/bloc/clima_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          const _FondoApp(),
          Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const SafeArea(child: _TextNameZoneAndDateWidget()),
                  IntrinsicHeight(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: const [
                        _DateTemp(),
                        VerticalDivider(
                          color: Colors.white,
                          thickness: 1,
                        ),
                        _TempMaxMin()
                      ],
                    ),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}

class _TempMaxMin extends StatelessWidget {
  const _TempMaxMin();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        _TemMaxMinWidget(
          description: 'Máxima',
          icono: Icons.arrow_upward_rounded,
          tem: 38,
        ),
        SizedBox(height: 4),
        _TemMaxMinWidget(
          description: 'Mínima',
          icono: Icons.arrow_downward_sharp,
          tem: 12,
        ),
      ],
    );
  }
}

class _DateTemp extends StatelessWidget {
  const _DateTemp();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '33º',
          textWidthBasis: TextWidthBasis.longestLine,
          style: TextStyle(
            color: Colors.white,
            fontSize: 75,
            fontWeight: FontWeight.bold,
          ),
        ),
        Row(
          children: [
            Image.network(
              'http://openweathermap.org/img/wn/01d@2x.png',
              height: 40,
            ),
            const Text(
              'Soleado',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 15),
            )
          ],
        )
      ],
    );
  }
}

class _FondoApp extends StatelessWidget {
  const _FondoApp();
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.network(
          'https://w0.peakpx.com/wallpaper/525/262/HD-wallpaper-sunny-day-bright-clouds-color-nature-new-nice-sky-sun.jpg',
          fit: BoxFit.cover,
          height: double.infinity,
        ),
        Container(
          height: double.infinity,
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.4),
          ),
        ),
      ],
    );
  }
}

class _TemMaxMinWidget extends StatelessWidget {
  final String description;
  final double tem;
  final IconData icono;
  const _TemMaxMinWidget({
    required this.description,
    required this.icono,
    required this.tem,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text.rich(
          TextSpan(
            text: description,
            style: const TextStyle(color: Colors.white),
            children: [
              WidgetSpan(
                child: Icon(
                  icono,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
        Text(
          '${tem.toString()}º',
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        )
      ],
    );
  }
}

class _TextNameZoneAndDateWidget extends StatelessWidget {
  const _TextNameZoneAndDateWidget();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ClimaBloc, ClimaState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Estacion cihahuila',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 3),
            const Text(
              '22 de marzo del 2022',
              style: TextStyle(
                color: Colors.white,
                fontSize: 13,
              ),
            ),
          ],
        );
      },
    );
  }
}
