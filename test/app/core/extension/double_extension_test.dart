import 'package:diletta_test/app/app.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('DoubleExtension', () {
    test('should format double as currency with two decimal places', () {
      const value = 1234.56;
      expect(value.toCurrency, 'R\$ 1234,56');
    });

    test('should handle values with no decimal places', () {
      const value = 1000.0;
      expect(value.toCurrency, 'R\$ 1000,00');
    });

    test('should format small values correctly', () {
      const value = 0.5;
      expect(value.toCurrency, 'R\$ 0,50');
    });

    test('should format values with more than two decimal places correctly',
        () {
      const value = 1234.5678;
      expect(value.toCurrency, 'R\$ 1234,57');
    });

    test('should handle zero correctly', () {
      const value = 0.0;
      expect(value.toCurrency, 'R\$ 0,00');
    });
  });
}
