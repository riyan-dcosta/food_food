import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_global_state.g.dart';

@riverpod
class FireStoreDB extends _$FireStoreDB {
  @override
  FirebaseFirestore build() {
    final db = FirebaseFirestore.instance;
    return db;
  }
}

@riverpod
TextTheme appTextTheme(AppTextThemeRef ref, BuildContext context) {
  return Theme.of(context).textTheme;
}
