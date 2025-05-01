import 'package:flutter/material.dart';
import 'home.dart';
import 'profile.dart';
import 'news_feed.dart';
void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyJobPage(),
  ));
}

class MyJobPage extends StatefulWidget {
  @override
  _MyJobPageState createState() => _MyJobPageState();
}

class _MyJobPageState extends State<MyJobPage> with TickerProviderStateMixin {
  int _selectedTab = 0;
  late PageController _pageController;

  final List<Map<String, String>> invites = [
    {
      'title': 'Luxury Fashion Shoot',
      'budget': '\$1000/day',
      'date': 'May 5, 2025',
      'location': 'Paris, France',
      'role': 'Fashion Model',
    },
    {
      'title': 'Summer Collection Shoot',
      'budget': '\$950/day',
      'date': 'May 10, 2025',
      'location': 'New York, USA',
      'role': 'Model',
    },
  ];

  final List<Map<String, String>> applications = [
    {
      'title': 'Runway Model',
      'budget': '\$800 + Travel',
      'date': 'June 1, 2025',
      'location': 'Milan, Italy',
      'role': 'Runway Model',
    },
  ];

  final List<Map<String, String>> completed = [
    {
      'title': 'Face Model',
      'budget': '\$700',
      'date': 'April 20, 2025',
      'location': 'Dubai, UAE',
      'role': 'Face Model',
    },
  ];

  List<Map<String, String>> get currentList {
    if (_selectedTab == 0) return invites;
    if (_selectedTab == 1) return applications;
    return completed;
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _selectedTab);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void onTabTap(int index) {
    setState(() {
      _selectedTab = index;
    });
    _pageController.animateToPage(
      index,
      duration: Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6F7FB),
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        elevation: 2,
        title: Text(
          'My Job',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(height: 16),
          Container(
            height: 50,
            margin: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.deepPurple.withOpacity(0.1),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Stack(
              children: [
                AnimatedAlign(
                  alignment: _selectedTab == 0
                      ? Alignment.centerLeft
                      : _selectedTab == 1
                      ? Alignment.center
                      : Alignment.centerRight,
                  duration: Duration(milliseconds: 300),
                  child: Container(
                    width: MediaQuery.of(context).size.width / 3.5,
                    margin: EdgeInsets.symmetric(horizontal: 6),
                    decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () => onTabTap(0),
                        child: Center(
                          child: Text(
                            'Invites (${invites.length})',
                            style: TextStyle(
                              color: _selectedTab == 0
                                  ? Colors.white
                                  : Colors.deepPurple,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () => onTabTap(1),
                        child: Center(
                          child: Text(
                            'Applications (${applications.length})',
                            style: TextStyle(
                              color: _selectedTab == 1
                                  ? Colors.white
                                  : Colors.deepPurple,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () => onTabTap(2),
                        child: Center(
                          child: Text(
                            'Completed (${completed.length})',
                            style: TextStyle(
                              color: _selectedTab == 2
                                  ? Colors.white
                                  : Colors.deepPurple,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: 3,
              onPageChanged: (index) {
                setState(() {
                  _selectedTab = index;
                });
              },
              itemBuilder: (context, pageIndex) {
                List<Map<String, String>> jobs = pageIndex == 0
                    ? invites
                    : pageIndex == 1
                    ? applications
                    : completed;
                if (jobs.isEmpty) {
                  return Center(
                    child: Text(
                      pageIndex == 0
                          ? 'No invites yet! 🚀'
                          : pageIndex == 1
                          ? 'No applications yet! 📩'
                          : 'No completed jobs yet! ✅',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey[600],
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  );
                }
                return ListView.builder(
                  padding: EdgeInsets.all(16),
                  itemCount: jobs.length,
                  itemBuilder: (context, index) {
                    final job = jobs[index];
                    return jobCard(job);
                  },
                );
              },
            ),
          ),
        ],
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
                icon: const Icon(Icons.home, size: 34, color: Colors.white),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Home()),
                  );                },
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
                    MaterialPageRoute(builder: (context) => NewsFeedPage()),
                  );
                },
              ),
              IconButton(
                icon: const Icon(Icons.person, size: 33, color: Colors.white),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProfilePage()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget jobCard(Map<String, String> job) {
    return Container(
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
            blurRadius: 10, // Increase the blur radius for a softer shadow
            offset: Offset(0, 8), // Slight offset to mimic a lifted effect
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            child: Image.asset(
              'assets/1.jpg', // Update this path to the actual image asset
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
                  job['title']!,
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
                    Text(job['budget']!, style: TextStyle(color: Colors.green[700])),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Icon(Icons.calendar_today, size: 18, color: Colors.blueGrey),
                    SizedBox(width: 5),
                    Text(job['date']!, style: TextStyle(color: Colors.blueGrey)),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Icon(Icons.location_on, size: 18, color: Colors.redAccent),
                    SizedBox(width: 5),
                    Text(job['location']!, style: TextStyle(color: Colors.redAccent)),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Icon(Icons.person_outline, size: 18, color: Colors.deepPurple),
                    SizedBox(width: 5),
                    Text(job['role']!, style: TextStyle(color: Colors.deepPurple)),
                  ],
                ),
                SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      // View Details
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 14),
                    ),
                    child: Text(
                      'View Details',
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
  }
}
