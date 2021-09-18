import 'package:dartz/dartz.dart';
import 'package:clean_arch_sample/core/failures.dart';
import 'package:clean_arch_sample/feature/domain/entities/character.dart';

abstract class CharactersRepository {
  Future<Either<Failure, List<Character>>> getAllCharacters();
  Future<Either<Failure, List<Character>>> getCharactersByQuery(String query);
}
