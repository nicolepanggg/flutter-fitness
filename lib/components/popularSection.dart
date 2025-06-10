import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../models/PopularModel.dart';
import '../styles/app_styles.dart'; // AppStyles

Widget PopularSection(List<PopularDietsModel> popularDiets) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: AppStyles.paddingLeft, //const EdgeInsets.only(left: 20),
        child: Text(
          'Popular',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      SizedBox(height: 15),
      ListView.separated(
        itemCount: popularDiets.length,
        shrinkWrap: true,
        separatorBuilder: (context, index) => SizedBox(height: 25),
        padding: EdgeInsets.only(left: 20, right: 20),
        itemBuilder: (context, index) {
          return Container(
            //color: Colors.blue,
            height: 100,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: popularDiets[index].boxIsSelected
                  ? [
                      BoxShadow(
                        color: const Color(
                          0xff1D1617,
                          // ignore: deprecated_member_use
                        ).withOpacity(0.07),
                        offset: const Offset(0, 10),
                        blurRadius: 40,
                        spreadRadius: 0,
                      ),
                    ]
                  : [],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SvgPicture.asset(
                  popularDiets[index].iconPath,
                  width: 65,
                  height: 65,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      popularDiets[index].name,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      '${popularDiets[index].level} | ${popularDiets[index].duration} | ${popularDiets[index].calorie}',
                      style: const TextStyle(
                        color: Color(0xff7B6F72),
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {},
                  child: SvgPicture.asset(
                    'assets/icons/button.svg',
                    width: 30,
                    height: 30,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    ],
  );
}
