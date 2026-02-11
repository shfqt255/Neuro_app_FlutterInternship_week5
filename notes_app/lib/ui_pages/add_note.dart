import 'package:flutter/material.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/providers/note_providers.dart';
import 'package:provider/provider.dart';

class AddNote extends StatelessWidget {
  const AddNote({super.key});

  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    TextEditingController _titleController = TextEditingController();
    TextEditingController _descriptionController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Note'),
        backgroundColor: Colors.blueGrey,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: .center,
          children: [
            Text(
              'Add Note',
              style: TextStyle(color: Colors.blueGrey, fontSize: 25),
              textAlign: .center,
            ),
            const SizedBox(height: 20),

            buildTextField(_titleController, 'title', (value) {
              if (value == null || value.isEmpty) {
                return 'Title Required*';
              } else {
                return null;
              }
            }, 1),
            const SizedBox(height: 10),
            buildTextField(_descriptionController, 'Note Description', (value) {
              if (value == null || value.isEmpty) {
                return 'Title Required*';
              } else {
                return null;
              }
            }, 10),

            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  final newNote = Note(
                    id: DateTime.now().toString(),
                    title: _titleController.text,
                    content: _descriptionController.text,
                  );
                  Provider.of<NoteProviders>(
                    context,
                    listen: false,
                  ).addNote(newNote);
                }
                Navigator.pop(context);
              },

              child: Text('Save'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueGrey,
                foregroundColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget buildTextField(
  final TextEditingController controller,
  String label,
  final String? Function(String?)? validator,
  int maxlines,
) {
  return TextFormField(
    controller: controller,
    validator: validator,
    maxLines: maxlines,
    keyboardType: TextInputType.multiline,
    decoration: InputDecoration(
      label: Text(label),
      floatingLabelStyle: TextStyle(color: Colors.blueGrey),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black12),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black12),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black12),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black12),
      ),
    ),
    cursorColor: Colors.black12,
    cursorErrorColor: Colors.black12,
  );
}
