import 'package:flutter/cupertino.dart';
import 'package:note_app/Services_folder/db_helper.dart';
import 'package:note_app/Services_folder/note_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NoteProvider with ChangeNotifier{
  List<NoteModel> _arrNotes=[];
  DBHelper database = DBHelper();

 /* late Future<List<NoteModel>> _noteModel;
  Future<List<NoteModel>> get noteModel => _noteModel;

  Future<List<NoteModel>> getNote()async{
    _noteModel = database.getNotesList();
    notifyListeners();
    return _noteModel;
  }*/
   /*List<NoteModel> _arrNotes;
   List<NoteModel> get arrNotes => _arrNotes;*/

  void fetchNotesList()async{
    _arrNotes = await database.getNotesList();
    notifyListeners();
  }

   List<NoteModel> getNote(){
    fetchNotesList();
    return _arrNotes;
  }

  void addNote(NoteModel noteModel)async{
    await database.addNote(noteModel);
    getNote();
  }

  void deleteNote(int id)async{
    await database.deleteNote(id);
    getNote();
  }

  void updateNote(NoteModel noteModel)async{
    await database.updateNote(noteModel);
    getNote();
  }


  ///____ Items count

  int _countNote = 0;
  int get countNote => _countNote;

  void _setPrefItems()async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setInt('note_count', _countNote);
    notifyListeners();
  }

  void _getPrefItems()async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    _countNote = sharedPreferences.getInt('note_count') ??0;
    notifyListeners();
  }

  void addCountItem(){
    _countNote++;
    _setPrefItems();
  }

  void removeCountItem(){
    _countNote--;
    _setPrefItems();
  }

   int getCounterItem(){
    _getPrefItems();
    return _countNote;
  }

}