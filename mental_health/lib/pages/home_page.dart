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
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 183, 186, 171),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset('images/butterfly.jpg'), 
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {
              // Handle menu action
            },
          ),
        ],
      ),
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

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Color(0xFFD6DAC8),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Text(
                'Hello, <name>!',
                style: TextStyle(fontSize: 24),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Color(0xFFD6DAC8),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Text(
                'How do you feel today?',
                style: TextStyle(fontSize: 20),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Color(0xFFD6DAC8),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: <Widget>[
                  const Text(
                    'Select an emotion:',
                    style: TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Icon(Icons.sentiment_very_dissatisfied, size: 30, color: Colors.red),
                          const SizedBox(height: 5),
                          const Text('Badly'),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Icon(Icons.sentiment_dissatisfied, size: 30, color: Colors.orange),
                          const SizedBox(height: 5),
                          const Text('Fine'),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Icon(Icons.sentiment_satisfied, size: 30, color: Colors.yellow),
                          const SizedBox(height: 5),
                          const Text('Well'),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Icon(Icons.sentiment_very_satisfied, size: 30, color: Colors.green),
                          const SizedBox(height: 5),
                          const Text('Excellent'),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
