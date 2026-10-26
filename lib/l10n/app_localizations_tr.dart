// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Turkish (`tr`).
class AppLocalizationsTr extends AppLocalizations {
  AppLocalizationsTr([String locale = 'tr']) : super(locale);

  @override
  String get appName => 'WaweChat';

  @override
  String get authTagline => 'Yeni insanlarla tanış, sohbete başla.';

  @override
  String get authSignInTab => 'Giriş Yap';

  @override
  String get authSignUpTab => 'Kayıt Ol';

  @override
  String get authEmailLabel => 'E-posta';

  @override
  String get authPasswordLabel => 'Şifre';

  @override
  String get authPasswordConfirmLabel => 'Şifre (tekrar)';

  @override
  String get authShowPassword => 'Şifreyi göster';

  @override
  String get authHidePassword => 'Şifreyi gizle';

  @override
  String get authForgotPassword => 'Şifremi unuttum';

  @override
  String get authForgotPasswordSent =>
      'Şifre sıfırlama bağlantısı e-postana gönderildi.';

  @override
  String get authSignInButton => 'Giriş Yap';

  @override
  String get authSignUpButton => 'Hesap Oluştur';

  @override
  String get authOrDivider => 'veya';

  @override
  String get authContinueWithGoogle => 'Google ile devam et';

  @override
  String get authContinueWithApple => 'Apple ile devam et';

  @override
  String get authTermsNotice =>
      'Devam ederek Kullanım Koşulları\'nı ve Gizlilik Politikası\'nı kabul etmiş olursun.';

  @override
  String get authWelcomeBack => 'Tekrar hoş geldin!';

  @override
  String get authAccountCreated => 'Hesabın oluşturuldu!';

  @override
  String get validationEmailRequired => 'E-posta adresini gir.';

  @override
  String get validationEmailInvalid => 'Geçerli bir e-posta adresi gir.';

  @override
  String get validationPasswordRequired => 'Şifreni gir.';

  @override
  String validationPasswordTooShort(int min) {
    return 'Şifre en az $min karakter olmalı.';
  }

  @override
  String get validationPasswordMismatch => 'Şifreler eşleşmiyor.';
}
