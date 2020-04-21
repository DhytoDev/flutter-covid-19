import 'package:equatable/equatable.dart';

class Case extends Equatable {
  final int confirmed;
  final int deaths;
  final int recovered;
  final String lastUpdate;

  Case(this.confirmed, this.deaths, this.recovered, this.lastUpdate);

  @override
  List<Object> get props => [confirmed, deaths, recovered, lastUpdate];
}
