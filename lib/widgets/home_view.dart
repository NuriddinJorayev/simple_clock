// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class Home_views {
  static var name_list = <String>[
    'Clock',
    'Alarm',
    'Timer',
    'Stopwatch',
  ];
  static Widget Dot_container(double size, Color color) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
          color: color, borderRadius: BorderRadius.circular(size / 2)),
    );
  }

  static Widget Icon_Container(Size size, int select, int img, fan()) {
    return GestureDetector(
      onTap: fan,
      child: Container(
        width: size.width,
        margin: EdgeInsets.only(bottom: 10),
        constraints: BoxConstraints(minHeight: size.height),
        decoration: BoxDecoration(
          borderRadius:
              BorderRadius.only(topRight: Radius.circular(size.width / 2.5)),
          color:
              select == 0 ? Colors.transparent : Colors.black.withOpacity(.3),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: size.width / 3,
              width: size.width / 3,
              margin: EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/clock_icon$img.png"))),
            ),
            SizedBox(height: 20),
            Container(
              margin: EdgeInsets.only(bottom: 10),
              child: Text(
                name_list[img],
                style: TextStyle(
                    color: Colors.white, fontSize: 14, fontFamily: "book_font"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
