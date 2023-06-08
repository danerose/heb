import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:heb/app/domain/entities/pokemon/pokemon.entity.dart';

@immutable
abstract class PokemonEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class PokemonLoadList extends PokemonEvent {
  PokemonLoadList({required this.more});
  final bool more;
}

class PokemonAddToTeam extends PokemonEvent {
  PokemonAddToTeam({required this.pokemon});
  final Pokemon pokemon;
}

class PokemonDelteFromTeam extends PokemonEvent {
  PokemonDelteFromTeam({required this.pokemon});
  final Pokemon pokemon;
}
