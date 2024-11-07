// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
 import 'package:notes_app/themes/theme_provider.dart';
import 'package:provider/provider.dart';

class SettignsPage extends StatelessWidget{
  const SettignsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 25.0),
        margin: EdgeInsets.all(25.0),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(12.0)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Dark Mode',
            style: TextStyle(
              color: Theme.of(context).colorScheme.inversePrimary,
              
            ),),
            CupertinoSwitch(
              value: Provider.of<ThemeProvider>(context,listen: false).isDarkMode, 
              onChanged: (value)=>Provider.of<ThemeProvider>(context,listen: false).toggleTheme()
              )
          ],
        ),
      ),
    );
  }
}