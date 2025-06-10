import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Searchfieldsection extends StatelessWidget {
  const Searchfieldsection({super.key});

  @override
  Widget build(Object context) {
    return Container(
      margin: EdgeInsets.only(top: 40, left: 20, right: 20),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            // ignore: deprecated_member_use
            color: Color(0xff1D1617).withOpacity(0.11),
            blurRadius: 40,
            spreadRadius: 0.0,
          ),
        ],
      ),
      child: TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.all(15),
          hintText: 'Search Pancake',
          hintStyle: TextStyle(color: Color(0xffDDDADA), fontSize: 14),
          prefixIcon: Padding(
            //Icon
            padding: const EdgeInsets.all(12),
            child: SvgPicture.asset('assets/icons/Search.svg'),
          ),
          suffixIcon: SizedBox(
            //Icon
            width: 100,
            child: IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  /*VerticalDivider(
                        color: const Color.fromARGB(255, 17, 6, 6),
                        indent: 10,
                        endIndent: 10,
                        thickness: 0.1,
                      ),*/
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset('assets/icons/Filter.svg'),
                  ),
                ],
              ),
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
