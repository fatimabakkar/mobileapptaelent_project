import 'package:flutter/material.dart';
import 'profile.dart'; // Assuming ProfilePage is available

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: SizesAndMeasurementsPage(),
  ));
}

class SizesAndMeasurementsPage extends StatefulWidget {
  @override
  _SizesAndMeasurementsPageState createState() =>
      _SizesAndMeasurementsPageState();
}

class _SizesAndMeasurementsPageState extends State<SizesAndMeasurementsPage> {
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _shirtSizeController = TextEditingController();
  final TextEditingController _pantsSizeController = TextEditingController();
  final TextEditingController _shoeSizeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6F7FB), // Light background color
      appBar: AppBar(
        backgroundColor: Colors.deepPurple, // Dark purple app bar
        elevation: 2,
        title: Text(
          'Sizes & Measurements',
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 30.0), // Margin between AppBar and body
        padding: const EdgeInsets.all(16.0), // Padding for body content
        child: ListView(
          children: [
            // Weight TextField
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0), // Padding between fields
              child: TextField(
                controller: _weightController,
                decoration: InputDecoration(
                  labelText: 'Weight (in Kg)',
                  labelStyle: TextStyle(color: Colors.black),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            SizedBox(height: 15),
            // Height TextField
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0), // Padding between fields
              child: TextField(
                controller: _heightController,
                decoration: InputDecoration(
                  labelText: 'Height (in CM)',
                  labelStyle: TextStyle(color: Colors.black),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            SizedBox(height: 15),


            // Shirt Size TextField
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: TextField(
                controller: _shirtSizeController,
                decoration: InputDecoration(
                  labelText: 'Shirt Size',
                  labelStyle: TextStyle(color: Colors.black),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                ),
              ),
            ),
            SizedBox(height: 15),

            // Pants Size TextField
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: TextField(
                controller: _pantsSizeController,
                decoration: InputDecoration(
                  labelText: 'Pants Size',
                  labelStyle: TextStyle(color: Colors.black),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            SizedBox(height: 15),

            // Shoe Size TextField
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: TextField(
                controller: _shoeSizeController,
                decoration: InputDecoration(
                  labelText: 'Shoe Size',
                  labelStyle: TextStyle(color: Colors.black),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                ),
                keyboardType: TextInputType.number,
              ),
            ),

            // Save Changes Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProfilePage()),
                  );
                  print('Changes saved');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple, // Dark purple button color
                  padding: EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  'Save Changes',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
