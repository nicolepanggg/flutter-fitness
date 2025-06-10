import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../models/DietViewModel.dart';
import '../styles/app_styles.dart'; // AppStyles

class DietSection extends StatelessWidget {
  final List<DietViewModel> diets;
  //final Function(int) onDietSelected;

  const DietSection({
    super.key,
    required this.diets,
    //required this.onDietSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: AppStyles.paddingLeft,
          child: Text(
            'Recommendation\nfor Diet',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        SizedBox(height: 15), //Space
        SizedBox(
          // like a Div
          //color: Colors.blue,
          height: 240,
          child: ListView.separated(
            itemBuilder: (context, index) {
              return Container(
                width: 210,
                decoration: BoxDecoration(
                  // ignore: deprecated_member_use
                  color: diets[index].boxColor.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment
                      .spaceEvenly, // spaceEvenly is useful when us want balanced layout with consistent spacing around and between children
                  children: [
                    SvgPicture.asset(diets[index].iconPath),
                    Column(
                      children: [
                        Text(
                          diets[index].name,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          '${diets[index].level}|${diets[index].duration}|${diets[index].calorie}',
                          style: TextStyle(
                            color: Color(0xff7B6F27),
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    diets[index].viewDisplay
                        ? Container(
                            //create a rectangular visual element that can be styled with properties like size, padding, margins, and decorations
                            height: 45,
                            width: 130,
                            decoration: BoxDecoration(
                              //Applies a linear gradient as the background of the container
                              gradient: LinearGradient(
                                colors: [
                                  /*diets[index].display
                                  ? Color(0xff9DCEFF)
                                  : Colors.transparent,
                              diets[index].display
                                  ? Color(0xff92A3FD)
                                  : Colors.transparent,*/
                                  Color(0xff9DCEFF),
                                  Color(0xff92A3FD),
                                ],
                              ),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Center(
                              child: Text(
                                'View',
                                style: TextStyle(
                                  /*color: diets[index].display
                                      ? Colors.white
                                      : Color(0xffC58BF2),*/
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          )
                        : const SizedBox.shrink(),
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) => SizedBox(width: 25),
            itemCount: diets.length,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(left: 20, right: 20),
          ),
        ),
      ],
    );
  }
}
