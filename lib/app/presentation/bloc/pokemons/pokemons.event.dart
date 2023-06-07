import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class PokemonEvent extends Equatable {
  const PokemonEvent();
}

class PokemonLoadList extends PokemonEvent {
  @override
  List<Object?> get props => [];
}
