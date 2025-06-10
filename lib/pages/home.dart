//reference flutter_css: https://drawcall.github.io/c2f/
import 'package:flutter/material.dart';
import 'package:fitness/components/search_field.dart';
import 'package:fitness/components/CategoriesSection.dart';
import 'package:fitness/components/DietSection.dart';
import 'package:fitness/components/PopularSection.dart';
import 'package:fitness/components/App_bar.dart';

import 'package:fitness/models/CategoryModel.dart';
import 'package:fitness/models/DietModel.dart';
import 'package:fitness/models/DietViewModel.dart'; //Update at 2025.06.10
import 'package:fitness/models/PopularModel.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class AppStyles {
  static const paddingLeft = EdgeInsets.only(left: 20);
}

class _HomePageState extends State<HomePage> {
  List<CategoryModel> categories = [];
  List<DietViewModel> diets = [];
  List<PopularDietsModel> popularDiets = [];

  void _getInitialInfo() {
    categories = CategoryModel.getCategories();
    //diets = DietModel.getDiets();
    diets = DietModel.getDiets()
        .map((diet) => DietViewModel.fromDietModel(diet))
        .toList();
    popularDiets = PopularDietsModel.getPopularDiets();
  }

  void _onDietSelected(int index) {
    //Update at 2025.06.10
    setState(() {
      diets[index].toggleSelected();
    });
  }

  @override //Update at 2025.06.10
  void initState() {
    super.initState();
    _getInitialInfo();
  }

