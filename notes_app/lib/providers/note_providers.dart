import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NoteProviders extends ChangeNotifier {
  NoteProviders() {
    LoadNote();
  }
  List<Note> _notes = [];

  void addNote(Note note) {
    _notes.add(note);
    SaveNote();
    notifyListeners();
  }

  Future<void> SaveNote() async {
    final pref = await SharedPreferences.getInstance();
    final encoded = jsonEncode(_notes.map((e) => e.toJson()).toList());
    await pref.setString('note', encoded);
  }

  Future<void> UpdateNote(String id, String title, String content) async {
    final index = _notes.indexWhere((i) => i.id == id);
    if (index != -1) {
      _notes[index].title = title;
      _notes[index].content = content;
      SaveNote();
      notifyListeners();
    }
  }

  Future<void> LoadNote() async {
    final pref = await SharedPreferences.getInstance();
    final noteString = pref.getString('note');
    if (noteString != null) {
      final List decoded = jsonDecode(noteString);
      _notes = decoded.map((e) => Note.fromJson(e)).toList();
      notifyListeners();
    }
  }

  void deleteNote(String id) {
    _notes.removeWhere((n) => n.id == id);
    SaveNote();
    notifyListeners();
  }

  String _searchQuery = '';

  List<Note> get notes {
    if (_searchQuery.isEmpty) {
      return _notes;
    }
    return _notes.where((note) {
      return note.title.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          note.content.toLowerCase().contains(_searchQuery.toLowerCase());
    }).toList();
  }

  void updateSearch(String query) {
    _searchQuery = query;
    notifyListeners();
  }
}
