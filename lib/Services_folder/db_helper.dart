import 'dart:async';
import 'dart:io' as io;
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'note_model.dart';

class DBHelper{

  static Database? _database;
  Future<Database?> get database async{
    if(_database != null){
      return _database!;
    }
   else{
      _database = await initDatabase();
      return _database;
    }
  }

  initDatabase()async{
    io.Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, 'notes.database');
    var database = await openDatabase(path, version: 1, onCreate: _onCreate);
    return database;
  }

  _onCreate(Database database, int version)async{
    await database.execute('CREATE TABLE notes (id INTEGER PRIMARY KEY, title TEXT, subtitle TEXT, time TEXT, date TEXT)');
  }

  Future<NoteModel> addNote(NoteModel noteModel)async{
    var dbClient = await database;
    await dbClient!.insert('notes', noteModel.toMap());
    print(noteModel.toMap());
    return noteModel;
  }

  Future<List<NoteModel>> getNotesList()async{
    var dbClient = await database;
    final List<Map<String, Object?>> queryResult = await dbClient!.query('notes');
    return queryResult.map((e) => NoteModel.fromMap(e)).toList();
  }

  Future<int> deleteNote(int id)async{
    var dbClient = await database;
    return await dbClient!.delete('notes', where: 'id = ?', whereArgs: [id]);
  }

  Future<int> updateNote(NoteModel noteModel)async{
    var dbClient = await database;
    return await dbClient!.update('notes', noteModel.toMap(), where: 'id = ?', whereArgs: [noteModel.id]);
  }
}