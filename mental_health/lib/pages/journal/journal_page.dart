import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'add_journal.dart';
import 'view_journal.dart';

class JournalPage extends StatefulWidget {
  const JournalPage({super.key});

  @override
  _JournalPageState createState() => _JournalPageState();
}

class _JournalPageState extends State<JournalPage> {
  final List<Map<String, String>> _journalEntries = [];

  void _addNewEntry(Map<String, String> newEntry) {
    setState(() {
      _journalEntries.add(newEntry);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Journals",
              style: GoogleFonts.playfairDisplay(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: "Search journal",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: _journalEntries.length,
                itemBuilder: (context, index) {
                  final entry = _journalEntries[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ViewJournalEntryPage(
                            entry: entry,
                          ),
                        ),
                      );
                    },
                    child: JournalEntry(
                      date: entry["date"]!,
                      mood: entry["mood"]!,
                      emoji: entry["emoji"]!,
                      title: entry["title"]!,
                      description: entry["description"]!,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddJournalEntryPage(addEntry: _addNewEntry),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class JournalEntry extends StatelessWidget {
  final String date;
  final String mood;
  final String emoji;
  final String title;
  final String description;

  const JournalEntry({
    required this.date,
    required this.mood,
    required this.emoji,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  date,
                  style: TextStyle(color: Colors.grey[600]),
                ),
                const Spacer(),
                EmotionWidget(
                  emoji: emoji,
                  label: mood,
                  isSelected: true,
                  onTap: () {},
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              description,
              style: TextStyle(color: Colors.grey[700]),
            ),
          ],
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