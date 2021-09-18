import 'package:equatable/equatable.dart';
import 'package:clean_arch_sample/feature/domain/entities/character.dart';

abstract class CharactersState extends Equatable {
  @override
  List<Object> get props => [];
}

class CharactersLoading extends CharactersState {}

class CharactersSuccess extends CharactersState {
  final List<Character> characters;

  CharactersSuccess(this.characters);
}

class CharactersError extends CharactersState {
  final String message;

  CharactersError(this.message);
}
