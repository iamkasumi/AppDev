import 'package:flutter/material.dart';
import 'video_page.dart';
import 'affirmations_page.dart';
import 'journal_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0; // To keep track of the selected index of the BottomNavigationBar
  static const List<Widget> _pages = <Widget>[
    HomeScreen(),
    VideoPage(),
    AffirmationsPage(),
    JournalPage(),
  ];

  // Function to handle navigation bar item tap
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar with a butterfly image on the left and a menu icon on the right
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset('images/butterfly.jpg'), // Ensure you have a butterfly image in the assets folder
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.more_vert, color: Colors.black),
            onPressed: () {
              // Handle menu action
            },
          ),
        ],
      ),
      body: Center(
        child: _pages.elementAt(_selectedIndex), // Display the selected page
      ),
      // BottomNavigationBar with four items
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_collection),
            label: 'Videos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.format_quote),
            label: 'Affirmations',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Journal',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color.fromARGB(255, 97, 109, 105), // Selected item color
        unselectedItemColor: Color.fromARGB(255, 183, 186, 171), // Unselected item color
        onTap: _onItemTapped, // Handle tap on navigation bar items
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0), // Padding on all sides
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Hello, <name>!', // Display greeting
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'How do you feel today?', // Prompt user to select their mood
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey[600],
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
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Positive affirmations which will help you keep good mood all day.', // Description
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[700],
                        ),
                      ),
                      Text(
                        '10 min', // Duration
                        style: TextStyle(
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
              style: TextStyle(
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
      padding: const EdgeInsets.all(16.0), // Padding on all sides
      width: 150,
      decoration: BoxDecoration(
        color: Color(0xFFFBF3D5), // Background color
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            description,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[700],
            ),
          ),
          const SizedBox(height: 10),
          Icon(Icons.play_circle_filled, size: 40, color: Colors.black54), // Play icon
        ],
      ),
    );
  }
}
