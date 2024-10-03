import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_state.g.dart';

@riverpod
class UserCredentialsState extends _$UserCredentialsState {
  @override
  UserCredential? build() {
    return null;
  }
  createUser({required UserCredential user}){
    state = user;
  }
}
