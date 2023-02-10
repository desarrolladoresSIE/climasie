part of 'clima_bloc.dart';

abstract class ClimaEvent extends Equatable {
  const ClimaEvent();

  @override
  List<Object> get props => [];
}

class ClimaActualEvent extends ClimaEvent {
  final ClimaModel climaModel;

  const ClimaActualEvent(this.climaModel);
}
