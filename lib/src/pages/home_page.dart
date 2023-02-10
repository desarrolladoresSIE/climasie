import 'package:clima/src/blocs/bloc/clima_bloc.dart';
import 'package:clima/src/models/clima_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ClimaBloc, ClimaState>(
        builder: (context, state) {
          return (state.clima != null)
              ? Stack(
                  alignment: Alignment.center,
                  children: [
                    const _FondoApp(),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SafeArea(
                            child: _TextNameZoneAndDateWidget(
                              zoneName: state.clima!.name,
                            ),
                          ),
                          IntrinsicHeight(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                _DateTemp(climaModel: state.clima!),
                                const VerticalDivider(
                                  color: Colors.white,
                                  thickness: 1,
                                ),
                                const _TempMaxMin()
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                )
              : const Center(
                  child: CircularProgressIndicator(),
                );
        },
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
  final ClimaModel climaModel;
  const _DateTemp({required this.climaModel});

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
              climaModel.weather.getUrlImageClima(),
              height: 40,
            ),
            Text(
              climaModel.weather.description,
              style: const TextStyle(
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
  final String zoneName;
  const _TextNameZoneAndDateWidget({required this.zoneName});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          zoneName,
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
  }
}
