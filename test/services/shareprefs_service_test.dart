import 'package:flutter_test/flutter_test.dart';
import 'package:digitalcaryard/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('ShareprefsServiceTest -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}
