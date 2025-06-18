import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomNavModel {
  final String label;
  final IconData icon;

  const BottomNavModel({required this.label, required this.icon});
}

final List<BottomNavModel> kNavItems = [
  BottomNavModel(label: 'Home', icon: FontAwesomeIcons.house),
  BottomNavModel(label: 'Cattle', icon: FontAwesomeIcons.cow),
  BottomNavModel(label: 'Analytics', icon: FontAwesomeIcons.chartBar),
  BottomNavModel(label: 'Profile', icon: FontAwesomeIcons.person),

];
