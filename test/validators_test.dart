import 'package:flutter_test/flutter_test.dart';
import 'package:wawechat/core/utils/validators.dart';

void main() {
  group('Validators.isValidEmail', () {
    test('geçerli adresleri kabul eder', () {
      expect(Validators.isValidEmail('ada@wawechat.com'), isTrue);
      expect(Validators.isValidEmail('  ada.l@mail.co.uk '), isTrue);
    });

    test('geçersiz adresleri reddeder', () {
      for (final value in ['', 'ada', 'ada@', 'ada@mail', 'a da@mail.com']) {
        expect(Validators.isValidEmail(value), isFalse, reason: value);
      }
    });
  });
}