  @override
  Widget build(BuildContext context) {
    _getInitialInfo();
    return Scaffold(
      appBar: appBar(context, showBackButton: false),
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          searchField(),
          SizedBox(height: 40),
          CategoriesSection(categories),
          SizedBox(height: 40),
          //dietSection(diets),
          DietSection(diets: diets, onDietSelected: _onDietSelected),
          SizedBox(height: 40),
          PopularSection(popularDiets),
          SizedBox(height: 40),
        ],
      ),
    );
    //return Container();
  }

  // Column _popularSection() {
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       Padding(
  //         padding: AppStyles.paddingLeft, //const EdgeInsets.only(left: 20),
  //         child: Text(
  //           'Popular',
  //           style: TextStyle(
  //             color: Colors.black,
  //             fontSize: 18,
  //             fontWeight: FontWeight.w600,
  //           ),
  //         ),
  //       ),
  //       SizedBox(height: 15),
  //       ListView.separated(
  //         itemCount: popularDiets.length,
  //         shrinkWrap: true,
  //         separatorBuilder: (context, index) => SizedBox(height: 25),
  //         padding: EdgeInsets.only(left: 20, right: 20),
  //         itemBuilder: (context, index) {
  //           return Container(
  //             //color: Colors.blue,
  //             height: 100,
  //             decoration: BoxDecoration(
  //               color: Colors.white,
  //               borderRadius: BorderRadius.circular(16),
  //               boxShadow: popularDiets[index].boxIsSelected
  //                   ? [
  //                       BoxShadow(
  //                         color: const Color(
  //                           0xff1D1617,
  //                           // ignore: deprecated_member_use
  //                         ).withOpacity(0.07),
  //                         offset: const Offset(0, 10),
  //                         blurRadius: 40,
  //                         spreadRadius: 0,
  //                       ),
  //                     ]
  //                   : [],
  //             ),
  //             child: Row(
  //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //               children: [
  //                 SvgPicture.asset(
  //                   popularDiets[index].iconPath,
  //                   width: 65,
  //                   height: 65,
  //                 ),
  //                 Column(
  //                   mainAxisAlignment: MainAxisAlignment.center,
  //                   crossAxisAlignment: CrossAxisAlignment.start,
  //                   children: [
  //                     Text(
  //                       popularDiets[index].name,
  //                       style: const TextStyle(
  //                         fontWeight: FontWeight.w500,
  //                         color: Colors.black,
  //                         fontSize: 16,
  //                       ),
  //                     ),
  //                     Text(
  //                       popularDiets[index].level +
  //                           ' | ' +
  //                           popularDiets[index].duration +
  //                           ' | ' +
  //                           popularDiets[index].calorie,
  //                       style: const TextStyle(
  //                         color: Color(0xff7B6F72),
  //                         fontSize: 13,
  //                         fontWeight: FontWeight.w400,
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //                 GestureDetector(
  //                   onTap: () {},
  //                   child: SvgPicture.asset(
  //                     'assets/icons/button.svg',
  //                     width: 30,
  //                     height: 30,
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           );
  //         },
  //       ),
  //     ],
  //   );
  // }

  // Column _dietSection() {
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       Padding(
  //         padding: AppStyles.paddingLeft,
  //         child: Text(
  //           'Recommendation\nfor Diet',
  //           style: TextStyle(
  //             color: Colors.black,
  //             fontSize: 18,
  //             fontWeight: FontWeight.w600,
  //           ),
  //         ),
  //       ),
  //       SizedBox(height: 15), //Space
  //       SizedBox(
  //         // like a Div
  //         //color: Colors.blue,
  //         height: 240,
  //         child: ListView.separated(
  //           itemBuilder: (context, index) {
  //             return Container(
  //               width: 210,
  //               decoration: BoxDecoration(
  //                 // ignore: deprecated_member_use
  //                 color: diets[index].boxColor.withOpacity(0.3),
  //                 borderRadius: BorderRadius.circular(20),
  //               ),
  //               child: Column(
  //                 mainAxisAlignment: MainAxisAlignment
  //                     .spaceEvenly, // spaceEvenly is useful when us want balanced layout with consistent spacing around and between children
  //                 children: [
  //                   SvgPicture.asset(diets[index].iconPath),
  //                   Column(
  //                     children: [
  //                       Text(
  //                         diets[index].name,
  //                         style: TextStyle(
  //                           fontWeight: FontWeight.w500,
  //                           color: Colors.black,
  //                           fontSize: 16,
  //                         ),
  //                       ),
  //                       Text(
  //                         '${diets[index].level}|${diets[index].duration}|${diets[index].calorie}',
  //                         style: TextStyle(
  //                           color: Color(0xff7B6F27),
  //                           fontSize: 13,
  //                           fontWeight: FontWeight.w400,
  //                         ),
  //                       ),
  //                     ],
  //                   ),
  //                   Container(
  //                     //create a rectangular visual element that can be styled with properties like size, padding, margins, and decorations
  //                     height: 45,
  //                     width: 130,
  //                     decoration: BoxDecoration(
  //                       //Applies a linear gradient as the background of the container
  //                       gradient: LinearGradient(
  //                         colors: [
  //                           diets[index].viewIsSelected
  //                               ? Color(0xff9DCEFF)
  //                               : Colors.transparent,
  //                           diets[index].viewIsSelected
  //                               ? Color(0xff92A3FD)
  //                               : Colors.transparent,
  //                         ],
  //                       ),
  //                       borderRadius: BorderRadius.circular(50),
  //                     ),
  //                     child: Center(
  //                       child: Text(
  //                         'View',
  //                         style: TextStyle(
  //                           color: diets[index].viewIsSelected
  //                               ? Colors.white
  //                               : Color(0xffC58BF2),
  //                           fontWeight: FontWeight.w600,
  //                           fontSize: 14,
  //                         ),
  //                       ),
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //             );
  //           },
  //           separatorBuilder: (context, index) => SizedBox(width: 25),
  //           itemCount: diets.length,
  //           scrollDirection: Axis.horizontal,
  //           padding: const EdgeInsets.only(left: 20, right: 20),
  //         ),
  //       ),
  //     ],
  //   );
  // }
  // //21.46

  // Column _categoriesSection() {
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       Padding(
  //         padding: AppStyles.paddingLeft,
  //         child: Text(
  //           'Category',
  //           style: TextStyle(
  //             color: Colors.black,
  //             fontSize: 18,
  //             fontWeight: FontWeight.w600,
  //           ),
  //         ),
  //       ),
  //       SizedBox(height: 15), //margin 15
  //       SizedBox(
  //         height: 120,
  //         //color: Colors.green,
  //         child: Padding(
  //           padding: const EdgeInsets.only(left: 20),
  //           child: ListView.separated(
  //             itemCount: categories.length,
  //             scrollDirection: Axis.horizontal,
  //             //padding: EdgeInsets.only(left: 20, right: 20),
  //             separatorBuilder: (context, index) => SizedBox(width: 25),
  //             itemBuilder: (context, index) {
  //               return Container(
  //                 width: 100,
  //                 decoration: BoxDecoration(
  //                   // ignore: deprecated_member_use
  //                   color: categories[index].boxColor.withOpacity(0.3),
  //                   borderRadius: BorderRadius.circular(16),
  //                 ),
  //                 child: Column(
  //                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //                   children: [
  //                     Container(
  //                       width: 50,
  //                       height: 50,
  //                       decoration: BoxDecoration(
  //                         color: Colors.white,
  //                         shape: BoxShape.circle,
  //                       ),
  //                       child: SvgPicture.asset(categories[index].iconPath),
  //                     ),
  //                     Text(
  //                       categories[index].name,
  //                       style: TextStyle(
  //                         fontWeight: FontWeight.w400,
  //                         color: Colors.black,
  //                         fontSize: 14,
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //               );
  //               /*if (index == 0) {
  //                     return Text('Salad');
  //                   } else if (index == 1) {
  //                     return Text('Cake');
  //                   }*/
  //             },
  //           ),
  //         ),
  //       ),
  //     ],
  //   );
  // }

  // Container _searchField() {
  //   return Container(
  //     margin: EdgeInsets.only(top: 40, left: 20, right: 20),
  //     decoration: BoxDecoration(
  //       boxShadow: [
  //         BoxShadow(
  //           // ignore: deprecated_member_use
  //           color: Color(0xff1D1617).withOpacity(0.11),
  //           blurRadius: 40,
  //           spreadRadius: 0.0,
  //         ),
  //       ],
  //     ),
  //     child: TextField(
  //       decoration: InputDecoration(
  //         filled: true,
  //         fillColor: Colors.white,
  //         contentPadding: EdgeInsets.all(15),
  //         hintText: 'Search Pancake',
  //         hintStyle: TextStyle(color: Color(0xffDDDADA), fontSize: 14),
  //         prefixIcon: Padding(
  //           //Icon
  //           padding: const EdgeInsets.all(12),
  //           child: SvgPicture.asset('assets/icons/Search.svg'),
  //         ),
  //         suffixIcon: SizedBox(
  //           //Icon
  //           width: 100,
  //           child: IntrinsicHeight(
  //             child: Row(
  //               mainAxisAlignment: MainAxisAlignment.end,
  //               children: [
  //                 /*VerticalDivider(
  //                       color: const Color.fromARGB(255, 17, 6, 6),
  //                       indent: 10,
  //                       endIndent: 10,
  //                       thickness: 0.1,
  //                     ),*/
  //                 Padding(
  //                   padding: const EdgeInsets.all(8.0),
  //                   child: SvgPicture.asset('assets/icons/Filter.svg'),
  //                 ),
  //               ],
  //             ),
  //           ),
  //         ),
  //         border: OutlineInputBorder(
  //           borderRadius: BorderRadius.circular(15),
  //           borderSide: BorderSide.none,
  //         ),
  //       ),
  //     ),
  //   );
  // }

  // AppBar appBar() {
  //   return AppBar(
  //     title: Text(
  //       'Breakfast',
  //       style: TextStyle(
  //         color: Colors.black,
  //         fontSize: 18,
  //         fontWeight: FontWeight.bold,
  //       ),
  //     ),
  //     backgroundColor: Colors.white,
  //     elevation: 0.0,
  //     centerTitle: true,
  //     leading: Container(
  //       // width: 30,
  //       // height: 30,
  //       margin: EdgeInsets.all(10),
  //       alignment: Alignment.center,
  //       decoration: BoxDecoration(
  //         color: Color(0xffF7F8F8),
  //         borderRadius: BorderRadius.circular(10),
  //       ),
  //       child: SvgPicture.asset(
  //         'assets/icons/Arrow - Left 2.svg',
  //         height: 20,
  //         width: 20,
  //       ),
  //     ),
  //     actions: [
  //       GestureDetector(
  //         onTap: () {},
  //         child: Container(
  //           // width: 30,
  //           // height: 30,
  //           margin: EdgeInsets.all(10),
  //           alignment: Alignment.center,
  //           decoration: BoxDecoration(
  //             color: Color.fromARGB(255, 255, 255, 255),
  //             borderRadius: BorderRadius.circular(10),
  //           ),
  //           child: SvgPicture.asset(
  //             'assets/icons/dots.svg',
  //             height: 5,
  //             width: 5,
  //           ),
  //         ),
  //       ),
  //     ],
  //   );
  //}
}
