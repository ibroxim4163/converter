import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/city_model.dart';
import '../../data/repository/currency_repository.dart';

part 'main_event.dart';
part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  final RepositoryImp repository;
  MainBloc(this.repository)
      : super(const LoadingState(
          currencies: [],
          firstCurrency: "",
          secondCurrency: "",
          rate: "",
          convertedCurrency: "",
        )) {
    on<MainEvent>((event, emit) => switch (event) {
          LoadingEvent e => _loading(e, emit),
          UpdateFirstCurrency e => _updateFirstCurrency(e, emit),
          UpdateSecondCurrency e => _updateSecondCurrency(e, emit),
          UpdateInput e => _updateInput(e, emit),
        });
  }

  void _updateFirstCurrency(
    UpdateFirstCurrency e,
    Emitter<MainState> emit,
  ) {
    final number = num.tryParse(e.value) ?? 0;

    String rate = (findCurrency(e.firstCurrecy, state.currencies).rate /
            findCurrency(state.secondCurrency, state.currencies).rate)
        .toStringAsFixed(2);

    String convertedCurrency =
        ((findCurrency(e.firstCurrecy, state.currencies).rate * number) /
                findCurrency(state.secondCurrency, state.currencies).rate)
            .toString();
    emit(
      ChangeState(
        currencies: state.currencies,
        firstCurrency: e.firstCurrecy,
        secondCurrency: state.secondCurrency,
        rate: rate,
        convertedCurrency: convertedCurrency,
      ),
    );
  }

  Future<void> _loading(
    LoadingEvent e,
    Emitter<MainState> emit,
  ) async {
    emit(
      LoadingState(
        currencies: state.currencies,
        firstCurrency: state.firstCurrency,
        secondCurrency: state.secondCurrency,
        rate: state.rate,
        convertedCurrency: state.convertedCurrency,
      ),
    );
    List<CurrencyModel> currencies = await repository.getAllCurrencies();
    String rate =
        (currencies.first.rate / currencies[1].rate).toStringAsFixed(2);
    emit(
      ChangeState(
        currencies: currencies,
        firstCurrency: currencies.first.ccy,
        secondCurrency: currencies[1].ccy,
        rate: rate,
        convertedCurrency: state.convertedCurrency,
      ),
    );
  }

  void _updateSecondCurrency(UpdateSecondCurrency e, Emitter<MainState> emit) {
    final number = num.tryParse(e.value) ?? 0;
    String rate = (findCurrency(state.firstCurrency, state.currencies).rate /
            findCurrency(e.secondCurrency, state.currencies).rate)
        .toStringAsFixed(2);

    String convertedCurrency =
        ((findCurrency(state.firstCurrency, state.currencies).rate * number) /
                findCurrency(e.secondCurrency, state.currencies).rate)
            .toString();
    emit(
      ChangeState(
        currencies: state.currencies,
        firstCurrency: state.firstCurrency,
        secondCurrency: e.secondCurrency,
        rate: rate,
        convertedCurrency: convertedCurrency,
      ),
    );
  }

  void _updateInput(UpdateInput e, Emitter<MainState> emit) {
    final number = num.tryParse(e.value!) ?? 0;

    String convertedCurrency =
        ((findCurrency(state.firstCurrency, state.currencies).rate * number) /
                findCurrency(state.secondCurrency, state.currencies).rate)
            .toString();

    emit(
      ChangeState(
        currencies: state.currencies,
        firstCurrency: state.firstCurrency,
        secondCurrency: state.secondCurrency,
        rate: state.rate,
        convertedCurrency: convertedCurrency,
      ),
    );
  }
}

CurrencyModel findCurrency(String currency, List<CurrencyModel> currencies) =>
    currencies
        .where(
          (element) => element.ccy.toString().trim() == currency,
        )
        .toList()
        .first;
