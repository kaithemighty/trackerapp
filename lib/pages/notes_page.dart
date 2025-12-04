// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tracker/models/note.dart';
import 'package:provider/provider.dart';
import 'package:tracker/models/note_database.dart';
import 'package:tracker/components/drawer.dart';
import 'package:tracker/components/note_tile.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({super.key});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {

  //text controller to access what user types in create note field
  final textController = TextEditingController();

  @override
  void initState() {
    super.initState();

//when app starts, read existing notes!!
    readNotes();
  }

  //create a note 
  void createNote() {
    textController.clear();
    showDialog(
      context: context, 
      builder: (context) => AlertDialog(
        backgroundColor: Theme.of(context).colorScheme.surface,
        content: TextField(
          controller: textController,
        ),
        actions: [
          //create button
          MaterialButton(
            onPressed: () {
              //add to DB 
              context.read<NoteDatabase>().addNote(textController.text);

              //clear controller
              textController.clear();

              //pop dialogue box
              Navigator.pop(context);
            },
            child: const Text("create"),
          ),
        ],
      ),
    );
  }

  //read a note
  void readNotes() {
    context.read<NoteDatabase>().fetchNotes();
  }

  //update a note 
  void updateNote(Note note) {
    //pre-fill current note text
    textController.text = note.text;
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Update Note"),
        content: TextField(controller: textController),
        actions: [
          //update button
          MaterialButton(
            onPressed: () {
              //update note in DB
              context
                  .read<NoteDatabase>()
                  .updateNote(note.id, textController.text);
              //clear controller
              textController.clear();
              //pop dialogue box
              Navigator.pop(context);
            },
            child: const Text("Update"),
          )
        ],
      ),
    );
  }

  //delete a note 
  void deleteNote(int id) {
    context.read<NoteDatabase>().deleteNote(id);
  }

  @override
  Widget build(BuildContext context) {

    //note DB
    final noteDatabase = context.watch<NoteDatabase>();
    //create list of notes
    List<Note> currentNotes = noteDatabase.currentNotes;

    return Scaffold(
      appBar: AppBar(
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      floatingActionButton: FloatingActionButton(
        onPressed: createNote,
        backgroundColor: Theme.of(context).colorScheme.primary,
        child: Icon(
          Icons.add,
          color: Theme.of(context).colorScheme.inversePrimary,
        ),
      ),
      drawer: const MyDrawer(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //HEADER
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Text(
              'NOTES', 
              style: GoogleFonts.dmSerifText(
                fontSize: 36,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
              
            ),
          ),

          //LIST OF NOTES

          Expanded(
            child: ListView.builder(
              itemCount: currentNotes.length,
              itemBuilder: (context, index) {
                //get individual note
                final note = currentNotes[index];
                //list tile UI
                return NoteTile(
                  text: note.text,
                  onEditPressed: () => updateNote(note),
                  onDeletePressed: () => deleteNote(note.id),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}