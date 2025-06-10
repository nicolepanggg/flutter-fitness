import 'package:flutter/material.dart';
import 'DietModel.dart';

class DietViewModel extends DietModel {
  bool selected;

  DietViewModel({
    required String name,
    required String iconPath,
    required String level,
    required String duration,
    required String calorie,
    required Color boxColor,
    required bool viewDisplay,
    this.selected = false, // Default not selected
  }) : super(
         name: name,
         iconPath: iconPath,
         level: level,
         duration: duration,
         calorie: calorie,
         boxColor: boxColor,
         viewDisplay: viewDisplay,
       );

  // Factory constructor to create DietViewModel from DietModel
  factory DietViewModel.fromDietModel(DietModel dietModel) {
    return DietViewModel(
      name: dietModel.name,
      iconPath: dietModel.iconPath,
      level: dietModel.level,
      duration: dietModel.duration,
      calorie: dietModel.calorie,
      boxColor: dietModel.boxColor,
      viewDisplay: dietModel.viewDisplay,
      selected: false, // Default not selected
    );
  }
}
