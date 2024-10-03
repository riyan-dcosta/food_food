import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_food/features/common/app_global_state.dart';

import '../../domain/user_model.dart';
import '../../features/dashboard/state/user_state.dart';

abstract class AppUsers {
  void addUser({
    required String username,
    required String email,
  });

  Future<Map<String, dynamic>> fetchUser({
    required String email,
  });
}

class AppUsersImpl implements AppUsers {
  final WidgetRef ref;

  AppUsersImpl({required this.ref});

  @override
  void addUser({
    required String username,
    required String email,
  }) async {
    final user = <String, dynamic>{
      "username": username,
      "email": email,
    };
    final db = ref.watch(fireStoreDBProvider);
    await db.collection("users").doc(email).set(user);
  }

  @override
  Future<Map<String, dynamic>> fetchUser({
    required String email,
  }) async {
    final db = ref.watch(fireStoreDBProvider);
    final user = await db.collection("users").doc(email).get();
    final userModel = UserModel.fromJson(user.data() ?? {});
    ref
        .watch(appUserDataProvider.notifier)
        .updateUserData(userModel: userModel);
    return user.data() ?? {};
  }
}
