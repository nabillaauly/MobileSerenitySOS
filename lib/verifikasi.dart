import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mobile/api/services.dart';
import 'package:mobile/login.dart';

class Verifikasiemail extends StatelessWidget {
  const Verifikasiemail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 254, 255, 255),
      ),
      home: Scaffold(
        body: VerifikasiEmailScreen(),
      ),
    );
  }
}

class VerifikasiEmailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 50),
          VerifikasiEmailForm(),
        ],
      ),
    );
  }
}

class VerifikasiEmailForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController verifikasiController = TextEditingController();

    Future<void> verifikasiUser(BuildContext context) async {
      final String token = verifikasiController
          .text; // Assuming the verification code is the token

      try {
        final response = await http.get(
          Uri.parse(AppServices.getAuthEndpoint()),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization':
                'Bearer $token', // Sending the token as a Bearer token
          },
        );

        if (response.statusCode == 200) {
          showDialog(
            context: context,
            builder: (_) => AlertDialog(
              title: const Text('Success'),
              content: const Text('Verifikasi sukses'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  },
                  child: const Text('OK'),
                ),
              ],
            ),
          );
        } else {
          final Map<String, dynamic> responseData = json.decode(response.body);
          showDialog(
            context: context,
            builder: (_) => AlertDialog(
              title: const Text('Error'),
              content: Text(responseData['message']),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('OK'),
                ),
              ],
            ),
          );
        }
      } catch (e) {
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: const Text('Error'),
            content: const Text('Terjadi kesalahan saat melakukan verifikasi.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          ),
        );
      }
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/checkemail.jpg',
            width: 255,
            height: 250,
          ),
          const SizedBox(height: 20),
          const Text(
            'Verifikasi Email',
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Colors.black, // Change text color to black
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'Please enter your verification code.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14),
          ),
          const SizedBox(height: 20),
          TextField(
            controller: verifikasiController,
            decoration: InputDecoration(
              labelText: 'Enter verification code',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => verifikasiUser(context),
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF6C96C5), // Change button color to blue
            ),
            child: const Text('Verifikasi'),
          ),
        ],
      ),
    );
  }
}
