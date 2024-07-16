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
  int _selectedIndex = 0;
  static const List<Widget> _pages = <Widget>[
    HomeScreen(),
    VideoPage(),
    AffirmationsPage(),
    JournalPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _pages.elementAt(_selectedIndex),
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
        onTap: _onItemTapped,
      ),
    );
  }
}

//contains the home page disp
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const <Widget>[
          Text('Welcome to Eunoia: Mental Well-Being'),
          Text('Use the navigation bar to explore different features'),
        ],
      ),
    );
  }
}