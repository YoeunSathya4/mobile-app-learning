Add Khmer font files here and they will be bundled by Flutter.

Recommended free fonts:
- Battambang (SIL): https://fonts.google.com/specimen/Battambang
- Noto Sans Khmer (Google/Noto): https://fonts.google.com/noto/specimen/Noto+Sans+Khmer

Steps:
1. Download one or both fonts and save them to `assets/fonts/` with the filenames used in `pubspec.yaml`:
   - `assets/fonts/Battambang-Regular.ttf`
   - `assets/fonts/NotoSansKhmer-Regular.ttf`
2. Run `flutter pub get`.
3. Re-run the app: `flutter run`.

Notes:
- The app's theme is set to use `Battambang` by default (change `theme: ThemeData(fontFamily: 'Battambang')` in `lib/main.dart` to the family you prefer).
- If the font file is missing, Flutter will fall back to the system fonts.