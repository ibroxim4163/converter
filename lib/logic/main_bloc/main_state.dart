part of 'main_bloc.dart';

@immutable
sealed class MainState {
  final List<CurrencyModel> currencies;
  final String firstCurrency;
  final String secondCurrency;
  final String rate;
  final String convertedCurrency;
  const MainState({
    required this.currencies,
    required this.firstCurrency,
    required this.secondCurrency,
    required this.rate,
    required this.convertedCurrency,
  });
}

final class LoadingState extends MainState {
  const LoadingState({
    required super.currencies,
    required super.firstCurrency,
    required super.secondCurrency,
    required super.rate,
    required super.convertedCurrency,
  });
}

final class ChangeState extends MainState {
  const ChangeState({
    required super.currencies,
    required super.firstCurrency,
    required super.secondCurrency,
    required super.rate,
    required super.convertedCurrency,
  });
}
