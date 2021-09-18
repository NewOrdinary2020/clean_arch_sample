import 'package:clean_arch_sample/feature/domain/entities/character.dart';

class CharacterModel extends Character {
  CharacterModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    type = json['type'];
    status = json['status'];
    image = json['image'];
  }
}
