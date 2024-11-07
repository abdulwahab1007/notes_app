// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes_app/components/my_drawer.dart';
import 'package:notes_app/components/note_tile.dart';
import 'package:notes_app/models/note.dart';
import 'package:notes_app/models/note_database.dart';
import 'package:provider/provider.dart';
 

class NotePage extends StatefulWidget{
  const NotePage({super.key});

  @override
  State<NotePage> createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  @override
  void initState() {
    super.initState();
      // on app startup show all the notes in the database 
      readNotes();
  }

  final TextEditingController controller=TextEditingController();
  //need to write 4 methods here 
  // Create 
  void createNote(){
    controller.clear();
    showDialog(
      context: context, 
      builder: (context)=>AlertDialog(
        backgroundColor: Theme.of(context).colorScheme.background,
        content: TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: 'Write new Task..',
          ),          
        ),
        actions: [
          MaterialButton(
            onPressed: (){
                context.read<NoteDatabase>().createNote(controller.text);
                controller.clear();
                Navigator.pop(context);
                
            },
            child: Text('Create'),
            )
        ],
      )
      );
  }
  //read 
    void readNotes(){
      context.read<NoteDatabase>().fetchNotes();
    }
  //update
    void updataNote(Note note){
      //pre fill the text into the controller 
      controller.text=note.text;
      showDialog(
        context: context, 
        builder: (context)=>AlertDialog(
          backgroundColor: Theme.of(context).colorScheme.background,
          content: TextField(
            controller: controller,
          ),
          actions: [
            MaterialButton(
              onPressed: (){
                  context.read<NoteDatabase>().updateNote(controller.text, note.id);
                  Navigator.pop(context);
                  controller.clear();
              } ,
              child: Text('Update'),
              )
          ],
        )
        );
    }
  //delete 
  void deleteNote(int id){
    context.read<NoteDatabase>().deleteNote(id);

  }
  @override
  Widget build(BuildContext context) {
      // get the Access to the database 
      final NoteDatabase noteDatabase=context.watch<NoteDatabase>();
      
      List<Note> currentNotes=noteDatabase.currentNotes;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Heading
          Padding(
            padding: EdgeInsets.only(left: 25.0),
            child: Text('Notes',
            style: GoogleFonts.dmSerifText(
              fontSize: 42,
              color: Theme.of(context).colorScheme.inversePrimary)),
          ),

          //Lists
          Expanded(
            child: ListView.builder(
              itemCount:  currentNotes.length,
              itemBuilder: (context,index){
                Note note=currentNotes[index];
                return NoteTile(
                  text: note.text,
                  onEditPressed: ()=>updataNote(note),
                  onDeletePressed: ()=>deleteNote(note.id),
                  );
              }
              ),
          ),
        ],
      ),
        floatingActionButton: FloatingActionButton(
          onPressed: createNote,
          foregroundColor: Theme.of(context).colorScheme.inversePrimary,
          child: Icon(Icons.add),
          ),
          drawer: MyDrawer(),
    );
  }
}