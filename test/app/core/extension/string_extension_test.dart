import 'package:diletta_test/app/app.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('StringExtension', () {
    test('should remove diacritical marks from string', () {
      const value =
          'ÀÁÂÃÄÅàáâãäåÒÓÔÕÕÖØòóôõöøÈÉÊËèéêëðÇçÐÌÍÎÏìíîïÙÚÛÜùúûüÑñŠšŸÿýŽž';
      final expected =
          'AAAAAAaaaaaaOOOOOOOooooooEEEEeeeeeCcDIIIIiiiiUUUUuuuuNnSsYyyZz';

      expect(value.withoutDiacriticalMarks, expected);
    });

    test('should return the same string if no diacritical marks are present',
        () {
      const value = 'Hello World!';
      expect(value.withoutDiacriticalMarks, value);
    });

    test('should convert diacritical string to lowercase without diacritics',
        () {
      const value = 'ÀÁÂãäÅÈéêÇç';
      final expected = 'aaaaaaeeecc';

      expect(value.withoutDiacriticalLowerCase, expected);
    });

    test('should handle empty string', () {
      const value = '';
      expect(value.withoutDiacriticalMarks, value);
      expect(value.withoutDiacriticalLowerCase, value);
    });

    test('should handle string with special characters and numbers', () {
      const value = '12345!@#àéîç';
      final expected = '12345!@#aeic';

      expect(value.withoutDiacriticalMarks, expected);
    });
  });
}
