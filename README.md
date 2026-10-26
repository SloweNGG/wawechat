# WaweChat

Flutter Android arayüzü. Şimdilik backend yok; tüm veriler `lib/data/mock/` altında sahte.

## Çalıştırma

```bash
flutter pub get   # lib/l10n/app_localizations.dart dosyasını da üretir
flutter run
```

Flutter SDK: `~/development/flutter`. Android Studio'da Flutter eklentisi kurulu olmalı.

## Yapı

```
lib/
  app/             MaterialApp ve rotalar
  core/theme/      renkler ve tema (AppColors, AppTheme)
  core/widgets/    ortak bileşenler
  core/utils/      yardımcılar
  data/mock/       sahte servisler ve veriler
  features/<özellik>/presentation/   ekranlar
  l10n/            metinler (app_tr.arb); yeni dil için app_<kod>.arb ekle
```
