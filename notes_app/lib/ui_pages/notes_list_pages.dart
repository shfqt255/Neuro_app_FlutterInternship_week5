import 'package:flutter/material.dart';
import 'package:notes_app/providers/note_providers.dart';
import 'package:notes_app/ui_pages/add_note.dart';
import 'package:provider/provider.dart';

class NoteListPage extends StatelessWidget {
    const NoteListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<NoteProviders>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title:    Text('Notes List'),
        backgroundColor: Colors.blueGrey,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueGrey,
        child:    Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>    AddNote()),
          );
        },
      ),

      body: Column(
        children: [
          Padding(
            padding:    EdgeInsets.all(10),
            child: TextField(
              onChanged: (value) {
                provider.updateSearch(value);
              },
              decoration: InputDecoration(
                hintText: 'Search notes...',
                prefixIcon:    Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),

          Expanded(
            child: Consumer<NoteProviders>(
              builder: (context, provider, child) {
                final notes = provider.notes;

                if (notes.isEmpty) {
                  return    Center(
                    child: Text(
                      'No Notes Found',
                      style: TextStyle(fontSize: 18),
                    ),
                  );
                }

                return ListView.builder(
                  itemCount: notes.length,
                  itemBuilder: (context, index) {
                    final note = notes[index];

                    return Dismissible(
                      key: Key(note.id),
                      direction: DismissDirection.endToStart,
                      background: Container(
                        color: Colors.red,
                        alignment: Alignment.centerRight,
                        padding:    EdgeInsets.only(right: 20),
                        child:    Icon(Icons.delete, color: Colors.white),
                      ),
                      onDismissed: (_) {
                        provider.deleteNote(note.id);
                      },
                      child: Card(
                        margin:    EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        child: ListTile(
                          title: Text(
                            note.title,
                            style:    TextStyle(
                                fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            note.content,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
