import 'dart:ui';

class AppSupportedLocals {
  static const appSupportedLocals = [
    Locale('en'),
    Locale('el'),
    Locale.fromSubtags(
        languageCode: 'zh',
        scriptCode: 'Hans'), // Generic Simplified Chinese 'zh_Hans'
    Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hant'),
  ];
}
