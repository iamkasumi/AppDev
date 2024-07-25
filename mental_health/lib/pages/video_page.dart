import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:video_player/video_player.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';

class VideoPage extends StatefulWidget {
  @override
  _VideoPageState createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  final List<Map<String, dynamic>> _videos = [
    {
      'image': 'images/affirm_images/midful_a.png',
      'title': 'Mindful Affirmation',
      'videos': [
        {
          'image': 'images/affirm_images/Imindful.jpg',
          'title': 'Mindful Affirmation',
          'video': 'videos/mindful.mp4',
        },
      ],
    },
    {
      'image': 'images/affirm_images/loveaffirm.png',
      'title': 'Love and Relationships',
      'videos': [
        {
          'image': 'images/affirm_images/loveaffirm.jpg',
          'title': 'Love Video ',
          'video': 'videos/loveaffirm.mp4',
        },
      ],
    },
    {
      'image': 'images/affirm_images/healthWB.png',
      'title': 'Health and Well-Being',
      'videos': [
        {
          'image': 'images/affirm_images/health1.jpg',
          'title': 'Health Video ',
          'video': 'videos/health.mp4',
        },
      ],
    },
    {
      'image': 'images/affirm_images/financial-freedom.png',
      'title': 'Financial Freedom and Wealth',
      'videos': [
        {
          'image': 'images/affirm_images/financial.jpg',
          'title': 'Financial Video ',
          'video': 'videos/financial-freedom.mp4',
        },
      ],
    },
    {
      'image': 'images/affirm_images/gratitude_.png',
      'title': 'Gratitude',
      'videos': [
        {
          'image': 'images/affirm_images/_gratitude.jpg',
          'title': 'Gratitude Video ',
          'video': 'videos/gratitude.mp4',
        },

      ],
    },
    {
      'image': 'images/affirm_images/self-confidence.png',
      'title': 'Self Confidence',
      'videos': [
        {
          'image': 'images/affirm_images/self.jpg',
          'title': 'Confidence Video ',
          'video': 'videos/self-confidence.mp4',
        },
      ],
    },
    {
      'image': 'images/affirm_images/better-sleep.png',
      'title': 'Better Sleep',
      'videos': [
        {
          'image': 'images/affirm_images/better.jpg',
          'title': 'Sleep Video ',
          'video': 'videos/better-sleep.mp4',
        },
      ],
    },
    {
      'image': 'images/affirm_images/_stress.png',
      'title': 'Release Stress and Anxiety',
      'videos': [
        {
          'image': 'images/affirm_images/anxiety.jpg',
          'title': 'Release Stress and Anxiety',
          'video': 'videos/stress-anxiety.mp4',
        },
      ],
    },
  ];

  void _playVideo(BuildContext context, List<Map<String, String>> videos) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => VideoDeckScreen(videos: videos),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(63.0), // Height of the AppBar
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
                    "Videos",
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
      
      body: Container(
        color: Color.fromARGB(255, 240, 232, 222), // Light yellow color
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: StaggeredGridView.countBuilder(
            crossAxisCount: 4,
            itemCount: _videos.length,
            itemBuilder: (BuildContext context, int index) {
              return _buildVideoCard(context, _videos[index]);
            },
            staggeredTileBuilder: (int index) => StaggeredTile.fit(2),
            mainAxisSpacing: 8.0,
            crossAxisSpacing: 8.0,
          ),
        ),
      ),
    );
  }

  Widget _buildVideoCard(BuildContext context, Map<String, dynamic> video) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: InkWell(
        onTap: () => _playVideo(context, video['videos']),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(15.0)),
              child: Image.asset(video['image']!, fit: BoxFit.cover, height: 150.0),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                video['title']!,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

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