// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:custom_paint/my_static_color.dart';
import 'package:custom_paint/paints/clock_arrow.dart';
import 'package:custom_paint/paints/custom_paint.dart';
import 'package:custom_paint/utils/hour_formatter.dart';
import 'package:custom_paint/utils/timer.dart';
import 'package:custom_paint/widgets/home_view.dart';
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var now_h = DateTime.now().hour;
  var now_m = DateTime.now().minute;
  var now_s = DateTime.now().second;
  var val1 = vector.radians(15 * 6); // sec
  var val2 = vector.radians(15 * 6); // min
  var val3 = vector.radians(15 * 6); // hour
  var hour = Clock_Arrow(
      hieght: 45, back_color: MyStaticColors.hour_color, stroke_Width: 9);
  var min = Clock_Arrow(
      hieght: 55, back_color: MyStaticColors.minute_color, stroke_Width: 7);
  var sec = Clock_Arrow(
      hieght: 60, back_color: MyStaticColors.second_color, stroke_Width: 5);
  var s_list = <int>[1, 0, 0, 0];

  @override
  void initState() {
    var now_h = hour_12_format(DateTime.now().hour);
    var now_m = DateTime.now().minute;
    var now_s = DateTime.now().second;
    val1 = vector.radians(now_s * 6);
    val2 = vector.radians(now_m * 6) + ((vector.radians(6) / 60) * now_s);
    val3 = vector.radians(now_h * 30) + ((vector.radians(30) / 60) * now_m);
    // print(DateTime.now().hour);
    // print(now_m);
    // print(now_s);
    super.initState();
    // hour runner
    Static_Timer.My_Timer(Duration(minutes: 1), (t) {
      setState(() {
        val3 += (vector.radians(30) / 60);
      });
    });
    // minute runner
    Static_Timer.My_Timer(Duration(seconds: 1), (t) {
      setState(() {
        val2 += (vector.radians(6) / 60);
      });
    });
    // second runner
    Static_Timer.My_Timer(
        Duration(seconds: 1),
        (t) => setState(() {
              val1 += (vector.radians(6));
            }));
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: 200,
          width: 200,
          constraints: BoxConstraints.expand(),
          color: MyStaticColors.body_color,
          child: Row(
            children: [
              Container(
                height: double.infinity,
                width: w * .22,
                color: MyStaticColors.body_color,
                child: Column(
                  children: [
                    // more icon
                    Container(
                      height: h * .10,
                      width: w * .22,
                      alignment: Alignment.center,
                      child: Container(
                        height: 25,
                        width: 25,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Positioned(
                              top: 0,
                              child: Home_views.Dot_container(6, Colors.white),
                            ),
                            Positioned(
                              bottom: 0,
                              child: Home_views.Dot_container(6, Colors.white),
                            ),
                            Positioned(
                              left: 0,
                              child: Home_views.Dot_container(6, Colors.white),
                            ),
                            Positioned(
                              right: 0,
                              child: Home_views.Dot_container(6, Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),

                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Home_views.Icon_Container(Size(w * .25, h * .10),
                              s_list[0], 0, () => selector(0)),
                          Home_views.Icon_Container(Size(w * .25, h * .10),
                              s_list[1], 1, () => selector(1)),
                          Home_views.Icon_Container(Size(w * .25, h * .10),
                              s_list[2], 2, () => selector(2)),
                          Home_views.Icon_Container(Size(w * .25, h * .10),
                              s_list[3], 3, () => selector(3)),
                        ],
                      ),
                    ),
                    SizedBox(height: h * .20)
                  ],
                ),
              ),
              Container(
                  height: double.infinity,
                  width: 1,
                  color: MyStaticColors.divider_color),
              Expanded(
                child: Stack(
                  children: [
                    Container(
                      color: MyStaticColors.body_color,
                      alignment: Alignment.center,
                      child: CustomPaint(
                        painter: Mypaint(),
                        child: Container(),
                      ),
                    ),
                    // hour
                    Transform.rotate(
                      angle: val3,
                      child: CustomPaint(
                        painter: hour,
                        child: Container(),
                      ),
                    ),
                    // minute
                    Transform.rotate(
                      angle: val2,
                      child: CustomPaint(
                        painter: min,
                        child: Container(),
                      ),
                    ),
                    // second
                    Transform.rotate(
                      angle: val1,
                      child: CustomPaint(
                        painter: sec,
                        child: Container(),
                      ),
                    ),
                    Center(
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        height: 25,
                        width: 25,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  selector(int index) {
    setState(() {
      s_list = List<int>.filled(4, 0);
      s_list[index] = 1;
    });
  }
}
