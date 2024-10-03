import 'package:flutter/material.dart';

extension LayoutSpaceExtension on List<Widget> {
  List<Widget> spaceVertical(double gapSize) {
    return expand(
      (element) sync* {
        yield SizedBox(height: gapSize);
        yield element;
      },
    ).skip(1).toList();
  }
}
