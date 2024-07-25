import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mental_health/pages/nickname_input.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255), // Background color
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              
              // Inserted image
              Image.asset(
                'images/meditation.jpg',
                width: 300,
                height: 300,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 40),
              
              // Text message with different styles
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Feeling ',
                      style: GoogleFonts.playfairDisplay(
                        fontSize: 30,
                        color: Colors.black,
                      ),
                    ),
                    TextSpan(
                      text: 'stuck?',
                      style: GoogleFonts.playfairDisplay(
                        fontSize: 30,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 13),
              
              Text(
                'Learn how to surf on the waves \nof emotions with our app.',
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: const Color.fromARGB(255, 113, 111, 111),
                ),
                textAlign: TextAlign.center,
              ),
              
              const SizedBox(height: 40),
              
              // Button to navigate to the HomePage
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const PersonalizationScreen()), //redirecting to next page
                  );
                },
                
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFFC1A3), 
                  padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 20), 
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20), 
                  ),
                ),
                
                child: Text(
                  "Let's begin!",
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color.fromARGB(255, 59, 58, 58),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}