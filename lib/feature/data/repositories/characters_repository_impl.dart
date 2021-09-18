import 'package:graphql/client.dart';
import 'package:clean_arch_sample/feature/data/datasources/characters_remote_datasoource.dart';
import 'package:clean_arch_sample/feature/domain/entities/character.dart';
import 'package:clean_arch_sample/core/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:clean_arch_sample/feature/domain/repository/characters_repository.dart';

class CharactersRepositoryImpl extends CharactersRepository {
  final CharacterRemoteDatasource datasource;

  CharactersRepositoryImpl(this.datasource);

  @override
  Future<Either<Failure, List<Character>>> getAllCharacters() async {
    try {
      final result = await datasource.getAllCharacters();

      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<Character>>> getCharactersByQuery(
      String query) async {
    try {
      final result = await datasource.getCharactersByQuery(query);
      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
