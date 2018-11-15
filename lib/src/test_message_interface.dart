abstract class TestMessage1{
  num fieldInt1;
  String fieldStr1;
  SubObjTestMessage1 subObjTestMessage1;
}

abstract class SubObjTestMessage1{
  num fieldInt2;
  List<String> fieldArr1Str;
}

abstract class TestMessage1Fake{
  num fieldInt1;
  String fieldStr1;
  num fieldInt2;
  String fieldStr3;
}