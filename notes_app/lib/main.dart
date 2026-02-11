import 'package:flutter/material.dart';
import 'package:notes_app/providers/note_providers.dart';
import 'package:notes_app/ui_pages/notes_list_pages.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(create: (context)=> NoteProviders(), child: MainApp(),)
    );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: NoteListPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
