@JS()
library test.object.js;

import 'package:js/js.dart';
import 'package:test_message_bus_js/src/test_message_interface.dart';
export 'package:test_message_bus_js/src/test_message_interface.dart';

@JS('JSON.stringify')
external String stringify(dynamic value);

@JS()
@anonymous
class TestMessage1JS implements TestMessage1{
  num fieldInt1;
  String fieldStr1;
  SubObjTestMessage1 subObjTestMessage1;
}

@JS()
@anonymous
class SubObjTestMessage1JS implements SubObjTestMessage1 {
  @override
  List<String> fieldArr1Str;

  @override
  num fieldInt2;
}