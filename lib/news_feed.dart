import 'package:flutter/material.dart';
import 'news-detail.dart';  // Import the NewsDetailPage
import 'profile.dart';
import 'home.dart';
import 'my_job.dart';
class NewsFeedPage extends StatelessWidget {
  final List<Map<String, String>> newsFeed = [
    {
      'title': 'Modeling Trends 2025',
      'description': 'Discover the latest fashion trends and modeling opportunities emerging this year!',
      'image': 'assets/1.jpg',
      'likes': '120',
      'comments': '45',
      'fullText': 'Long article about Modeling Trends 2025...',
    },
    {
      'title': 'How to Get International Castings',
      'description': 'Tips and tricks to land gigs in Paris, Milan, and New York.',
      'image': 'assets/1.jpg',
      'likes': '98',
      'comments': '30',
      'fullText': 'Full guide on getting international castings...',
    },
    {
      'title': 'Building Your Model Portfolio',
      'description': 'Essential photos every aspiring model should have in their portfolio.',
      'image': 'assets/1.jpg',
      'likes': '150',
      'comments': '55',
      'fullText': 'Everything you need to build a strong model portfolio...',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6F7FB),
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        elevation: 2,
        title: Text(
          'News Feed',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: newsFeed.length,
        itemBuilder: (context, index) {
          final news = newsFeed[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NewsDetailPage(news: news),
                ),
              );
            },
            child: AnimatedContainer(
              duration: Duration(milliseconds: 500 + index * 100),
              curve: Curves.easeOut,
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
                  Hero(
                    tag: news['image']!,
                    child: ClipRRect(
                      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                      child: Image.asset(
                        news['image']!,
                        height: 200,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          news['title']!,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          news['description']!,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[700],
                          ),
                        ),
                        SizedBox(height: 16),
                        Row(
                          children: [
                            Icon(Icons.favorite, color: Colors.redAccent, size: 20),
                            SizedBox(width: 5),
                            Text(news['likes']!, style: TextStyle(color: Colors.grey[800])),
                            SizedBox(width: 20),
                            Icon(Icons.comment, color: Colors.blueAccent, size: 20),
                            SizedBox(width: 5),
                            Text(news['comments']!, style: TextStyle(color: Colors.grey[800])),
                            Spacer(),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => NewsDetailPage(news: news),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                              ),
                              child: Text('Read More'),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
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
                icon: const Icon(Icons.home, size: 34,color: Colors.white ),
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
}
