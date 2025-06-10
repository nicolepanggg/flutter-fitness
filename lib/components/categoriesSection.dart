import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../models/CategoryModel.dart';
import '../styles/app_styles.dart'; // AppStyles
import '../pages/category_detail_page.dart';

Widget CategoriesSection(List<CategoryModel> categories) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: AppStyles.paddingLeft,
        child: Text(
          'Category',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      SizedBox(height: 15), //margin 15
      SizedBox(
        height: 120,
        //color: Colors.green,
        child: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: ListView.separated(
            itemCount: categories.length,
            scrollDirection: Axis.horizontal,
            //padding: EdgeInsets.only(left: 20, right: 20),
            separatorBuilder: (context, index) => SizedBox(width: 25),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          CategoryDetailPage(category: categories[index]),
                    ),
                  );
                },
                child: Container(
                  width: 100,
                  decoration: BoxDecoration(
                    // ignore: deprecated_member_use
                    color: categories[index].boxColor.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: SvgPicture.asset(categories[index].iconPath),
                      ),
                      Text(
                        categories[index].name,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              );
              /*if (index == 0) {
                      return Text('Salad');
                    } else if (index == 1) {
                      return Text('Cake');
                    }*/
            },
          ),
        ),
      ),
    ],
  );
}
