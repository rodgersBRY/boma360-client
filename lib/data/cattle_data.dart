import 'package:client/config/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum Status { healthy, attention, treatment, observation, pregnant }

class CattleModel {
  final String tag;
  final String name;
  final Status status;
  final String breed;
  final String age;
  final String? gender;
  final DateTime? lastCheck;
  final DateTime? dueDate;
  final String? imageUrl;
  final bool? vaccinationDue;

  const CattleModel({
    required this.tag,
    required this.name,
    required this.status,
    required this.breed,
    required this.age,
    this.gender,
    this.lastCheck,
    this.dueDate,
    this.imageUrl,
    this.vaccinationDue,
  });
}

extension StatusColorExtenstion on Status {
  Color get color {
    switch (this) {
      case Status.healthy:
        return AppColors.secondary;
      case Status.attention:
      case Status.treatment:
      case Status.observation:
        return AppColors.warning;
      case Status.pregnant:
        return AppColors.info;
    }
  }
}

final List<Map<String, dynamic>> kCattleOverviewData = [
  {"label": "Total", "content": "53", "color": AppColors.danger},
  {"label": "Healthy", "content": "48", "color": AppColors.secondary},
  {"label": "Attention", "content": "3", "color": AppColors.warning},
  {"label": "Pregnant", "content": "2", "color": AppColors.info},
];

final List<CattleModel> kCattleList = [
  CattleModel(
    tag: 'KE-001',
    name: 'Daisy',
    status: Status.healthy,
    breed: 'Friesian',
    age: '2 yrs',
    lastCheck: DateTime.now().subtract(Duration(days: 3)),
    dueDate: DateTime.now().add(Duration(days: 27)),
    imageUrl: 'https://example.com/images/daisy.jpg',
    vaccinationDue: false,
  ),
  CattleModel(
    tag: 'KE-002',
    name: 'Bella',
    status: Status.observation,
    breed: 'Jersey',
    age: '3.5 yrs',
    lastCheck: DateTime.now().subtract(Duration(days: 7)),
    dueDate: DateTime.now().add(Duration(days: 14)),
    imageUrl: 'https://example.com/images/bella.jpg',
    vaccinationDue: true,
  ),
  CattleModel(
    tag: 'KE-003',
    name: 'Simba',
    status: Status.treatment,
    breed: 'Sahiwal',
    age: '4 yrs',
    lastCheck: DateTime.now().subtract(Duration(days: 1)),
    dueDate: DateTime.now().add(Duration(days: 30)),
    imageUrl: 'https://example.com/images/simba.jpg',
    vaccinationDue: true,
  ),
  CattleModel(
    tag: 'KE-004',
    name: 'Luna',
    status: Status.healthy,
    breed: 'Ayrshire',
    age: '1.5 yrs',
    lastCheck: DateTime.now().subtract(Duration(days: 2)),
    dueDate: DateTime.now().add(Duration(days: 60)),
    imageUrl: null,
    vaccinationDue: false,
  ),
  CattleModel(
    tag: 'KE-005',
    name: 'Max',
    status: Status.pregnant,
    breed: 'Guernsey',
    age: '3 yrs',
    lastCheck: DateTime.now().subtract(Duration(days: 10)),
    dueDate: DateTime.now().add(Duration(days: 90)),
    imageUrl: 'https://example.com/images/max.jpg',
    vaccinationDue: false,
  ),
  CattleModel(
    tag: 'KE-006',
    name: 'Nala',
    status: Status.healthy,
    breed: 'Zebu',
    age: '2.2 yrs',
    lastCheck: DateTime.now().subtract(Duration(days: 5)),
    dueDate: DateTime.now().add(Duration(days: 45)),
    imageUrl: null,
    vaccinationDue: true,
  ),
  CattleModel(
    tag: 'KE-007',
    name: 'Milo',
    status: Status.attention,
    breed: 'Ankole',
    age: '5 yrs',
    lastCheck: DateTime.now().subtract(Duration(days: 20)),
    dueDate: DateTime.now().add(Duration(days: 10)),
    imageUrl: 'https://example.com/images/milo.jpg',
    vaccinationDue: true,
  ),
];

final List<String> kCattlebreeds = [];

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
