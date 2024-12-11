part of 'bloc.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = _Initial;

  const factory AuthState.pending() = _Pending;

  const factory AuthState.loaded() = _Loaded;

  const factory AuthState.failure(String failureDescription) = _Failure;

  const factory AuthState.completed() = _Completed;
}
