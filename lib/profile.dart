import 'package:flutter/material.dart';
import 'my_job.dart';  // Example import for other pages
import 'home.dart';
import 'news_feed.dart';
import 'LoginPage.dart';
import 'size.dart';
import 'earning.dart';
import 'upload image.dart';
class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );

    _fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );

    _slideAnimation = Tween<Offset>(begin: Offset(0.0, 0.5), end: Offset.zero)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6F7FB),
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        elevation: 2,
        title: Text(
          'My Profile',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        centerTitle: true,
      ),
      body: FadeTransition(
        opacity: _fadeAnimation,
        child: SlideTransition(
          position: _slideAnimation,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView(
              children: [
                // Profile Picture Section
                Center(
                  child: Stack(
                    children: [
                      CircleAvatar(
                        radius: 80,
                        backgroundImage: AssetImage('assets/1.jpg'), // Placeholder, change to user image
                      ),
                      Positioned(
                        bottom: 10,
                        right: 10,
                        child: IconButton(
                          icon: Icon(Icons.edit, color: Colors.white),
                          onPressed: () {
                            // Implement image change functionality
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),

                // Name Section
                Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'John Doe', // User's name
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Fashion Model', // User's role
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.deepPurple,
                          ),
                        ),
                        SizedBox(height: 20),
                        // "Edit Your Profile" Section
                        _buildSection(
                          title: 'Size and measurments',
                          icon: Icons.ac_unit_outlined,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) =>    SizesAndMeasurementsPage
                                ()),
                            );
                          },
                        ),
                        SizedBox(height: 20),

                        // Payment Details Section
                        _buildSection(
                          title: 'Payment Details',
                          icon: Icons.payment,
                          onPressed: () {
                            // Navigate to payment details page
                          },
                        ),
                        SizedBox(height: 20),

                        // Settings Section
                        _buildSection(
                          title: 'Earnings',
                          icon: Icons.account_balance_wallet,
                          onPressed: () {

                     Navigator.push(
                                context,
                      MaterialPageRoute(builder: (context) => EarningsPage()),
    );
    },
                        ),
                        SizedBox(height: 20),

                        // Settings Section
                        _buildSection(
                          title: 'Additional photo',
                          icon: Icons.photo,
                          onPressed: () {
                                                    },
                        ),
                        SizedBox(height: 20),

                        // Logout Section
                        _buildSection(
                          title: 'Logout',
                          icon: Icons.exit_to_app,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => LoginPage()),
                            );                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
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
                icon: const Icon(Icons.home, size: 34, color: Colors.white),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>Home()),
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

  // A reusable section for the Profile Page
  Widget _buildSection({required String title, required IconData icon, required VoidCallback onPressed}) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(20),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Icon(icon, color: Colors.deepPurple, size: 30),
              SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(Icons.arrow_forward_ios, size: 20, color: Colors.grey),
            ],
          ),
        ),
      ),
    );
  }
}
