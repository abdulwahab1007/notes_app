// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:notes_app/components/note_tile_popover.dart';
import 'package:popover/popover.dart';

class NoteTile extends StatelessWidget{
  const NoteTile({
    super.key,
    required this.text,
    required this.onEditPressed,
    required this.onDeletePressed,
    });

  final String text;
  final void Function()? onEditPressed;
  final void Function()? onDeletePressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10.0,left: 25,right: 25),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(12.0),
      ),  
      child: ListTile(
        title: Text(text),
        trailing: Builder(
          builder: (context) {
            return IconButton(
              onPressed: (){
                showPopover(
                  context: context, 
                  height: 100,
                  width: 100,
                  backgroundColor: Theme.of(context).colorScheme.background,
                  direction: PopoverDirection.bottom,
                  bodyBuilder: (context)=>NoteTilePopover(
                    onEditTap: onEditPressed,
                    onDeleteTap: onDeletePressed ,
                  ),
                  );
              }, 
              icon: const Icon(Icons.more_vert),
              );
          }
        )
        
      ),
    );
  }
}