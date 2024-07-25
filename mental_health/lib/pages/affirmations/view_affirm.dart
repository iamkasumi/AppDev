import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';

class AffirmationDetailPage extends StatelessWidget {
  final String title;
  final List<String> affirmations;
  final String backgroundImage;

  const AffirmationDetailPage({
    super.key,
    required this.title,
    required this.affirmations,
    required this.backgroundImage,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
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
      
      body: Stack(
        children: [
          // Background color for the entire screen
          Container(
            color: Color.fromARGB(255, 223, 235, 234), // Background color
            child: SizedBox.expand(), 
          ),
          // Padding to create space between AppBar and CarouselSlider
          Padding(
            padding: const EdgeInsets.only(top: 60.0),
            child: CarouselSlider.builder(
              options: CarouselOptions(
                height: MediaQuery.of(context).size.height * 0.7,
                enlargeCenterPage: true,
                enableInfiniteScroll: false,
                viewportFraction: 0.9,
              ),
              itemCount: affirmations.length,
              itemBuilder: (context, index, realIndex) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Container(
                    padding: const EdgeInsets.all(10.0), // Padding inside the container
                    
                    child: Stack(
                      children: [
                        // Background image inside the container
                        Positioned.fill(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Image.asset(
                              backgroundImage,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        // Content overlay
                        Positioned.fill(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              gradient: LinearGradient(
                                colors: [Colors.transparent, Colors.black.withOpacity(0.6)],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                            ),
                          ),
                        ),
                        // Card content
                        Column(
                          children: [
                            Expanded(
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(25.0),
                                  child: Text(
                                    affirmations[index],
                                    style: GoogleFonts.poppins(
                                      fontSize: 24,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      shadows: [
                                        Shadow(
                                          offset: Offset(1.0, 1.0),
                                          blurRadius: 3.0,
                                          color: Colors.black,
                                        ),
                                      ],
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                            // Icons at the bottom of the card
                            Container(
                              padding: const EdgeInsets.symmetric(vertical: 8.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.vertical(
                                  bottom: Radius.circular(20.0),
                                ),
                                color: Colors.grey[900]!.withOpacity(0.8),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(
                                    icon: Icon(Icons.share, color: Colors.white),
                                    onPressed: () {
                                      // Handle share action
                                    },
                                  ),
                                  SizedBox(width: 16),
                                  IconButton(
                                    icon: Icon(Icons.favorite_border, color: Colors.white),
                                    onPressed: () {
                                      // Handle favorite action
                                    },
                                  ),
                                  SizedBox(width: 16),
                                  IconButton(
                                    icon: Icon(Icons.download, color: Colors.white),
                                    onPressed: () {
                                      // Handle download action
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
