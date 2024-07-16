import 'package:flutter/material.dart';

class VideoPage extends StatelessWidget {
  const VideoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Video Contents'),
      ),
      body: Center(
        child: const Text('Video Contents Page'),
      ),
    );
  }
}
