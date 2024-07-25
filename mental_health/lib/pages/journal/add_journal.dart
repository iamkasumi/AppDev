import 'package:flutter/material.dart';

class AddJournalEntryPage extends StatefulWidget {
  final Function(Map<String, String>) addEntry;

  const AddJournalEntryPage({super.key, required this.addEntry});

  @override
  _AddJournalEntryPageState createState() => _AddJournalEntryPageState();
}

class _AddJournalEntryPageState extends State<AddJournalEntryPage> {
  final _formKey = GlobalKey<FormState>();
  String _date = '';
  String _mood = '';
  String _emoji = '';
  String _title = '';
  String _description = '';

  void _submitEntry() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      widget.addEntry({
        'date': _date,
        'mood': _mood,
        'emoji': _emoji,
        'title': _title,
        'description': _description,
      });
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Journal Entry"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Date'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a date';
                  }
                  return null;
                },
                onSaved: (value) {
                  _date = value!;
                },
              ),
              const SizedBox(height: 16),
              Text("Mood"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  EmotionWidget(
                    emoji: '😡',
                    label: 'Angry',
                    isSelected: _emoji == '😡',
                    onTap: () {
                      setState(() {
                        _emoji = '😡';
                        _mood = 'Angry';
                      });
                    },
                  ),
                  EmotionWidget(
                    emoji: '😊',
                    label: 'Happy',
                    isSelected: _emoji == '😊',
                    onTap: () {
                      setState(() {
                        _emoji = '😊';
                        _mood = 'Happy';
                      });
                    },
                  ),
                  EmotionWidget(
                    emoji: '😢',
                    label: 'Sad',
                    isSelected: _emoji == '😢',
                    onTap: () {
                      setState(() {
                        _emoji = '😢';
                        _mood = 'Sad';
                      });
                    },
                  ),
                  EmotionWidget(
                    emoji: '😌',
                    label: 'Relaxed',
                    isSelected: _emoji == '😌',
                    onTap: () {
                      setState(() {
                        _emoji = '😌';
                        _mood = 'Relaxed';
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(labelText: 'Title'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a title';
                  }
                  return null;
                },
                onSaved: (value) {
                  _title = value!;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(labelText: 'Description'),
                maxLines: 5,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a description';
                  }
                  return null;
                },
                onSaved: (value) {
                  _description = value!;
                },
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _submitEntry,
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class EmotionWidget extends StatelessWidget {
  final String emoji;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const EmotionWidget({
    required this.emoji,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Text(
            emoji,
            style: TextStyle(fontSize: 24),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.blue : Colors.black,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}