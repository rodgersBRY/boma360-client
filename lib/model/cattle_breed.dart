import 'package:client/model/cattle.dart';

class CattleBreed {
  final String breed;
  final BreedType type;

  CattleBreed({required this.breed, required this.type});
}

final List<CattleBreed> cowBreeds = [
  CattleBreed(breed: 'Friesian', type: BreedType.dairy),
  CattleBreed(breed: 'Ayrshire', type: BreedType.dairy),
  CattleBreed(breed: 'Jersey', type: BreedType.dairy),
  CattleBreed(breed: 'Guernsey', type: BreedType.dairy),
  CattleBreed(breed: 'Zebu', type: BreedType.dualPurpose),
  CattleBreed(breed: 'Sahiwal', type: BreedType.dualPurpose),
  CattleBreed(breed: 'Boran', type: BreedType.beef),
  CattleBreed(breed: 'Ankole', type: BreedType.beef),
  CattleBreed(breed: 'Crossbreed', type: BreedType.dualPurpose),
];
