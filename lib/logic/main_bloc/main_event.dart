part of 'main_bloc.dart';

@immutable
sealed class MainEvent {
  const MainEvent();
}

class LoadingEvent extends MainEvent {
  const LoadingEvent();
}

class UpdateFirstCurrency extends MainEvent {
  final String firstCurrecy;
  final String value;
  const UpdateFirstCurrency({
    required this.firstCurrecy,
    required this.value,
  });
}

class UpdateSecondCurrency extends MainEvent {
  final String value;
  final String secondCurrency;
  const UpdateSecondCurrency({
    required this.secondCurrency,
    required this.value,
  });
}

class UpdateInput extends MainEvent {
  final String? value;
  const UpdateInput(this.value);
}
