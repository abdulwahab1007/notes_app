// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class NoteTilePopover extends StatelessWidget{
  const NoteTilePopover({
    super.key,
    required this.onEditTap,
    required this.onDeleteTap
    });

  final void Function()? onEditTap;
  final void Function()? onDeleteTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: (){
            Navigator.pop(context);
            onEditTap!();  // We also have to tell that it won't be null 
          } ,
          child: Container(
            alignment: Alignment.center,
            height: 50,
            color: Theme.of(context).colorScheme.background,
            child: Text('Edit',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.inversePrimary
            ),),
          ),
        ),
         GestureDetector(
          onTap: (){
            Navigator.pop(context);
            onDeleteTap!();  // Exclaimation mark needed
          } ,
          child: Container(
            alignment: Alignment.center,
            height: 50,
            color: Theme.of(context).colorScheme.background,
            child: Text('Delete',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),),
          ),
        )    
      ],
    );
  }
}