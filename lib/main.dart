import 'package:flutter/material.dart';
import 'package:mobile/camera.dart';
import 'package:mobile/checkemail.dart';
import 'package:mobile/deteksi.dart';
import 'package:mobile/forgot.dart';
import 'package:mobile/forgotpassword.dart';
import 'package:mobile/halamanutama.dart';
import 'package:mobile/kontak.dart';
import 'package:mobile/login.dart';
import 'package:mobile/page.dart';
import 'package:mobile/panduan.dart';
import 'package:mobile/profil.dart';
import 'package:mobile/register.dart';
import 'package:mobile/splash.dart';
import 'package:mobile/verifikasi.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '',
      initialRoute: '/',
      routes: {
        '/': (context) => Splash(),
        '/pagesatu': (context) => const PageSatu(),
        '/register': (context) => RegisterApp(),
        '/forgotpassword': (context) => ForgotPassword(),
        '/forgot': (context) => forgot(),
        '/login': (context) => LoginScreen(),
        '/halamanmenu': (context) => halamanutama(),
        '/mail': (context) => checkemail(),
        '/kontak': (context) => KontakPage(),
        '/panduan': (context) => PanduanApp(),
        '/verifikasi': (context) => Verifikasiemail(),
        '/camera': (context) => YoloVideo(),
        '/profil': (context) => ProfileScreen(),
        '/deteksi': (context) => Deteksi()
      },
    );
  }
}
