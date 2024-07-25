import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'video_page.dart';
import 'affirmations_page.dart';
import 'journal_page.dart';
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
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Hello, ${widget.nickname}!', // Display greeting with nickname
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
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
        selectedItemColor: Colors.black, // Color for selected item
        unselectedItemColor: Colors.grey, // Color for unselected items
        backgroundColor: Colors.grey[200], // Background color of the BottomNavigationBar
        onTap: _onItemTapped, // Handle tap on navigation bar items
      ),
    );
  }
}