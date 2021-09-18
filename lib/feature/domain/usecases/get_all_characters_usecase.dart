import 'package:dartz/dartz.dart';
import 'package:clean_arch_sample/core/failures.dart';
import 'package:clean_arch_sample/core/usecase.dart';
import 'package:clean_arch_sample/feature/domain/entities/character.dart';
import 'package:clean_arch_sample/feature/domain/repository/characters_repository.dart';

class GetAllCharactersUsecase extends UseCase<NoInput, List<Character>> {
  final CharactersRepository repository;

  GetAllCharactersUsecase(this.repository);

  @override
  Future<Either<Failure, List<Character>>> call(NoInput input) {
    return repository.getAllCharacters();
  }
}
