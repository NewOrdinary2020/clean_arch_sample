import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clean_arch_sample/feature/presentation/bloc/characters_cubit.dart';
import 'package:clean_arch_sample/feature/presentation/bloc/characters_state.dart';

class CharactersPage extends StatelessWidget {
  static route(CharactersCubit cubit) {
    cubit.getAllCharacters();

    return MaterialPageRoute(builder: (_) {
      return BlocProvider(
        create: (_) => cubit,
        child: CharactersPage(),
      );
    });
  }

  final GlobalKey<FormState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rick and morty'),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(8),
                  child: Form(
                      key: _key,
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Type your query',
                        ),
                        onSaved: (value) {
                          context
                              .read<CharactersCubit>()
                              .getCharactersByQuery(value);
                        },
                      )),
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 10),
                child: InkWell(
                    onTap: () {
                      _key.currentState.save();
                    },
                    child: Icon(Icons.search)),
              )
            ],
          ),
          Expanded(
            child: BlocBuilder<CharactersCubit, CharactersState>(
              builder: (context, state) {
                if (state is CharactersSuccess) {
                  return ListView.builder(
                      itemCount: state.characters.length,
                      itemBuilder: (_, index) {
                        final item = state.characters[index];
                        return Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: ListTile(
                                leading: ClipRRect(
                                    borderRadius: BorderRadius.circular(100),
                                    child: Image.network(item.image)),
                                title: Text(
                                  item.name,
                                  style: TextStyle(fontSize: 24),
                                ),
                                subtitle: Text(
                                  item.status,
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Divider(
                                height: 10,
                              ),
                            )
                          ],
                        );
                      });
                } else if (state is CharactersError) {
                  return Center(
                    child: Text(state.message),
                  );
                }

                return Center(child: CircularProgressIndicator());
              },
            ),
          ),
        ],
      ),
    );
  }
}
