part of 'language_bloc.dart';

@immutable
sealed class LanguageState {
  final Locale locale;
  const LanguageState(this.locale);
}

class LanguageLoadingState extends LanguageState {
 
  const LanguageLoadingState(super.locale);
}
