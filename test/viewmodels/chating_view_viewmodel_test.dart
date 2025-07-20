import 'package:flutter_test/flutter_test.dart';
import 'package:digitalcaryard/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('ChatingViewViewModel Tests -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}
