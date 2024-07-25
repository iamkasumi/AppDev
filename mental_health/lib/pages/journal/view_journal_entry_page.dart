import 'package:flutter/material.dart';

class ViewJournalEntryPage extends StatelessWidget {
  final Map<String, String> entry;

  const ViewJournalEntryPage({required this.entry, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(entry["title"]!),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              entry["date"]!,
              style: TextStyle(color: Colors.grey[600]),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Color(int.parse(entry["moodColor"]!)).withOpacity(0.2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                entry["mood"]!,
                style: TextStyle(color: Color(int.parse(entry["moodColor"]!))),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              entry["description"]!,
              style: TextStyle(fontSize: 18, color: Colors.grey[800]),
            ),
          ],
        ),
      ),
    );
  }
}
