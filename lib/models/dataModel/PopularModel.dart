import 'package:flutter/material.dart';

class PopularModel {
  String name;
  String iconPath;
  String level;
  String duration;
  String calorie;
  bool isDisabled;

  PopularModel({
    required this.name,
    required this.iconPath,
    required this.level,
    required this.duration,
    required this.calorie,
    required this.isDisabled,
  });

  static List<PopularModel> getPopular() {
    //List<PopularDietsModel> popularDiets = [];
    return [
      PopularModel(
        name: 'Blueberry Pancake',
        iconPath: 'assets/icons/blueberry-pancake.svg',
        level: 'Medium',
        duration: '30mins',
        calorie: '230kCal',
        isDisabled: false,
      ),
      PopularModel(
        name: 'Salmon Nigiri',
        iconPath: 'assets/icons/salmon-nigiri.svg',
        level: 'Easy',
        duration: '20mins',
        calorie: '120kCal',
        isDisabled: false,
      ),
    ];
  }
}
