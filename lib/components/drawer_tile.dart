// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class DrawerTile extends StatelessWidget{
  const DrawerTile({
    super.key,
    required this.leading,
    required this.title,
    required this.onTap
    });

  final Widget? leading;
  final Widget? title;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: ListTile(
        leading: leading,
        title: title,
        onTap: onTap,
        textColor: Theme.of(context).colorScheme.inversePrimary,
      ),
    );
  }

}