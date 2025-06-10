import 'package:flutter/material.dart';

class CategoryModel {
  String name;
  String iconPath;
  Color boxColor;
  final String? description; // Add an optional description field

  CategoryModel({
    required this.name,
    required this.iconPath,
    required this.boxColor,
    this.description,
  });

  static List<CategoryModel> getCategories() {
    List<CategoryModel> categories = [];

    categories.add(
      CategoryModel(
        name: 'Salad',
        iconPath: 'assets/icons/plate.svg',
        boxColor: Color(0xff92A3FD),
        description: 'Fresh and healthy salads for a balanced diet.',
      ),
    );

    categories.add(
      CategoryModel(
        name: 'Cake',
        iconPath: 'assets/icons/pancakes.svg',
        boxColor: Color(0xffC58BF2),
        description: 'Delicious cakes for special occasions.',
      ),
    );

    categories.add(
      CategoryModel(
        name: 'Pie',
        iconPath: 'assets/icons/pie.svg',
        boxColor: Color(0xff92A3FD),
        description: 'Delicious Pie for special occasions.',
      ),
    );

    categories.add(
      CategoryModel(
        name: 'Smoothis',
        iconPath: 'assets/icons/orange-snacks.svg',
        boxColor: Color(0xffC58BF2),
        description: 'Fresh and healthy Smoothis for a balanced diet.',
      ),
    );

    return categories;
  }
}
