import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:carousel_slider/carousel_slider.dart';

class VideoDeckScreen extends StatefulWidget {
  final List<Map<String, String>> videos;

  const VideoDeckScreen({required this.videos});

  @override
  _VideoDeckScreenState createState() => _VideoDeckScreenState();
}

class _VideoDeckScreenState extends State<VideoDeckScreen> {
  late List<VideoPlayerController> _videoControllers;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _videoControllers = widget.videos.map((video) {
      VideoPlayerController controller = VideoPlayerController.asset(video['video']!)
        ..initialize().then((_) {
          setState(() {}); // Ensure the first frame is shown after the video is initialized
        });
      return controller;
    }).toList();
  }

  @override
  void dispose() {
    _videoControllers.forEach((controller) => controller.dispose());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Video Play'),
        backgroundColor: const Color.fromARGB(255, 97, 109, 105),
      ),
      
      body: CarouselSlider.builder(
        itemCount: widget.videos.length,
        itemBuilder: (context, index, realIndex) {
          final controller = _videoControllers[index];

          return Center(
            child: controller.value.isInitialized
                ? AspectRatio(
                    aspectRatio: controller.value.aspectRatio,
                    child: VideoPlayer(controller),
                  )
                : CircularProgressIndicator(),
          );
        },
        
        options: CarouselOptions(
          height: MediaQuery.of(context).size.height * 0.8,
          enlargeCenterPage: true,
          enableInfiniteScroll: false,
          autoPlay: false,
          aspectRatio: 16 / 9,
          onPageChanged: (index, reason) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
      ),
      
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final controller = _videoControllers[_currentIndex];
          setState(() {
            controller.value.isPlaying ? controller.pause() : controller.play();
          });
        },
        child: Icon(
          _videoControllers[_currentIndex].value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),
    );
  }
}