import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

AppBar appBar(BuildContext context, {bool showBackButton = true}) {
  return AppBar(
    title: Text(
      'Breakfast',
      style: TextStyle(
        color: Colors.black,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    ),
    backgroundColor: Colors.white,
    elevation: 0.0,
    centerTitle: true,
    leading: showBackButton && Navigator.canPop(context)
        ? GestureDetector(
            onTap: () {
              Navigator.pop(context); // Return to previous page
            },
            child: Container(
              // width: 30,
              // height: 30,
              margin: EdgeInsets.all(10),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Color(0xffF7F8F8),
                borderRadius: BorderRadius.circular(10),
              ),
              child: SvgPicture.asset(
                'assets/icons/Arrow - Left 2.svg',
                height: 20,
                width: 20,
              ),
            ),
          )
        : null, // If you don't want to display the back button, set it to null

    actions: [
      GestureDetector(
        onTap: () {},
        child: Container(
          // width: 30,
          // height: 30,
          margin: EdgeInsets.all(10),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 255, 255, 255),
            borderRadius: BorderRadius.circular(10),
          ),
          child: SvgPicture.asset('assets/icons/dots.svg', height: 5, width: 5),
        ),
      ),
    ],
  );
}
