import 'package:flutter_test/flutter_test.dart';

import './counter.dart';

void main() {
  group('Counter tests', () {
    test('Counter value should be incremented', () {
      final counter = Counter();

      counter.increment();

      expect(counter.value, 1);
    });

    test('Counter value should be decremented', () {
      final counter = Counter(value: 10);

      counter.decrement();
      counter.decrement();
      counter.decrement();

      expect(counter.value, 7);
      expect(counter.value, lessThan(10));
      expect(counter.value, isNot(10));
    });
  });
}
