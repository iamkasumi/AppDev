import 'package:flutter/material.dart';
import 'video/video_page.dart';
import 'affirmations/affirmations_page.dart';
import 'journal/journal_page.dart';
import 'home_page.dart'; 

class HomePage extends StatefulWidget {
  final String nickname; // Add a field to store the nickname
  const HomePage({super.key, required this.nickname}); // Update constructor to accept nickname

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0; // To keep track of the selected index of the BottomNavigationBar

  // Define pages with the nickname passed to HomeScreen
  List<Widget> get _pages => <Widget>[
        HomeScreen(nickname: widget.nickname), // Pass the nickname here
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
      body: Center(
        child: _pages.elementAt(_selectedIndex), // Display the selected page
      ),
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
        selectedItemColor: Color.fromARGB(255, 97, 109, 105),
        unselectedItemColor: Color.fromARGB(255, 183, 186, 171),
        onTap: _onItemTapped, // Handle tap on navigation bar items
      ),
    );
  }
}