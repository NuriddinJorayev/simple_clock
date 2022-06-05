import 'package:flutter/material.dart';

class Clock_Arrow extends CustomPainter {
  double hieght;
  Color back_color;
  double stroke_Width;
  Clock_Arrow({
    required this.hieght,
    required this.back_color,
    required this.stroke_Width,
  });

  @override
  void paint(Canvas canvas, Size size) {
    var h_center = size.height / 2;
    var w_center = size.width / 2;
    Paint sho = Paint()..color = Colors.black;
    Paint second = Paint()
      ..color = back_color
      ..style = PaintingStyle.fill
      ..strokeCap = StrokeCap.round
      ..strokeWidth = stroke_Width;
    canvas.drawLine(Offset(w_center, h_center - hieght),
        Offset(w_center, h_center), second);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
