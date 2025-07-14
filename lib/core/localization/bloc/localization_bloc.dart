import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training/core/localization/app_locale_strings.dart';
import 'package:training/core/localization/bloc/localization_state.dart';

abstract class LocaltizationEvent {}

class LocaltizationChanged extends LocaltizationEvent {
  final String langName;

  LocaltizationChanged({required this.langName});
}

class LocaltizationBloc extends Bloc<LocaltizationEvent, LocalizationState> {
  LocaltizationBloc(String langName)
      : super(LocalizationState.initial(langName)) {
    G.load(langName);
    on<LocaltizationChanged>(onLanguageChange);
  }

  FutureOr<void> onLanguageChange(
      LocaltizationChanged event, Emitter<LocalizationState> emit) {
    emit(const LocalizationState.loading());
    G.load(event.langName);
    emit(LocalizationState.changed(event.langName));
  }
}
