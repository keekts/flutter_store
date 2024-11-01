// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_store/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'dashboard.dart';
import 'login.dart';

var initRoute;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Call SharedPreferences
  SharedPreferences prefs = await SharedPreferences.getInstance();

  // Check token in local storage
  if (prefs.getString('token') != null) {
    initRoute = Dashboard();
  } else {
    initRoute = const Home();
  }



  

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.teal, useMaterial3: false),
      home: initRoute,
    );
  }
}
