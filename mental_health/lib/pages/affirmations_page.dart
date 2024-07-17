import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AffirmationsPage(),
    );
  }
}

class AffirmationsPage extends StatelessWidget {
  const AffirmationsPage({super.key});

  final List<Map<String, dynamic>> affirmationCategories = const [
    {
      'title': 'Mindful Affirmations',
      'subtitle': '102 affirmations',
      'color': Color.fromARGB(255, 183, 186, 171),
      'icon': Icons.self_improvement,
      'affirmations': [
        'My mind is focused.',
        'I am present in the moment.',
         'I am gifted',
         'I let go of all resistance to change.',
         'I am present',
         'Good things are around me.',
      ]
    },
    {
      'title': 'Love and Relationships',
      'subtitle': '83 affirmations',
      'color': Color.fromARGB(255, 255, 192, 192), // Light red
      'icon': Icons.favorite,
      'affirmations': [
        'I am loved.',
        'I deserve to be loved.',
        // Add more affirmations here
      ]
    },
    {
      'title': 'Health and Well-Being',
      'subtitle': '87 affirmations',
      'color': Color.fromARGB(255, 192, 255, 192), // Light green
      'icon': Icons.health_and_safety,
      'affirmations': [
        'I am healthy and strong.',
        'I take care of my body.',
        // Add more affirmations here
      ]
    },
    {
      'title': 'Financial Freedom and Wealth',
      'subtitle': '80 affirmations',
      'color': Color.fromARGB(255, 162, 222, 230), // Light blue
      'icon': Icons.attach_money,
      'affirmations': [
        'I am financially free.',
        'Wealth flows to me easily.',
        // Add more affirmations here
      ]
    },
    {
      'title': 'Gratitude',
      'subtitle': '88 affirmations',
      'color': Color.fromARGB(255, 237, 170, 83), // Light orange
      'icon': Icons.handshake,
      'affirmations': [
        'I am grateful for today.',
        'Gratitude fills my heart.',
        // Add more affirmations here
      ]
    },
    {
      'title': 'Self Confidence',
      'subtitle': '74 affirmations',
      'color': Color.fromARGB(255, 227, 237, 145), // Light brown
      'icon': Icons.emoji_events,
      'affirmations': [
        'I am confident.',
        'I believe in myself.',
        // Add more affirmations here
      ]
    },
    {
      'title': 'Better Sleep',
      'subtitle': '79 affirmations',
      'color': Color.fromARGB(255, 208, 146, 227), // Mid blue
      'icon': Icons.bedtime,
      'affirmations': [
        'I sleep peacefully.',
        'I wake up refreshed.',
        // Add more affirmations here
      ]
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Affirmations'),
        backgroundColor: const Color.fromARGB(255, 97, 109, 105),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: affirmationCategories.length,
          itemBuilder: (context, index) {
            final category = affirmationCategories[index];
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Card(
                color: category['color'],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(16.0),
                  leading: Icon(
                    category['icon'],
                    size: 40,
                    color: const Color.fromARGB(255, 97, 109, 105),
                  ),
                  title: Text(
                    category['title'],
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(category['subtitle']),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AffirmationDetailPage(
                          title: category['title'],
                          affirmations: category['affirmations'],
                        ),
                      ),
                    );
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class AffirmationDetailPage extends StatelessWidget {
  final String title;
  final List<String> affirmations;

  const AffirmationDetailPage({
    super.key,
    required this.title,
    required this.affirmations,
  });

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController(viewportFraction: 0.8);

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: const Color.fromARGB(255, 97, 109, 105),
      ),
      body: PageView.builder(
        controller: controller,
        itemCount: affirmations.length,
        itemBuilder: (context, index) {
          return Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.8, // Fixed width
              height: MediaQuery.of(context).size.height * 0.5, // Fixed height
              child: Card(
                elevation: 5,
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Center(
                    child: Text(
                      affirmations[index],
                      style: const TextStyle(fontSize: 24),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
