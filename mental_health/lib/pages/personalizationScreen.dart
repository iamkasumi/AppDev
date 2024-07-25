import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mental_health/pages/homeScreen.dart';

class PersonalizationScreen extends StatefulWidget {
  const PersonalizationScreen({super.key});

  @override
  _PersonalizationScreenState createState() => _PersonalizationScreenState();
}

class _PersonalizationScreenState extends State<PersonalizationScreen> {
  final TextEditingController _nicknameController = TextEditingController();

  void _showConfirmationDialog() {
    final nickname = _nicknameController.text;

    if (nickname.isEmpty) {
      // Show error message if the nickname is empty
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter a nickname')),
      );
      return;
    }

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Confirm nickname:',
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          
          content: Text(
            'Is "$nickname" the correct nickname?',
            style: GoogleFonts.poppins(
              fontSize: 14,
              color: Colors.black,
            ),
          ),
          
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              style: TextButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 218, 75, 65), // Text color
              ),
              child: Text(
                'Cancel',
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  color: Colors.black,
                ),
              ),
            ),
            
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(nickname: nickname),
                  ),
                );
              },
              style: TextButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 77, 198, 81), // Text color
              ),
              child: Text(
                'Yes',
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

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
                      controller: _nicknameController,
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
              ElevatedButton(
                onPressed: _showConfirmationDialog,
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