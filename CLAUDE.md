# WaweChat

Flutter Android tanışma/sohbet uygulaması. Kullanıcıyla Türkçe konuş.

## Bu aşamanın kuralları

- **Sadece arayüz.** Backend yok; tüm veriler `lib/data/mock/` altında sahte.
- **Metinleri koda gömme.** Her kullanıcıya görünen metin `lib/l10n/app_tr.arb` içine eklenir, kodda `context.l10n.xxx` ile kullanılır (`lib/l10n/l10n.dart`). `app_localizations*.dart` dosyaları `flutter pub get` ile üretilir, elle düzenleme.
- **Renk ve stiller** `lib/core/theme/` içinden gelir (`AppColors`, `AppTheme`); ekranlarda sabit renk yazma.
- Yazı tipleri `google_fonts` ile: gövde Geist, başlıklar Syne.
- `google_fonts` bilerek `^8.2.1`'de sabit: 6.x'te Geist yok, 9.0.0 ise `TextTheme`'i ayrı `material_ui` paketinden döndürüyor ve `flutter/material.dart` ile uyuşmuyor. Uygulama `material_ui`'ye geçmeden 9'a yükseltme.

## Ekran sırası

1. [x] Giriş/kayıt — `lib/features/auth/`
2. [ ] Doğum tarihi ve kurallar
3. [ ] Profil oluşturma
4. [ ] Alt menülü ana yapı (Keşfet, Mesajlar, Profil)
5. [ ] Kullanıcı listesi ve filtreler
6. [ ] Profil detay
7. [ ] Mesaj istekleri
8. [ ] Sohbet ekranı
9. [ ] Ayarlar

Bir ekran bitince bu listeyi güncelle. Giriş ekranındaki `_onAuthenticated` şimdilik sadece snackbar gösteriyor; 2. ve 4. ekranlar yapılınca oraya yönlendirilecek.

## Yapı

```
lib/app/             MaterialApp ve rotalar (routes.dart)
lib/core/theme/      renkler ve tema
lib/core/widgets/    ortak bileşenler (GradientButton, AmbientBackground, WaweLogo)
lib/core/utils/      yardımcılar
lib/data/mock/       sahte servisler ve veriler
lib/features/<özellik>/presentation/   ekranlar ve ekrana özel widget'lar
lib/l10n/            ARB dosyaları
```

## Komutlar

```bash
flutter pub get
flutter analyze
flutter test
flutter run
```

Değişiklikten sonra `flutter analyze` ve `flutter test` temiz olmalı.
