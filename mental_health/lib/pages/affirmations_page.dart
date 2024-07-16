import 'package:flutter/material.dart';

class AffirmationsPage extends StatelessWidget {
  const AffirmationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Affirmations'),
      ),
      body: Center(
        child: const Text('Affirmations Page'),
      ),
    );
  }
}
