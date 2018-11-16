@JS()
library test.object.js;

import 'package:js/js.dart';
import 'package:test_message_bus_js/src/test_message_interface.dart';
export 'package:test_message_bus_js/src/test_message_interface.dart';

@JS('JSON.stringify')
external String stringify(dynamic value);

@JS('JSON.parse')
external dynamic parse(String value);

@JS()
@anonymous
abstract class TestMessage1JS implements TestMessage1{
  external factory TestMessage1JS({
    num fieldInt1,
    String fieldStr1,
  });

  @override
  external num get fieldInt1;
  @override
  external set fieldInt1(num value);

  @override
  external String get fieldStr1;
  @override
  external set fieldStr1(String value);

  @override
  external SubObjTestMessage1 get subObjTestMessage1;
  @override
  external set subObjTestMessage1(SubObjTestMessage1 value);
}

@JS()
@anonymous
abstract class SubObjTestMessage1JS implements SubObjTestMessage1 {
  external factory SubObjTestMessage1JS({
    List<String> fieldArr1Str,
    num fieldInt2,
  });

  @override
  external List<String> get fieldArr1Str;
  @override
  external set fieldArr1Str(List<String> value);

  @override
  external num get fieldInt2;
  @override
  external set fieldInt2(num value);
}