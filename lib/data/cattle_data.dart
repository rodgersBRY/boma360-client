import 'package:client/config/theme/colors.dart';
import 'package:client/model/cattle.dart';
import 'package:client/model/cattle_breed.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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

final List<Map<String, dynamic>> kCattleHealthStatus = [
  {
    "icon": FontAwesomeIcons.syringe,
    "title": 'Vaccination',
    "subtitle": 'FMD - Completed',
    'trailing': '2 weeks ago',
    'color': Colors.green,
  },
  {
    "icon": FontAwesomeIcons.pills,
    "title": 'Deworming',
    "subtitle": 'Ivermectin',
    'trailing': '1 month ago',
    'color': AppColors.info,
  },
  {
    "icon": FontAwesomeIcons.solidCalendarCheck,
    "title": 'Next Check-up',
    "subtitle": 'Routine examination',
    'trailing': 'In 3 weeks',
    'color': AppColors.warning,
  },
];
