// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:notes_app/components/drawer_tile.dart';
import 'package:notes_app/pages/settigns_page.dart';

class MyDrawer extends StatelessWidget{
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
        child: Column(
          children: [
            DrawerHeader(
              child: Icon(Icons.edit,
              size: 35,)
              ),
              SizedBox(height: 10.0,),
              //DrawerTile

            DrawerTile(
              leading: Icon(Icons.home), 
              title: Text('Notes'), 
              onTap: (){
                Navigator.pop(context);
              }
              ),
              DrawerTile(
              leading: Icon(Icons.settings), 
              title: Text('Settings'), 
              onTap: (){
                Navigator.pop(context);
                Navigator.push(context,
                 MaterialPageRoute(builder: (context)=>SettignsPage())
                 );

              }
              ),


          ],
        ),
    );
  }

}