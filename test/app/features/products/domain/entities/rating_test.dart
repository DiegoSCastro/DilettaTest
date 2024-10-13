import 'package:diletta_test/app/app.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Rating Entity', () {
    test('props should contain rate and count', () {
      const rating = Rating(rate: 4.5, count: 100);

      expect(rating.props, [4.5, 100]);
    });

    test('should support value equality', () {
      const rating1 = Rating(rate: 4.5, count: 100);
      const rating2 = Rating(rate: 4.5, count: 100);

      expect(rating1, rating2);
    });

    test('should have different hashcodes for different values', () {
      const rating1 = Rating(rate: 4.5, count: 100);
      const rating2 = Rating(rate: 3.0, count: 50);

      expect(rating1.hashCode != rating2.hashCode, true);
    });
  });
}
