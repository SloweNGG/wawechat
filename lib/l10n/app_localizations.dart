import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_tr.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[Locale('tr')];

  /// No description provided for @appName.
  ///
  /// In tr, this message translates to:
  /// **'WaweChat'**
  String get appName;

  /// No description provided for @authTagline.
  ///
  /// In tr, this message translates to:
  /// **'Yeni insanlarla tanış, sohbete başla.'**
  String get authTagline;

  /// No description provided for @authSignInTab.
  ///
  /// In tr, this message translates to:
  /// **'Giriş Yap'**
  String get authSignInTab;

  /// No description provided for @authSignUpTab.
  ///
  /// In tr, this message translates to:
  /// **'Kayıt Ol'**
  String get authSignUpTab;

  /// No description provided for @authEmailLabel.
  ///
  /// In tr, this message translates to:
  /// **'E-posta'**
  String get authEmailLabel;

  /// No description provided for @authPasswordLabel.
  ///
  /// In tr, this message translates to:
  /// **'Şifre'**
  String get authPasswordLabel;

  /// No description provided for @authPasswordConfirmLabel.
  ///
  /// In tr, this message translates to:
  /// **'Şifre (tekrar)'**
  String get authPasswordConfirmLabel;

  /// No description provided for @authShowPassword.
  ///
  /// In tr, this message translates to:
  /// **'Şifreyi göster'**
  String get authShowPassword;

  /// No description provided for @authHidePassword.
  ///
  /// In tr, this message translates to:
  /// **'Şifreyi gizle'**
  String get authHidePassword;

  /// No description provided for @authForgotPassword.
  ///
  /// In tr, this message translates to:
  /// **'Şifremi unuttum'**
  String get authForgotPassword;

  /// No description provided for @authForgotPasswordSent.
  ///
  /// In tr, this message translates to:
  /// **'Şifre sıfırlama bağlantısı e-postana gönderildi.'**
  String get authForgotPasswordSent;

  /// No description provided for @authSignInButton.
  ///
  /// In tr, this message translates to:
  /// **'Giriş Yap'**
  String get authSignInButton;

  /// No description provided for @authSignUpButton.
  ///
  /// In tr, this message translates to:
  /// **'Hesap Oluştur'**
  String get authSignUpButton;

  /// No description provided for @authOrDivider.
  ///
  /// In tr, this message translates to:
  /// **'veya'**
  String get authOrDivider;

  /// No description provided for @authContinueWithGoogle.
  ///
  /// In tr, this message translates to:
  /// **'Google ile devam et'**
  String get authContinueWithGoogle;

  /// No description provided for @authContinueWithApple.
  ///
  /// In tr, this message translates to:
  /// **'Apple ile devam et'**
  String get authContinueWithApple;

  /// No description provided for @authTermsNotice.
  ///
  /// In tr, this message translates to:
  /// **'Devam ederek Kullanım Koşulları\'nı ve Gizlilik Politikası\'nı kabul etmiş olursun.'**
  String get authTermsNotice;

  /// No description provided for @authWelcomeBack.
  ///
  /// In tr, this message translates to:
  /// **'Tekrar hoş geldin!'**
  String get authWelcomeBack;

  /// No description provided for @authAccountCreated.
  ///
  /// In tr, this message translates to:
  /// **'Hesabın oluşturuldu!'**
  String get authAccountCreated;

  /// No description provided for @validationEmailRequired.
  ///
  /// In tr, this message translates to:
  /// **'E-posta adresini gir.'**
  String get validationEmailRequired;

  /// No description provided for @validationEmailInvalid.
  ///
  /// In tr, this message translates to:
  /// **'Geçerli bir e-posta adresi gir.'**
  String get validationEmailInvalid;

  /// No description provided for @validationPasswordRequired.
  ///
  /// In tr, this message translates to:
  /// **'Şifreni gir.'**
  String get validationPasswordRequired;

  /// No description provided for @validationPasswordTooShort.
  ///
  /// In tr, this message translates to:
  /// **'Şifre en az {min} karakter olmalı.'**
  String validationPasswordTooShort(int min);

  /// No description provided for @validationPasswordMismatch.
  ///
  /// In tr, this message translates to:
  /// **'Şifreler eşleşmiyor.'**
  String get validationPasswordMismatch;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['tr'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'tr':
      return AppLocalizationsTr();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
