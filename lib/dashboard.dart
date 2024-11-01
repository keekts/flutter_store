import 'package:flutter/material.dart';
import 'package:flutter_store/home.dart';
import 'package:flutter_store/login.dart';
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
    await SharedPreferences.getInstance().then((value) => value.remove('token'));
    // back to home
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Home()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => logout(),
          ),
        ],
      ),
      body: Center(
        child: Text('Dashboard'),
      ),
    );
  }
}
