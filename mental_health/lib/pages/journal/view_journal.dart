import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ViewJournalEntryPage extends StatelessWidget {
  final Map<String, String> entry;

  const ViewJournalEntryPage({super.key, required this.entry});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFE1F5FE), // Light blue color
        title: Text(
          'Journal',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            color: const Color(0xFF444444), // Dark grey color
          ),
        ),
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF444444)),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  Text(
                    entry['title']!,
                    style: GoogleFonts.poppins(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF444444), // Dark grey color
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    entry['date']!,
                    style: GoogleFonts.poppins(
                      color: const Color(0xFF888888), // Medium grey color
                    ),
                  ),
                  const SizedBox(height: 16),
                  EmotionWidget(
                    emoji: entry['emoji']!,
                    label: entry['mood']!,
                    isSelected: true,
                    onTap: () {},
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            Text(
              entry['description']!,
              style: GoogleFonts.poppins(
                fontSize: 18,
                height: 1.6, // Line height for better readability
                color: const Color(0xFF666666), // Medium grey color
              ),
            ),
          ],
        ),
      ),
      backgroundColor: const Color(0xFFFFFFFF), // White background for clean look
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
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFE1F5FE) : Colors.transparent, // Light blue background if selected
          borderRadius: BorderRadius.circular(12.0),
          border: Border.all(
            color: isSelected ? const Color(0xFF0288D1) : Colors.transparent, // Blue border if selected
            width: 2.0,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              emoji,
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(width: 8),
            Text(
              label,
              style: GoogleFonts.poppins(
                color: isSelected ? const Color(0xFF0288D1) : const Color(0xFF666666), // Blue or medium grey color
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
