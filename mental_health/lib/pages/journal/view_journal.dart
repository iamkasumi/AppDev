import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ViewJournalEntryPage extends StatelessWidget {
  final Map<String, String> entry;

  const ViewJournalEntryPage({super.key, required this.entry});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color(0xFF444444)), // Dark gray color
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          entry['date']!,
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            color: Color(0xFF444444), // Dark gray color
          ),
        ),
        backgroundColor: Color.fromARGB(255, 211, 203, 185), // Top Bar
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 8.0,
                spreadRadius: 1.0,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: EmotionWidget(
                  emoji: entry['emoji']!,
                  label: entry['mood']!,
                  isSelected: true,
                  onTap: () {},
                ),
              ),
              
              const SizedBox(height: 20),
              
              Text(
                entry['title']!,
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF444444), // Dark gray color
                ),
              ),
              const SizedBox(height: 16),
              Text(
                entry['description']!,
                style: GoogleFonts.montserrat(
                  fontSize: 16,
                  color: Color(0xFF666666), // Medium gray color
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Color(0xFFF2E8D5), // Light Cream
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
            style: const TextStyle(fontSize: 36),
          ),
          
          const SizedBox(height: 4),
          
          Text(
            label,
            style: GoogleFonts.montserrat(
              fontSize: 18,
              color: isSelected ? Color.fromARGB(255, 3, 135, 120) : const Color(0xFF666666), // Teal or medium gray color
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
