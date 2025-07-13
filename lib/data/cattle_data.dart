import 'package:client/config/theme/colors.dart';
import 'package:client/model/cattle.dart';
import 'package:client/model/cattle_breed.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

final List<Map<String, dynamic>> kCattleOverviewData = [
  {"label": "Total", "content": "53", "color": AppColors.danger},
  {"label": "Healthy", "content": "48", "color": AppColors.secondary},
  {"label": "Attention", "content": "3", "color": AppColors.warning},
  {"label": "Pregnant", "content": "2", "color": AppColors.info},
];

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

final List<Map<String, dynamic>> kCattleKeyStats = [
  {
    "icon": FontAwesomeIcons.clock,
    "title": '485 kg',
    "subtitle": 'Current Weight',
    'subtext': '+5kg this month',
    'subtextColor': Colors.green,
    'iconColor': AppColors.primary,
  },
  {
    "icon": FontAwesomeIcons.bottleDroplet,
    "title": '28.5 L',
    "subtitle": 'Daily Milk Yield',
    'subtext': 'Above average',
    'subtextColor': Colors.green,
    'iconColor': AppColors.primary,
  },
  {
    "icon": FontAwesomeIcons.solidHeart,
    "title": 'Day 120',
    "subtitle": 'Pregnancy',
    'subtext': 'Due in 160 days',
    'subtextColor': Colors.blue,
    'iconColor': Colors.pink,
  },
  {
    "icon": FontAwesomeIcons.stethoscope,
    "title": '7 days',
    "subtitle": 'Last Check-up',
    'subtext': 'All clear',
    'subtextColor': Colors.green,
    'iconColor': AppColors.primary,
  },
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
