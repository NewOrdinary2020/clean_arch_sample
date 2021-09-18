import 'package:graphql/client.dart';
import 'package:clean_arch_sample/core/exceptions.dart';
import 'package:clean_arch_sample/feature/data/models/character_model.dart';

class CharacterRemoteDatasource {
  final GraphQLClient _client;

  CharacterRemoteDatasource(this._client);

  Future<List<CharacterModel>> getAllCharacters() async {
    try {
      final QueryOptions options = QueryOptions(
        document: gql(allCharacters),
      );

      final response = await _client.query(options);
      return response.data['characters']['results']
          .map<CharacterModel>((e) => CharacterModel.fromJson(e))
          .toList();
    } catch (e) {
      throw CustomServerException();
    }
  }

  Future<List<CharacterModel>> getCharactersByQuery(String query) async {
    try {
      final QueryOptions options = QueryOptions(
          document: gql(filteredCharacters), variables: {"nQuery": query});

      final response = await _client.query(options);
      return response.data['characters']['results']
          .map<CharacterModel>((e) => CharacterModel.fromJson(e))
          .toList();
    } catch (e) {
      throw CustomServerException();
    }
  }
}

const String allCharacters = r'''
query {
  characters  {
    results {
      name
      type
      status
      image
    }
  }
}
''';

const String filteredCharacters = r'''query GetCharacters($nQuery: String!) {
  characters (filter: {name: $nQuery}) {
    results {
      name
      type
      status
      image
    }
  }
}''';
