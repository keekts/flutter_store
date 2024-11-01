// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_store/bottompage/home_screen.dart';
import 'package:flutter_store/bottompage/notification_screen.dart';
import 'package:flutter_store/bottompage/profile_screen.dart';
import 'package:flutter_store/bottompage/report_screen.dart';
import 'package:flutter_store/bottompage/setting_screen.dart';
import 'package:flutter_store/home.dart';
import 'package:flutter_store/info.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  // Create a function to  logout
  void logout() async {
    // Remove token from local storage
    await SharedPreferences.getInstance()
        .then((value) => value.remove('token'));
    // back to home
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const Home()));
  }

  // Create variable store Title of screen
  String _title = 'Flutter Store';

  // Create variable store index of screen
  late int _currentIndex = 0;

  // Create List of screen
  final List<Widget> _children = [
    HomeScreen(),
    ReportScreen(),
    NotificationScreen(),
    SettingScreen(),
    ProfileScreen(),
  ];

  // Create a function to change index of screen
  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
      switch (index) {
        case 0:
          _title = 'Home';
          break;
        case 1:
          _title = 'Report';
          break;
        case 2:
          _title = 'Notification';
          break;
        case 3:
          _title = 'Setting';
          break;
        case 4:
          _title = 'Profile';
          break;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _currentIndex = 0;
    _title = 'Flutter Store';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => logout(),
          ),
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: [
            ListView(
              shrinkWrap: true,
              children: [
                UserAccountsDrawerHeader(
                  accountName: Text('kee'),
                  accountEmail: Text('Kitthisack'),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage:
                        Image.asset('assets/images/logo.png').image,
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.info),
                  title: const Text('Infomation'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Info(),
                      ),
                    );
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.person),
                  title: const Text('About'),
                  onTap: () {},
                ),
                ListTile(
                  leading: const Icon(Icons.email),
                  title: const Text('Contact'),
                  onTap: () {},
                ),
              ],
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ListTile(
                    leading: const Icon(Icons.logout),
                    title: const Text('Logout'),
                    onTap: () => logout(),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: const Text(
                      'Version 1.0.0',
                      style: TextStyle(color: Colors.black87),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      body: Center(
        child: _children[_currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) => {onTabTapped(value)},
        // backgroundColor: Colors.teal,
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.teal,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.show_chart_outlined),
            label: 'Report',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_outlined),
            label: 'Notification',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            label: 'Setting',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outlined),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
