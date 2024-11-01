// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_store/services/rest_api.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'dashboard.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Variables for the login form
  late String _email, _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Form(
        key: _formKey,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  width: 150,
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                  ),
                  initialValue: 'mor_2314',
                  onSaved: (value) => _email = value!,
                ),
                SizedBox(height: 10),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                  ),
                  initialValue: '83r5^_',
                  onSaved: (value) => _password = value!,
                  obscureText: true,
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  child: Text('Login'),
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      // print('Email: $_email, Password: $_password');
                      try {
                        // Call API login
                        var response = await CallAPI().loginAPI(
                            {'username': _email, 'password': _password});

                        var body = jsonDecode(response.body);
                        print(body);

                        // Create shared preferences
                        SharedPreferences prefs = await SharedPreferences
                            .getInstance(); //Create Object of SharedPreferences

                        // Save Token to Shared Preferences
                        prefs.setString('token', body['token']);

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Login successful!'),
                            backgroundColor: Colors.green,
                            behavior: SnackBarBehavior.floating,
                          ),
                        );

                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Dashboard()),
                        );
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Login failed!'),
                            backgroundColor: Colors.red,
                            behavior: SnackBarBehavior.floating,
                          ),
                        );
                      }
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
