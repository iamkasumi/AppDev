import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mental_health/pages/homeScreen.dart';

class PersonalizationScreen extends StatelessWidget {
  const PersonalizationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              
              Text(
                'Welcome to Eunoia!',
                style: GoogleFonts.playfairDisplay(
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
              
              const SizedBox(height: 15),
              
              Text(
                'Personalizing your space...',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              
              const SizedBox(height: 30),
              
              Image.asset(
                'images/yourself.jpg',
                width: 500,
                height: 250,
              ),
              
              const SizedBox(height: 30),
              
              Container(
                width: 300,
                child: Stack(
                  alignment: Alignment.centerRight,
                  children: [
                    
                    TextField(
                      style: GoogleFonts.poppins(
                        fontSize: 16, 
                        fontWeight: FontWeight.w400, 
                        color: Colors.black, 
                      ),
                      decoration: InputDecoration(
                        hintText: 'Enter your nickname here...',
                        hintStyle: GoogleFonts.poppins(
                          fontSize: 16, 
                          fontWeight: FontWeight.w400, 
                          color: Colors.grey, 
                        ),
                        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        filled: true,
                        fillColor: Color.fromARGB(255, 241, 240, 234),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Image.asset(
                        'images/left_butterfly.png',
                        width: 30,
                        height: 30,
                      ),
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: 30),
              
              // Button to navigate to the HomePage
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()), // redirecting to the next page
                  );
                },
                
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFFC1A3),
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                
                child: Icon(
                  Icons.arrow_forward, 
                  size: 24, 
                  color: const Color.fromARGB(255, 59, 58, 58),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}