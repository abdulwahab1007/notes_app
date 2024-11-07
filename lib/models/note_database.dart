import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:notes_app/models/note.dart';
import 'package:path_provider/path_provider.dart';

class NoteDatabase extends ChangeNotifier{
  // Now in this database class I m going to write my CRUD operations , 
  //firstly we have to Initialize the database 
  static late Isar isar;

  // I N I T I A L I Z E - D A T A B A S E
  static Future<void> initialize() async{
    //First of all get the directory where the local database will be defined 
    final dir=await getApplicationDocumentsDirectory();
    //now open the ISAr database 
    isar=await Isar.open(
      [NoteSchema], 
      directory: dir.path
      
      );
  }

    List<Note> currentNotes=[];
  // C R E A T E --> and save to db 

  Future<void> createNote(String textFromUser) async{
    Note newNote=Note()..text=textFromUser;
    await isar.writeTxn(()=>isar.notes.put(newNote));

    // re read the notes now 
    fetchNotes();
  }

  // R E A D --> notes 
  Future<void> fetchNotes()async {
     List<Note> fetchNotes= await isar.notes.where().findAll(); //it will get me all the updated notes 
     currentNotes=fetchNotes;
     notifyListeners();  //whenever the database will be updated , we will update the UI as well 
  }

  // U P D A T E -->notes

  Future<void> updateNote(String newText,int id)async{
    //for updating a note I 'd have to fetch that note First 

    final existingNote=await isar.notes.get(id);

    if(existingNote!=null){
      existingNote.text=newText;
      //save to the db 
      await isar.writeTxn(()=>isar.notes.put(existingNote));
      await fetchNotes();
    }
  }

  // D E L E T E ---> notes 

  Future<void> deleteNote(int id) async{
    await isar.writeTxn(()=>isar.notes.delete(id));
    await fetchNotes();
  }




}