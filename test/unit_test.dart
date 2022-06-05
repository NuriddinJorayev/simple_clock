import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("start testing one", () async {
    String ss = "one";
    String reversed_str = Str_format.reversed_str(ss);
    var l = [1, 2, 3];
    var ll = [1, 2, 3];

    expect(reversed_str, 'eno');
    expect(listEquals(l, ll), isTrue);
  });
}

class Str_format {
  static String reversed_str(String s) {
    print(s);
    print(s.split('').reversed.join(''));
    return s.split('').reversed.join('');
  }
}
