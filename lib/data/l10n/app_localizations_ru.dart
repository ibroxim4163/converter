import 'app_localizations.dart';

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get title => 'Конвертер валют';

  @override
  String get subtitle => 'Проверяйте текущие тарифы, устанавливайте оповещения о тарифах, получайте уведомления и многое другое.';

  @override
  String get amount => 'Количество';

  @override
  String get converted_amount => 'Конвертированная сумма';

  @override
  String get rate => 'Индикативный обменный курс';
}
