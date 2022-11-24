import 'package:equatable/equatable.dart';

class Drink extends Equatable {
  String name;
  int id;

  Drink({required this.name, required this.id});

  @override
  // TODO: implement props
  List<Object?> get props => [id];
}
