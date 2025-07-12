import 'dart:async';
import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training/core/localization/app_locale_strings.dart';

class LocaltizationState {
  final String langName;

  LocaltizationState({required this.langName});
}

abstract class LocaltizationEvent {}

class LocaltizationChanged extends LocaltizationEvent {
  final String langName;

  LocaltizationChanged({required this.langName});
}

class LocaltizationBloc extends Bloc<LocaltizationEvent, LocaltizationState> {
  LocaltizationBloc(super.initialState) {
    G.load(state.langName);
    on<LocaltizationChanged>(onLanguageChange);
  }

  FutureOr<void> onLanguageChange(
      LocaltizationChanged event, Emitter<LocaltizationState> emit) {
    G.load(event.langName);
    emit(LocaltizationState(langName: event.langName));
  }
}
