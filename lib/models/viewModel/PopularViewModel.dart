import 'package:flutter/material.dart';
import '../dataModel/PopularModel.dart';

class PopularViewModel extends PopularModel {
  bool selected;

  PopularViewModel({
    required super.name,
    required super.iconPath,
    required super.level,
    required super.duration,
    required super.calorie,
    required super.isDisabled,
    this.selected = false, // Default not selected
  });

  // Factory constructor to create DietViewModel from PopularDietModel
  factory PopularViewModel.fromPopularModel(PopularModel popularModel) {
    return PopularViewModel(
      name: popularModel.name,
      iconPath: popularModel.iconPath,
      level: popularModel.level,
      duration: popularModel.duration,
      calorie: popularModel.calorie,
      isDisabled: popularModel.isDisabled,
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
