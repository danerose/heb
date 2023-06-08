import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:heb/app/domain/entities/pokemon/pokemon.entity.dart';

@immutable
abstract class PokemonEvent extends Equatable {
  const PokemonEvent();
}

class PokemonLoadList extends PokemonEvent {
  @override
  List<Object?> get props => [];
}

class PokemonAddToTeam extends PokemonEvent {
  const PokemonAddToTeam({required this.pokemon});
  final Pokemon pokemon;
  @override
  List<Object?> get props => [pokemon];
}

class PokemonDelteFromTeam extends PokemonEvent {
  const PokemonDelteFromTeam({required this.pokemon});
  final Pokemon pokemon;
  @override
  List<Object?> get props => [pokemon];
}
