import 'dart:math';

import 'package:custom_paint/my_static_color.dart';
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

class Mypaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    print(size);
    var h_center = size.height / 2;
    var w_center = size.width / 2;
    var h = size.height;
    var w = size.width;

    Paint p = Paint()
      ..color = MyStaticColors.clock_back
      ..strokeWidth = 2;
    Paint outLine = Paint()
      ..color = MyStaticColors.out_line
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10;

    Paint line = Paint()
      ..color = MyStaticColors.outline_round_color
      ..style = PaintingStyle.fill
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 2;

    canvas.drawCircle(Offset(w_center, h_center), (w * .80 - 50) * .40, p);
    canvas.drawCircle(
        Offset(w_center, h_center), (w * .80 - 50) * .40, outLine);

    canvas.save();
    canvas.restore();
    var angle = vector.radians(6);
    var temp = 0;
    for (var i = 1; i <= 60; i++) {
      var r = sqrt(pow(h_center, 2) + pow(w_center, 2));
      var alpha = atan(h / w);
      var beta = alpha + angle;
      var shiftY = r * sin(beta);
      var shiftX = r * cos(beta);
      var translateX = w / 2 - shiftX;
      var translateY = h / 2 - shiftY;
      canvas.translate(translateX, translateY);
      canvas.rotate(angle);
      if (temp + 5 == i) {
        temp += 5;
        canvas.drawLine(Offset(w_center, h_center - 100),
            Offset(w_center, h_center - 120), line);
      } else {
        canvas.drawLine(Offset(w_center, h_center - 100),
            Offset(w_center, h_center - 110), line);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
