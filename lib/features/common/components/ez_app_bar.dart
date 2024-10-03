import 'package:flutter/material.dart';

class EzAppBar extends StatelessWidget implements PreferredSizeWidget {
  const EzAppBar(
      {super.key,
      this.automaticallyImplyLeading = true,
      required this.title,
      this.actions = const []});

  final bool automaticallyImplyLeading;
  final String title;
  final List<Widget> actions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: automaticallyImplyLeading,
      title: Text(title),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
