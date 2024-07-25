import 'package:flutter/material.dart';
import 'add_journal_entry_page.dart';
import 'view_journal_entry_page.dart';

class JournalPage extends StatefulWidget {
  const JournalPage({super.key});

  @override
  _JournalPageState createState() => _JournalPageState();
}

class _JournalPageState extends State<JournalPage> {
  final List<Map<String, String>> _journalEntries = [
    {
      "date": "02 May 2022",
      "mood": "Awesome",
      "moodColor": "0xFFFF0000",
      "title": "Story of Jonathan",
      "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus id lobortis dui facilisi."
    },
    {
      "date": "28 April 2022",
      "mood": "Happy",
      "moodColor": "0xFFFFFF00",
      "title": "Story of Nathan",
      "description": "Commodo pellentesque vivamus faucibus natoque enim elementum."
    },
    {
      "date": "15 March 2022",
      "mood": "Terrible",
      "moodColor": "0xFF0000FF",
      "title": "Story of Solomon",
      "description": "Elementum diam amet commodo, mollis congue sed in. Vitae et mi pretium leo."
    },
  ];

  void _addNewEntry(Map<String, String> newEntry) {
    setState(() {
      _journalEntries.add(newEntry);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("All Journal"),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Search bar
            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: "Search Journal",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
            const SizedBox(height: 16),
            // List of journal entries
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
                      moodColor: Color(int.parse(entry["moodColor"]!)),
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
              builder: (context) => AddJournalEntryPage(
                addEntry: _addNewEntry,
              ),
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
  final Color moodColor;
  final String title;
  final String description;

  const JournalEntry({
    required this.date,
    required this.mood,
    required this.moodColor,
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
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: moodColor.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    mood,
                    style: TextStyle(color: moodColor),
                  ),
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