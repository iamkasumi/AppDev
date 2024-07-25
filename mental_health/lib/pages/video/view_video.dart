import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';

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

  void _stopVideo() {
    final controller = _videoControllers[_currentIndex];
    controller.pause();
    controller.seekTo(Duration.zero);
  }

  void _playPauseVideo() {
    final controller = _videoControllers[_currentIndex];
    setState(() {
      if (controller.value.isPlaying) {
        controller.pause();
      } else {
        controller.play();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Video Play',
          style: GoogleFonts.playfairDisplay(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Color.fromARGB(255, 37, 37, 37),
          ),
        ),
        backgroundColor: Color.fromARGB(255, 133, 186, 180),
        elevation: 0,
        centerTitle: true,
        toolbarHeight: 60,
      ),
      
      body: Padding(
        padding: const EdgeInsets.only(top: 20.0), // Adjust padding to make space for AppBar
        child: CarouselSlider.builder(
          itemCount: widget.videos.length,
          itemBuilder: (context, index, realIndex) {
            final controller = _videoControllers[index];

            return Container(
              margin: EdgeInsets.symmetric(horizontal: 8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 12,
                    offset: Offset(0, 4), // Shadow only at the bottom
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Stack(
                  children: [
                    Center(
                      child: controller.value.isInitialized
                          ? AspectRatio(
                              aspectRatio: controller.value.aspectRatio,
                              child: VideoPlayer(controller),
                            )
                          : CircularProgressIndicator(),
                    ),
                    Positioned.fill(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          gradient: LinearGradient(
                            colors: [Colors.transparent, Colors.black.withOpacity(0.5)],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        color: Colors.black.withOpacity(0.6),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              icon: Icon(
                                controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
                                color: Colors.white,
                              ),
                              onPressed: _playPauseVideo,
                            ),
                            SizedBox(width: 8),
                            IconButton(
                              icon: Icon(Icons.stop, color: Color.fromARGB(255, 239, 77, 77)),
                              onPressed: _stopVideo,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
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
      ),
    );
  }
}
