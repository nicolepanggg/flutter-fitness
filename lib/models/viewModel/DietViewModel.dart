import 'package:flutter/material.dart';
import '../dataModel/DietModel.dart';

class DietViewModel extends DietModel {
  bool selected;

  DietViewModel({
    required String name,
    required String iconPath,
    required String level,
    required String duration,
    required String calorie,
    required Color boxColor,
    required bool isDisabled,
    this.selected = false, // Default not selected
  }) : super(
         name: name,
         iconPath: iconPath,
         level: level,
         duration: duration,
         calorie: calorie,
         boxColor: boxColor,
         isDisabled: isDisabled,
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
      isDisabled: dietModel.isDisabled,
      selected: false, // Default not selected
    );
  }

  bool isVisible() {
    if (isDisabled) {
      return false;
    }
    return true;
  }
}
