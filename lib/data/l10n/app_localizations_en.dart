import 'app_localizations.dart';

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get title => 'Currency Converter';

  @override
  String get subtitle => 'Check live rates, set rate alerts, receive notifications and more.';

  @override
  String get amount => 'Amount';

  @override
  String get converted_amount => 'Converted Amount';

  @override
  String get rate => 'Indicative Exchange Rate';
}
