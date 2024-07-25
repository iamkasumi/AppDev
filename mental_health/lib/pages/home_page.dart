import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  final String nickname; // Add a field to store the nickname

  const HomeScreen({super.key, required this.nickname}); // Update constructor to accept nickname

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Hello, $nickname!', // Display greeting with nickname
              style: GoogleFonts.poppins(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            
            const SizedBox(height: 8),
            
            Text(
              'How do you feel today?', // Prompt user to select their mood
              style: GoogleFonts.poppins(
                fontSize: 16,
                color: const Color.fromARGB(255, 90, 88, 88),
              ),
            ),
            
            const SizedBox(height: 20),
            
            // Row of emojis representing different moods
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                EmotionWidget(emoji: '😡', label: 'Angry'),
                EmotionWidget(emoji: '😊', label: 'Happy'),
                EmotionWidget(emoji: '😢', label: 'Sad'),
                EmotionWidget(emoji: '😌', label: 'Relaxed'),
              ],
            ),
            
            const SizedBox(height: 20),
            // Container for positive vibes section
            
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Color(0xFFFBF3D5), // Background color
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: <Widget>[
                  Icon(Icons.play_circle_filled, size: 40, color: Colors.black54),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Positive vibes:', // Section title
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Positive affirmations which will help you keep good mood all day.', // Description
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          color: Colors.grey[700],
                        ),
                      ),
                      Text(
                        '10 min', // Duration
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 20),

            // Section title for explore moods
            Text(
              'Explore moods:',
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            
            const SizedBox(height: 10),
            
            // Row containing mood widgets
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                MoodWidget(
                  title: 'Chilly',
                  description: 'Breathing exercises to help you keep a calm mood.',
                ),
                MoodWidget(
                  title: 'Happy',
                  description: 'Gratitude exercises to appreciate small things in life.',
                ),
              ],
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

  const EmotionWidget({required this.emoji, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          emoji,
          style: TextStyle(fontSize: 36), // Display emoji
        ),
        const SizedBox(height: 5),
        Text(label), // Display label
      ],
    );
  }
}

class MoodWidget extends StatelessWidget {
  final String title;
  final String description;

  const MoodWidget({required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      width: 150,
      decoration: BoxDecoration(
        color: Color(0xFFFBF3D5), // Background color
        borderRadius: BorderRadius.circular(10),
      ),
      
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title, // Display title
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            description, // Display description
            style: GoogleFonts.poppins(
              fontSize: 14,
              color: Colors.grey[700],
            ),
          ),
        ],
      ),
    );
  }
}