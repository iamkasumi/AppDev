import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddJournalEntryPage extends StatefulWidget {
  final Function(Map<String, String>) addEntry;

  const AddJournalEntryPage({super.key, required this.addEntry});

  @override
  _AddJournalEntryPageState createState() => _AddJournalEntryPageState();
}

class _AddJournalEntryPageState extends State<AddJournalEntryPage> {
  final _formKey = GlobalKey<FormState>();
  String _date = '';
  String _mood = '';
  String _emoji = '';
  String _title = '';
  String _description = '';

  void _submitEntry() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      widget.addEntry({
        'date': _date,
        'mood': _mood,
        'emoji': _emoji,
        'title': _title,
        'description': _description,
      });
      Navigator.pop(context);
    }
  }

  Future<void> _selectDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null) {
      setState(() {
        _date = '${pickedDate.toLocal().day}/${pickedDate.toLocal().month}/${pickedDate.toLocal().year}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add Journal Entry",
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color.fromARGB(255, 133, 186, 180), // Light teal background color
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'images/green.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(30.0),
            color: Color(0x80F0F4F8), // Semi-transparent light gray background color for the body
            child: Form(
              key: _formKey,
              child: ListView(
                children: [
                  TextFormField(
                    readOnly: true,
                    onTap: _selectDate,
                    decoration: InputDecoration(
                      labelText: 'Date',
                      suffixIcon: Icon(Icons.calendar_today, color: Color(0xFF00796B)), // Teal color
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    controller: TextEditingController(text: _date),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please select a date';
                      }
                      return null;
                    },
                  ),
                  
                  const SizedBox(height: 18),
                  
                  Text(
                    "How do you feel today?",
                    style: GoogleFonts.poppins(
                      fontSize: 18, 
                      fontWeight: FontWeight.w600
                    ),
                  ),
                  
                  const SizedBox(height: 10),
                  
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      EmotionWidget(
                        emoji: '😡',
                        label: 'Angry',
                        isSelected: _emoji == '😡',
                        onTap: () {
                          setState(() {
                            _emoji = '😡';
                            _mood = 'Angry';
                          });
                        },
                      ),
                      EmotionWidget(
                        emoji: '😊',
                        label: 'Happy',
                        isSelected: _emoji == '😊',
                        onTap: () {
                          setState(() {
                            _emoji = '😊';
                            _mood = 'Happy';
                          });
                        },
                      ),
                      EmotionWidget(
                        emoji: '😢',
                        label: 'Sad',
                        isSelected: _emoji == '😢',
                        onTap: () {
                          setState(() {
                            _emoji = '😢';
                            _mood = 'Sad';
                          });
                        },
                      ),
                      EmotionWidget(
                        emoji: '😌',
                        label: 'Relaxed',
                        isSelected: _emoji == '😌',
                        onTap: () {
                          setState(() {
                            _emoji = '😌';
                            _mood = 'Relaxed';
                          });
                        },
                      ),
                    ],
                  ),
                  
                  const SizedBox(height: 18),
                  
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Title',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a title';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _title = value!;
                    },
                  ),
                  
                  const SizedBox(height: 18),
                  
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Write your thoughts here...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    maxLines: 5,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a description';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _description = value!;
                    },
                  ),
                  
                  const SizedBox(height: 24),
                  
                  ElevatedButton(
                    onPressed: _submitEntry,
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      backgroundColor: Color(0xFF00796B), 
                      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                    ),
                    child: Text(
                      'Save',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class EmotionWidget extends StatelessWidget {
  final String emoji;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const EmotionWidget({
    required this.emoji,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: isSelected ? Color.fromARGB(255, 197, 228, 226) : Colors.transparent, // Light teal color
          borderRadius: BorderRadius.circular(20.0),
          border: Border.all(
            color: isSelected ? Color.fromARGB(255, 0, 0, 0) : Colors.transparent, // Teal color when selected
            width: 1.0,
          ),
        ),
        child: Column(
          children: [
            Text(
              emoji,
              style: TextStyle(fontSize: 28),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                color: isSelected ? Color.fromARGB(255, 0, 0, 0) : Colors.black, // Teal color when selected
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
