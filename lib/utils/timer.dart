import 'dart:async';

class Static_Timer {
  static My_Timer(Duration d, Function(Timer t) func) {
    Timer.periodic(d, func);
  }
}
