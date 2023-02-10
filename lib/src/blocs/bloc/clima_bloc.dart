import 'package:bloc/bloc.dart';
import 'package:clima/src/models/clima_model.dart';
import 'package:clima/src/services/clima_service.dart';
import 'package:equatable/equatable.dart';

part 'clima_event.dart';
part 'clima_state.dart';

class ClimaBloc extends Bloc<ClimaEvent, ClimaState> {
  final ClimaService climaService;
  ClimaBloc({required this.climaService}) : super(const ClimaState()) {
    on<ClimaActualEvent>(
        (event, emit) => emit(state.copyWith(clima: event.climaModel)));

    getClima();
  }

  Future<void> getClima() async {
    final response = await climaService.httpGet();
    final clima = ClimaModel.fromMapJson(response.data);
    add(ClimaActualEvent(clima));
    await Future.delayed(const Duration(seconds: 3));
  }
}
