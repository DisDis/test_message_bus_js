@JS()
library main_point;
import 'package:js/js.dart';
import 'package:js/js_util.dart';
import 'dart:html';

import 'package:test_message_bus_js/test_message_js.dart';

external dynamic get window;

void main() {
  print('MARKER0 - create tm1Js');
  TestMessage1 tm1Js = new TestMessage1JS();
  tm1Js.fieldInt1 = 1;
  tm1Js.fieldStr1 = "123 text 456";
  tm1Js.subObjTestMessage1 = new SubObjTestMessage1JS();
  tm1Js.subObjTestMessage1.fieldInt2 = 2;
  tm1Js.subObjTestMessage1.fieldArr1Str = <String>['1', '2'];
  print('MARKER1 stringify(tm1Js)');
  print(stringify(tm1Js));
  print('MARKER2 set "dartObj1", "dartFunc1"');
  setProperty(window,'dartObj1',tm1Js);
  setProperty(window,'dartFunc1', allowInterop(_jsCallback));
  print('MARKER3');
  querySelector('#sample_text_id')
    ..text = stringify(tm1Js);

  print('MARKER4 - parse json string -> tm2Js');
  TestMessage1 tm2Js = parse('{"fieldInt1":3,"fieldStr1":"json text","subObjTestMessage1":{"fieldInt2":4,"fieldArr1Str":["1json","2json"]}}');
  print('MARKER5 - call(tm2Js)');
  _jsCallback(tm2Js);
  print('MARKER6 - end call, set "dartObj2"');
  setProperty(window,'dartObj2',tm2Js);
  print('MARKER7');
  _testObject(new DateTime.now().millisecondsSinceEpoch > 100 ? tm2Js : {});
  print('MARKER8 - empty object');
  _testObject({});
}

_jsCallback(TestMessage1 msg){
  print('[Dart] fieldStr1: ${msg.fieldStr1}');
  print('[Dart] fieldInt1: ${msg.fieldInt1}');
  if (msg.subObjTestMessage1 != null){
    print('[Dart] subObjTestMessage1.fieldInt2: ${msg.subObjTestMessage1.fieldInt2}');
    print('[Dart] subObjTestMessage1.fieldArr1Str.length: ${msg.subObjTestMessage1.fieldArr1Str.length}');
    print('[Dart] subObjTestMessage1.fieldArr1Str: ${msg.subObjTestMessage1.fieldArr1Str}');
  }
  print('[Dart] "msg" is TestMessage1: ${msg is TestMessage1}');
  Object o = msg;
  _testObject(o);
  // Uncaught RangeError: Maximum call stack size exceeded
  //print('[Dart] subObjTestMessage1: ${msg.subObjTestMessage1 != null? msg.subObjTestMessage1: null}');
}

_testObject(Object o){
  print('[Dart] ("msg" -> Object) is TestMessage1: ${o is TestMessage1}');
  if (o is TestMessage1) {
    print('[Dart] (("msg" -> Object) as TestMessage1).fieldStr1: ${(o as TestMessage1).fieldStr1}');
  }
}