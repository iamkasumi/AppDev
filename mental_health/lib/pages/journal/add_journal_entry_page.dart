import 'package:flutter/material.dart';

class AddJournalEntryPage extends StatefulWidget {
  final Function(Map<String, String>) addEntry;

  const AddJournalEntryPage({required this.addEntry, super.key});

  @override
  _AddJournalEntryPageState createState() => _AddJournalEntryPageState();
}

class _AddJournalEntryPageState extends State<AddJournalEntryPage> {
  final _formKey = GlobalKey<FormState>();
  final _dateController = TextEditingController();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  String _selectedMood = "Happy";
  Color _selectedMoodColor = Colors.yellow;

  void _saveEntry() {
    if (_formKey.currentState!.validate()) {
      final newEntry = {
        "date": _dateController.text,
        "mood": _selectedMood,
        "moodColor": _selectedMoodColor.value.toRadixString(16),
        "title": _titleController.text,
        "description": _descriptionController.text,
      };
      widget.addEntry(newEntry);
      Navigator.pop(context);
    }
  }

  @override
  void dispose() {
    _dateController.dispose();
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Journal Entry"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _dateController,
                decoration: InputDecoration(labelText: "Date"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter a date";
                  }
                  return null;
                },
              ),
              DropdownButtonFormField<String>(
                value: _selectedMood,
                items: ["Happy", "Sad", "Angry", "Terrible"].map((mood) {
                  return DropdownMenuItem(
                    value: mood,
                    child: Text(mood),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedMood = value!;
                    _selectedMoodColor = value == "Happy"
                        ? Colors.yellow
                        : value == "Sad"
                            ? Colors.blue
                            : value == "Angry"
                                ? Colors.red
                                : Colors.grey;
                  });
                },
                decoration: InputDecoration(labelText: "Mood"),
              ),
              TextFormField(
                controller: _titleController,
                decoration: InputDecoration(labelText: "Title"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter a title";
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(labelText: "Description"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter a description";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _saveEntry,
                child: const Text("Save Entry"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
