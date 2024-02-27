import 'package:flutter/material.dart';

import 'appraisal_screen.dart';
import 'dictionary.dart';
import 'numberofsite_screen.dart';
import 'timespent_screen.dart';


class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _selectedIndex = 0;
  int darkPatternedSites = 7; // You should replace this with your actual count

  static final List<Widget> _widgetOptions = <Widget>[
    ProjectsScreen(),
    Container(), // Placeholder for Alert screen
    ProfileScreen(
      name: 'Karan',
      workProfession: 'Flutter Developer',
      ipAddress: '192.168.1.1',
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (index == 1) {
      // Check if the "Alert" tab is tapped
      showDarkPatternedSitesAlert(darkPatternedSites);
    }
  }

  void showDarkPatternedSitesAlert(int darkPatternedSites) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertScreen(darkPatternedSites: darkPatternedSites);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dark Pattern'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.warning),
            label: 'Alert',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.face_2_rounded),
            label: 'Me',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}

class ProjectsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildProjectCard(
          title: 'Appraisal',
          description: 'Details about Appraisal',
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AppraisalScreen()),
            );
          },
        ),
        _buildProjectCard(
          title: 'Time Spend',
          description: 'Details about Time Spend',
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => TimeSpentScreen()),
            );
          },
        ),
        _buildProjectCard(
          title: 'Dark Pattern Dictionary',
          description: 'View and learn about dark patterns',
          onTap: () {
            // Add the navigation to the Dark Pattern Dictionary screen
            // Replace 'DarkPatternDictionaryScreen()' with your actual screen.
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DarkPatternDictionaryScreen()),
            );
          },
        ),
        _buildProjectCard(
          title: 'Number of Sites Visited',
          description: 'Details about Number of Sites Visited',
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => NumberOfSitesScreen()),
            );
          },
        ),
        
      ],
    );
  }

  Widget _buildProjectCard(
      {required String title,
      required String description,
      required VoidCallback onTap}) {
    return Card(
      margin: EdgeInsets.all(8),
      color: Color(0xFF2A2828),
      child: InkWell(
        splashColor: Colors.blue.withAlpha(30),
        onTap: onTap,
        child: Container(
          height: 100,
          padding: EdgeInsets.all(8),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(description),
                  ],
                ),
              ),
              Icon(Icons.arrow_forward_ios),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  final String name;
  final String workProfession;
  final String ipAddress;

  ProfileScreen({
    required this.name,
    required this.workProfession,
    required this.ipAddress,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Screen'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF2B2B2B), Color(0xFF1A1A1A)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
                color: Color(0xFF1A1A1A),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/images/profile_picture.png'),
                  ),
                  SizedBox(height: 16),
                  Text(
                    name,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    ipAddress,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFF1A1A1A),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Work Profession',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Name',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            name,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Work Profession',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            workProfession,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      Text(
                        'Settings',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 16),
                      // Add your settings widgets here
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



class AlertScreen extends StatelessWidget {
  final int darkPatternedSites;
  final int limit = 5; // Set your limit here

  AlertScreen({required this.darkPatternedSites});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Alert'),
      content: darkPatternedSites > limit
          ? Text('Warning! The number of dark-patterned sites has exceeded the limit.')
          : Text('No issues detected. Continue browsing safely.'),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('OK'),
        ),
      ],
    );
  }
}
