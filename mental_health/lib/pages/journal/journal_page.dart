import 'package:flutter/material.dart';
import 'add_journal.dart';
import 'view_journal.dart';
import 'package:google_fonts/google_fonts.dart';

class JournalPage extends StatefulWidget {
  const JournalPage({super.key});

  @override
  _JournalPageState createState() => _JournalPageState();
}

class _JournalPageState extends State<JournalPage> {
  final List<Map<String, String>> _journalEntries = [
    {
      "date": "02 May 2022",
      "mood": "Happy",
      "emoji": '😊',
      "title": "What are you grateful for?",
      "description": "I am grateful for the opportunity to help and learn from so many different people."
    },
    {
      "date": "28 April 2022",
      "mood": "Sad",
      "emoji": '😢',
      "title": "What one thing that drove your action?",
      "description": "Curiosity is often what drives my actions. It fuels the desire to explore new topics, solve problems, and understand the world better."
    },
    {
      "date": "15 March 2022",
      "mood": "Angry",
      "emoji": '😡',
      "title": "What was the best part of your day?",
      "description": "The best part of my day is finishing this project."
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
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'images/pastel_p.jpg',
              fit: BoxFit.cover,
            ),
          ),
          // Main content
          Padding(
            padding: const EdgeInsets.all(20.0), // Padding for the entire screen
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Journals",
                  style: GoogleFonts.poppins(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search, color: Colors.grey[600]),
                    hintText: "Search journal",
                    hintStyle: TextStyle(color: Colors.grey[500]),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14), // Adjust padding
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
        ],
      ),
      floatingActionButton: SizedBox(
        width: 60.0,
        height: 60.0,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddJournalEntryPage(addEntry: _addNewEntry),
              ),
            );
          },
          child: Icon(Icons.add, color: Colors.white),
          backgroundColor: Color(0xFF00796B), // Teal color for the FAB
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
        ),
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
      color: Colors.white,
      elevation: 4, // Added elevation for a modern card effect
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  date,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey[700],
                  ),
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
            const SizedBox(height: 12),
            Text(
              title,
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              description,
              style: GoogleFonts.montserrat(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.grey[700],
              ),
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
            style: TextStyle(fontSize: 28),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: GoogleFonts.montserrat(
              color: isSelected ? Color(0xFF00796B) : Colors.black54,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
