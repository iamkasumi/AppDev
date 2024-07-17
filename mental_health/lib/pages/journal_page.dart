import 'package:flutter/material.dart';

class JournalPage extends StatelessWidget {
  const JournalPage({super.key});

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
              child: ListView(
                children: const [
                  JournalEntry(
                    date: "02 May 2022",
                    mood: "Awesome",
                    moodColor: Colors.red,
                    title: "What are you grateful for?",
                    description:
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus id lobortis dui facilisi.",
                  ),
                  JournalEntry(
                    date: "28 April 2022",
                    mood: "Happy",
                    moodColor: Colors.yellow,
                    title: "What one thing that drove your action?",
                    description:
                        "Commodo pellentesque vivamus faucibus natoque enim elementum.",
                  ),
                  JournalEntry(
                    date: "15 March 2022",
                    mood: "Terrible",
                    moodColor: Colors.blue,
                    title: "What was the best part of your day?",
                    description:
                        "Elementum diam amet commodo, mollis congue sed in. Vitae et mi pretium leo.",
                  ),
                ],
              ),
            ),
          ],
        ),
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