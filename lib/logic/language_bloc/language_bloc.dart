import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'language_event.dart';
part 'language_state.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  LanguageBloc() : super(const LanguageLoadingState(Locale("uz"))) {
    on<ChangeLanguageEvent>((event, emit) {
      emit(LanguageLoadingState(event.locale));
    });
  }
}
