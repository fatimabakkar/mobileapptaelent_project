import 'package:flutter/material.dart';
import 'my_job.dart';  // Import your pages like MyJob, Notifications, etc.
import 'main.dart';
import 'profile.dart';
import 'news_feed.dart';
void main() {

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<Home> {
  final List<Map<String, String>> castingCalls = [
    {
      'title': 'Luxury Fashion Shoot',
      'budget': '\$1000/day',
      'date': 'May 5, 2025',
      'location': 'Paris, France',
      'role': 'Fashion Model',
    },
    {
      'title': 'Car Commercial',
      'budget': '\$1200 total',
      'date': 'May 12, 2025',
      'location': 'Los Angeles, USA',
      'role': 'Commercial Actor',
    },
    {
      'title': 'Runway Model',
      'budget': '\$800 + Travel',
      'date': 'June 1, 2025',
      'location': 'Milan, Italy',
      'role': 'Runway Model',
    },
    {
      'title': 'Face Model',
      'budget': '\$700',
      'date': 'June 3, 2025',
      'location': 'Dubai, UAE',
      'role': 'Face Model',
    },
  ];

  // A mock function to simulate refreshing of casting data
  Future<void> _refreshPage() async {
    await Future.delayed(Duration(seconds: 1));
    setState(() {
      // Simulate data change (you can replace this with actual data fetch)
      castingCalls.shuffle();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6F7FB),
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        elevation: 2,
        title: Text(
          'Open Castings',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        centerTitle: true,
      ),
      body: RefreshIndicator(
        onRefresh: _refreshPage,
        child: ListView.builder(
          padding: EdgeInsets.all(16),
          itemCount: castingCalls.length,
          itemBuilder: (context, index) {
            final casting = castingCalls[index];
            return AnimatedContainer(
              duration: Duration(milliseconds: 300),
              margin: EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  colors: [Colors.white, Colors.grey[100]!],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    offset: Offset(0, 8),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                    child: Image.asset(
                      'assets/1.jpg', // Replace with a dynamic image source
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          casting['title']!,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        SizedBox(height: 12),
                        Row(
                          children: [
                            Icon(Icons.attach_money, size: 18, color: Colors.green[700]),
                            SizedBox(width: 5),
                            Text(casting['budget']!, style: TextStyle(color: Colors.green[700])),
                          ],
                        ),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            Icon(Icons.calendar_today, size: 18, color: Colors.blueGrey),
                            SizedBox(width: 5),
                            Text(casting['date']!, style: TextStyle(color: Colors.blueGrey)),
                          ],
                        ),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            Icon(Icons.location_on, size: 18, color: Colors.redAccent),
                            SizedBox(width: 5),
                            Text(casting['location']!, style: TextStyle(color: Colors.redAccent)),
                          ],
                        ),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            Icon(Icons.person_outline, size: 18, color: Colors.deepPurple),
                            SizedBox(width: 5),
                            Text(casting['role']!, style: TextStyle(color: Colors.deepPurple)),
                          ],
                        ),
                        SizedBox(height: 16),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              // Action for Apply Now button
                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              padding: EdgeInsets.symmetric(vertical: 14),
                            ),
                            child: Text(
                              'Apply Now',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.deepPurple,
        shape: CircularNotchedRectangle(),
        notchMargin: 8.0,
        child: Container(
          height: 60,
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(Icons.home, size: 34, color: Color(0xFF75A488)),
                onPressed: () {
                },
              ),
              IconButton(
                icon: const Icon(Icons.work, size: 33, color: Colors.white),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyJobPage()),
                  );
                },
              ),
              SizedBox(width: 40),
              IconButton(
                icon: const Icon(Icons.feed, size: 33, color: Colors.white),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>NewsFeedPage()),
                  );
                },
              ),
              IconButton(
                icon: const Icon(Icons.person, size: 33, color: Colors.white),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>ProfilePage()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
