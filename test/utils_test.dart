<<<<<<< HEAD
=======
import 'package:flutter/foundation.dart';
>>>>>>> new-version
import 'package:flutter_test/flutter_test.dart';

enum _TestEnum { Hoge }

void main() {
  group('utils', () {
    test('EnumUtil.getValueString', () async {
<<<<<<< HEAD
      String value = _TestEnum.Hoge.name;
=======
      String value = describeEnum(_TestEnum.Hoge);
>>>>>>> new-version
      expect(value, "Hoge");
    });
  });
}
