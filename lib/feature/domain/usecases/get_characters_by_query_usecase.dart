import 'package:dartz/dartz.dart';
import 'package:clean_arch_sample/core/failures.dart';
import 'package:clean_arch_sample/core/usecase.dart';
import 'package:clean_arch_sample/feature/domain/entities/character.dart';
import 'package:clean_arch_sample/feature/domain/repository/characters_repository.dart';

class GetCharactersByQueryUsecase extends UseCase<String, List<Character>> {
  final CharactersRepository repository;

  GetCharactersByQueryUsecase(this.repository);

  @override
  Future<Either<Failure, List<Character>>> call(String input) {
    return repository.getCharactersByQuery(input);
  }
}
