part of 'language_bloc.dart';

@immutable
sealed class LanguageEvent {
  const LanguageEvent();
}

class ChangeLanguageEvent extends LanguageEvent {
  final Locale locale;
  const ChangeLanguageEvent(this.locale);
}
