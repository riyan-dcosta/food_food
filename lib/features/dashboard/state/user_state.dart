import 'package:food_food/domain/user_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_state.g.dart';

@riverpod
class AppUserData extends _$AppUserData {
  @override
  UserModel? build() {
    return null;
  }

  updateUserData({required UserModel userModel}) {
    state = userModel;
  }
}
