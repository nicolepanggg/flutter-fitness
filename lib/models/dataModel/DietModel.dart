import 'package:flutter/material.dart';

class DietModel {
  String name;
  String iconPath;
  String level;
  String duration;
  String calorie;
  Color boxColor;
  bool isDisabled;

  DietModel({
    required this.name,
    required this.iconPath,
    required this.level,
    required this.duration,
    required this.calorie,
    required this.boxColor,
    required this.isDisabled,
  });

  static List<DietModel> getDiets() {
    //List<DietModel> diets = [];
    //diets.add(
    return [
      DietModel(
        name: 'Honey Pancake',
        iconPath: 'assets/icons/honey-pancakes.svg',
        level: 'Easy',
        duration: '30mins',
        calorie: '180kCal',
        isDisabled: false,
        boxColor: Color(0xff9DCEFF),
      ),
      //);
      //diets.add(
      DietModel(
        name: 'Canai Bread',
        iconPath: 'assets/icons/canai-bread.svg',
        level: 'Easy',
        duration: '20mins',
        calorie: '230kCal',
        isDisabled: true,
        boxColor: Color(0xffEEA4CE),
      ),
      DietModel(
        name: 'Apple Pie',
        iconPath: 'assets/icons/honey-pancakes.svg',
        level: 'Easy',
        duration: '50mins',
        calorie: '300kCal',
        isDisabled: true,
        boxColor: Color(0xFFF3E6E8),
      ),
      DietModel(
        name: 'Orange Citrus Snack',
        iconPath: 'assets/icons/canai-bread.svg',
        level: 'Easy',
        duration: '10mins',
        calorie: '80kCal',
        isDisabled: true,
        boxColor: Color(0xFFFFF3C7),
      ),
    ];
    //);
    //return diets;
  }
}
