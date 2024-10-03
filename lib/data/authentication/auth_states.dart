import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_states.freezed.dart';

@freezed
class AuthStates with _$AuthStates {
  const AuthStates._();

  const factory AuthStates.success() = Success;

  const factory AuthStates.failure({required String message}) = Failure;
}
