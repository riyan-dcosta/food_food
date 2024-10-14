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

class TextThemeState {
  TextThemeState._();

  static final _instance = TextThemeState._();

  static BuildContext? _context;

  setContext(BuildContext name) {
    _context = name;
  }

  TextTheme get getTextTheme {
    if (_context == null) {
      throw UnimplementedError("Build Context is not initialized");
    }
    return Theme.of(_context!).textTheme;
  }

  factory TextThemeState() {
    return _instance;
  }
}
