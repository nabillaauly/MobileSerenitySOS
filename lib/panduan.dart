import 'package:flutter/material.dart';
import 'package:mobile/halamanutama.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const PanduanApp());
}

class PanduanApp extends StatelessWidget {
  const PanduanApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 18, 32, 47),
      ),
      home: const Scaffold(
        body: PanduanList(),
      ),
    );
  }
}

class PanduanList extends StatelessWidget {
  const PanduanList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        Panduan(),
      ],
    );
  }
}

class Panduan extends StatelessWidget {
  const Panduan({super.key});

  Future<void> _launchYoutubeURL() async {
    const url = 'https://www.youtube.com/watch?v=dQw4w9WgXcQ'; // Replace with your YouTube URL
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 393,
          height: 852,
          decoration: const BoxDecoration(color: Colors.white),
          child: Stack(
            children: [
              Positioned(
                left: 18,
                top: 200,
                child: SizedBox(
                  width: 247,
                  height: 44,
                  child: Opacity(
                    opacity: 0.70,
                    child: Text(
                      'Panduan',
                      style: TextStyle(
                        color: Color(0xFF5C5959),
                        fontSize: 25,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 19,
                top: 714,
                child: Container(
                  width: 738,
                  height: 144,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 9,
                        child: Container(
                          width: 355,
                          height: 101,
                          decoration: ShapeDecoration(
                            color: Color(0xFF5079A9),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 9,
                        top: 34,
                        child: SizedBox(
                          width: 729,
                          height: 110,
                          child: Text(
                            'Untuk mengetahui panduan atau bagaimana\npola atau cara signal help dapat di simak pada \nvideo berikut......',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 271,
                        top: 0,
                        child: GestureDetector(
                          onTap: _launchYoutubeURL,
                          child: Container(
                            width: 84,
                            height: 120,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/images/yt.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 9,
                top: 53,
                child: Container(
                  width: 374,
                  height: 136,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 374,
                          height: 136,
                          decoration: ShapeDecoration(
                            color: Color(0xB26C96C5),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 17,
                        top: 7,
                        child: SizedBox(
                          width: 277,
                          height: 42,
                          child: Text(
                            'Selamat Datang !\n',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 16,
                        top: 83,
                        child: SizedBox(
                          width: 325,
                          height: 29,
                          child: Text(
                            'Di Aplikasi Hand Signal For Help !',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 19,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 20,
                        top: 44,
                        child: SizedBox(
                          width: 325,
                          height: 21,
                          child: Text(
                            'Nabilla Auly Zahra',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 19,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 16,
                top: 6,
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back),
                      color: Colors.black,
                      onPressed: () async {
                  final prefs = await SharedPreferences.getInstance();
                  prefs.setBool('showHome', true);

                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => halamanutama()),
                  );
                },
                    ),
                    const Text(
                      'Home',
                      style: TextStyle(
                        color: Color(0xFF79777C),
                        fontSize: 16,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                left: 20,
                top: 474,
                child: Container(
                  width: 342,
                  height: 110,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 342,
                          height: 110,
                          decoration: ShapeDecoration(
                            color: Color(0xFF6C96C5),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(35),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 17,
                        top: 23,
                        child: SizedBox(
                          width: 213,
                          height: 17,
                          child: Text(
                            'Gunakan Aplikasi atau Perangkat Darurat',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 8,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 22,
                        top: 40,
                        child: SizedBox(
                          width: 214,
                          height: 53,
                          child: Text(
                            'Jika Anda memiliki akses ke perangkat cerdas atau aplikasi seperti "SerenitySOS" gunakan fitur-fitur darurat untuk mengirimkan sinyal bantuan dan memberi tahu orang lain tentang keberadaan Anda.',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 8,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 243,
                        top: 2,
                        child: Container(
                          width: 80,
                          height: 94,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/p3.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 17,
                top: 359,
                child: Container(
                  width: 342,
                  height: 110,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 342,
                          height: 110,
                          decoration: ShapeDecoration(
                            color: Color(0xFF6C96C5),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(35),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 17,
                        top: 23,
                        child: SizedBox(
                          width: 176,
                          height: 17,
                          child: Text(
                            'Evaluasi Situasi',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 8,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 22,
                        top: 40,
                        child: SizedBox(
                          width: 214,
                          height: 53,
                          child: Text(
                            'Pertimbangkan situasi dengan cermat. Identifikasi risiko dan ancaman yang mungkin ada di sekitar Anda, serta sumber bantuan yang tersedia.',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 8,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 242,
                        top: 3,
                        child: Container(
                          width: 92,
                          height: 96,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/p2.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 19,
                top: 589,
                child: Container(
                  width: 342,
                  height: 110,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 342,
                          height: 110,
                          decoration: ShapeDecoration(
                            color: Color(0xFF6C96C5),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(35),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 17,
                        top: 23,
                        child: SizedBox(
                          width: 176,
                          height: 17,
                          child: Text(
                            'Hubungi Pihak Berwenang',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 8,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 22,
                        top: 40,
                        child: SizedBox(
                          width: 214,
                          height: 53,
                          child: Text(
                            'Jika situasi memungkinkan, hubungi pihak berwenang setempat atau layanan darurat seperti polisi, pemadam kebakaran, atau layanan medis darurat.',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 8,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 234,
                        top: 1,
                        child: Container(
                          width: 106,
                          height: 84,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/p4.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 18,
                top: 239,
                child: Container(
                  width: 342,
                  height: 115,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 5,
                        child: Container(
                          width: 342,
                          height: 110,
                          decoration: ShapeDecoration(
                            color: Color(0xFF6C96C5),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(35),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 22,
                        top: 45,
                        child: SizedBox(
                          width: 214,
                          height: 53,
                          child: Text(
                            'Di tengah situasi darurat, sangat penting untuk tetap tenang. Cobalah untuk mengendalikan napas Anda dan berfokus pada langkah-langkah selanjutnya dengan jernih.',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 8,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 234,
                        top: 0,
                        child: Container(
                          width: 101,
                          height: 107,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/p1.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 17,
                        top: 28,
                        child: SizedBox(
                          width: 176,
                          height: 17,
                          child: Text(
                            'Pertahankan Keamanan',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 8,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
