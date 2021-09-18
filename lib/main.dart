import 'package:flutter/material.dart';
import 'package:graphql/client.dart';
import 'package:clean_arch_sample/feature/data/datasources/characters_remote_datasoource.dart';
import 'package:clean_arch_sample/feature/data/repositories/characters_repository_impl.dart';
import 'package:clean_arch_sample/feature/domain/repository/characters_repository.dart';
import 'package:clean_arch_sample/feature/domain/usecases/get_all_characters_usecase.dart';
import 'package:clean_arch_sample/feature/domain/usecases/get_characters_by_query_usecase.dart';
import 'package:clean_arch_sample/feature/presentation/bloc/characters_cubit.dart';
import 'package:clean_arch_sample/feature/presentation/pages/characters_page.dart';

void main() {
  runApp(SampleApp());
}

class SampleApp extends StatelessWidget {
  final GraphQLClient client = GraphQLClient(
      link: HttpLink('https://rickandmortyapi.com/graphql/'),
      cache: GraphQLCache());

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      onGenerateRoute: (settings) {
        return homeDependencies();
      },
    );
  }

  Route homeDependencies() {
    final CharacterRemoteDatasource datasource =
        CharacterRemoteDatasource(client);

    final CharactersRepository repository =
        CharactersRepositoryImpl(datasource);

    final GetAllCharactersUsecase getAllCharactersUsecase =
        GetAllCharactersUsecase(repository);
    final GetCharactersByQueryUsecase getCharactersByQueryUsecase =
        GetCharactersByQueryUsecase(repository);

    final CharactersCubit cubit =
        CharactersCubit(getAllCharactersUsecase, getCharactersByQueryUsecase);

    return CharactersPage.route(cubit);
  }
}
