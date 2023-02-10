part of 'clima_bloc.dart';

class ClimaState extends Equatable {
  final ClimaModel? clima;
  const ClimaState({this.clima});

  ClimaState copyWith({
    ClimaModel? clima,
  }) =>
      ClimaState(clima: clima ?? this.clima);
  @override
  List<Object?> get props => [clima];
}
