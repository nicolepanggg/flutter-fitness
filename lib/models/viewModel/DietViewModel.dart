import 'package:flutter/material.dart';
import '../dataModel/DietModel.dart';

class DietViewModel extends DietModel {
  bool selected;

  DietViewModel({
    required super.name,
    required super.iconPath,
    required super.level,
    required super.duration,
    required super.calorie,
    required super.boxColor,
    required super.isDisabled,
    this.selected = false, // Default not selected
  });

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
