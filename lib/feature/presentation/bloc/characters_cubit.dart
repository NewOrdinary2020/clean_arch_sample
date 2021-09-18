import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clean_arch_sample/core/usecase.dart';
import 'package:clean_arch_sample/feature/domain/usecases/get_all_characters_usecase.dart';
import 'package:clean_arch_sample/feature/domain/usecases/get_characters_by_query_usecase.dart';
import 'package:clean_arch_sample/feature/presentation/bloc/characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  final GetAllCharactersUsecase _getAllCharactersUsecase;
  final GetCharactersByQueryUsecase _getCharactersByQueryUsecase;

  CharactersCubit(
      this._getAllCharactersUsecase, this._getCharactersByQueryUsecase)
      : super(CharactersLoading());

  void getAllCharacters() async {
    emit(CharactersLoading());
    final result = await _getAllCharactersUsecase(NoInput());
    result.fold((l) {
      emit(CharactersError('Something went wrong'));
    }, (r) {
      emit(CharactersSuccess(r));
    });
  }

  void getCharactersByQuery(String query) async {
    emit(CharactersLoading());
    final result = await _getCharactersByQueryUsecase(query);
    result.fold((l) {
      emit(CharactersError('Something went wrong'));
    }, (r) {
      emit(CharactersSuccess(r));
    });
  }
}
