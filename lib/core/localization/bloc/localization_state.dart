
import 'package:freezed_annotation/freezed_annotation.dart';

part 'localization_state.freezed.dart';

@freezed
class LocalizationState with _$LocalizationState {
  const factory LocalizationState.initial(String langName) = _Initial;
  const factory LocalizationState.changed(String langName) = _Changed;
  const factory LocalizationState.loading() = _Loading;
  const factory LocalizationState.error(String message) = _Error;
}
