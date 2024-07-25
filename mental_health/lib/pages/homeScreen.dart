import 'package:flutter/material.dart';
import 'video_page.dart';
import 'affirmations_page.dart';
import 'journal/journal_page.dart';
import 'home_page.dart'; 
import 'package:google_fonts/google_fonts.dart';

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
      
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(63.0), 
        
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(20.0), 
            ),
            
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 5,
                offset: Offset(0, 3), 
              ),
            ],
          ),
          
          child: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Center(
              child: Row(
                mainAxisSize: MainAxisSize.min, // To center the row content
                children: [
                  Image.asset(
                    'images/butterfly-1.jpg',
                    width: 40,
                    height: 40,
                  ),
                  
                  const SizedBox(width: 8), 
                  
                  Text(
                    "Eunoia",
                    style: GoogleFonts.playfairDisplay(
                      fontSize: 26,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                ],
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
        ),
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
        selectedItemColor: Color.fromARGB(255, 97, 109, 105),
        unselectedItemColor: Color.fromARGB(255, 183, 186, 171),
        onTap: _onItemTapped, // Handle tap on navigation bar items
      ),
    );
  }
}