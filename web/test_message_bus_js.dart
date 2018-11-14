@JS()
library main_point;
import 'package:js/js.dart';
import 'package:js/js_util.dart';
import 'dart:html';

import 'package:test_message_bus_js/test_message_js.dart';

external dynamic get window;

void main() {
  print('MARKER0');
  var tm1Js = new TestMessage1JS();
  tm1Js.fieldInt1 = 1;
  tm1Js.fieldStr1 = "123 text 456";
  tm1Js.subObjTestMessage1 = new SubObjTestMessage1JS();
  tm1Js.subObjTestMessage1.fieldInt2 = 2;
  tm1Js.subObjTestMessage1.fieldArr1Str = <String>['1', '2'];
  print('MARKER1');
  print(stringify(tm1Js));
  print('MARKER2');
  setProperty(window,'dartObj1',tm1Js);
  setProperty(window,'dartFunc1', allowInterop(_jsCallback));
  print('MARKER3');
  querySelector('#sample_text_id')
    ..text = stringify(tm1Js);
}

_jsCallback(TestMessage1 msg){
  print('[Dart] fieldStr1: ${msg.fieldStr1}');
  print('[Dart] fieldInt1: ${msg.fieldInt1}');
  if (msg.subObjTestMessage1 != null){
    print('[Dart] subObjTestMessage1.fieldInt2: ${msg.subObjTestMessage1.fieldInt2}');
    print('[Dart] subObjTestMessage1.fieldArr1Str.length: ${msg.subObjTestMessage1.fieldArr1Str.length}');
    print('[Dart] subObjTestMessage1.fieldArr1Str: ${msg.subObjTestMessage1.fieldArr1Str}');
  }
  // Uncaught RangeError: Maximum call stack size exceeded
  //print('[Dart] subObjTestMessage1: ${msg.subObjTestMessage1 != null? msg.subObjTestMessage1: null}');
}