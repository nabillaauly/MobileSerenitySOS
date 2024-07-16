import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Verifikasi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Verification'),
      ),
      body: VerificationBody(),
    );
  }
}

class VerificationBody extends StatefulWidget {
  @override
  _VerificationBodyState createState() => _VerificationBodyState();
}

class _VerificationBodyState extends State<VerificationBody> {
  TextEditingController jwtController = TextEditingController();
  bool isVerifying = false;

  Future<void> verifyUser() async {
    setState(() {
      isVerifying = true;
    });

    final String apiUrl = 'http://192.168.205.28:5000/bearer-auth';
    final String jwtToken = jwtController.text;

    try {
      final response = await http.get(
        Uri.parse(apiUrl),
        headers: {
          'Authorization': 'Bearer $jwtToken',
        },
      );

      if (response.statusCode == 200) {
        // User verified successfully, navigate to next screen
        Navigator.pushReplacementNamed(context, '/login');
      } else {
        // Handle error response
        print('Failed to verify user: ${response.body}');
      }
    } catch (e) {
      // Handle network or other errors
      print('Error verifying user: $e');
    }

    setState(() {
      isVerifying = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: jwtController,
              decoration: InputDecoration(
                labelText: 'Enter JWT Token',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: isVerifying ? null : verifyUser,
            child: isVerifying ? CircularProgressIndicator() : Text('Verify User'),
          ),
        ],
      ),
    );
  }
}
