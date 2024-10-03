import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_food/data/authentication/auth_states.dart';
import 'package:food_food/features/authentication/state/auth_state.dart';

abstract class AppAuth {
  Future<AuthStates> signUp(
      {required String emailAddress, required String password});

  Future<AuthStates> signIn({required String emailAddress, required String password});

  void signOut();
}

class FirebaseAuthImpl extends AppAuth {
  final WidgetRef ref;

  FirebaseAuthImpl({required this.ref});

  void createUser({required UserCredential credential}) {
    ref
        .watch(userCredentialsStateProvider.notifier)
        .createUser(user: credential);
  }

  @override
  void signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Future<AuthStates> signIn({required String emailAddress, required String password}) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailAddress, password: password);
      createUser(credential: credential);
      return AuthStates.success();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
      return AuthStates.failure(message: e.code);
    }
  }

  @override
  Future<AuthStates> signUp(
      {required String emailAddress, required String password}) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      createUser(credential: credential);
      return AuthStates.success();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
      return AuthStates.failure(message: e.code);
    } catch (e) {
      print(e);
      return AuthStates.failure(message: e.toString());
    }
  }
}
