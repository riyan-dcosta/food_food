import 'package:flutter/material.dart';

pushPage({required BuildContext context, required Widget newPage}) {
  Navigator.of(context).push(MaterialPageRoute(
    builder: (context) => newPage,
  ));
}
pushAndRemoveUntilCurrentPage({required BuildContext context, required Widget
newPage}) {
  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
    builder: (context) => newPage,
  ),(route) {
    return route.isCurrent;
  },);
}
