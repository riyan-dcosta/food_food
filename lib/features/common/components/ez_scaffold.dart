import 'package:flutter/material.dart';

class EzScaffold extends StatelessWidget {
  const EzScaffold(
      {super.key, this.appBar, required this.body, this.bottomNavigationBar});

  final PreferredSizeWidget? appBar;
  final Widget body;
  final Widget? bottomNavigationBar;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: appBar,
        body: body,
        bottomNavigationBar: bottomNavigationBar,
      ),
    );
  }
}
