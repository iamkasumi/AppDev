import 'package:flutter/material.dart';
import 'video_page.dart';
import 'affirmations_page.dart';
import 'journal_page.dart';
import 'home_page.dart'; 

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
          child: Image.asset('images/butterfly.jpg'), 
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