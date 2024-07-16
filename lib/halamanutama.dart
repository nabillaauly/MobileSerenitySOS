import 'package:flutter/material.dart';
import 'package:mobile/deteksi.dart';
import 'package:mobile/kontak.dart';
import 'package:mobile/panduan.dart';
import 'package:mobile/profil.dart';


class halamanutama extends StatelessWidget {
  const halamanutama({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 18, 32, 47),
      ),
      home: Scaffold(
        body: ListView(
          children: [
            Container(
              width: 393,
              height: 852,
              decoration: BoxDecoration(color: Color(0xFF5079A9)),
              child: Stack(
                children: [
                  Positioned(
                    left: 99,
                    top: 828,
                    child: Container(
                      width: 212,
                      height: 10,
                      decoration: ShapeDecoration(
                        color: Color(0xFFD9D9D9),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 120,
                    top: 260,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => PanduanApp()),
                        );
                      },
                      child: Container(
                        width: 157,
                        height: 65,
                        decoration: BoxDecoration(
                          color: Color(0xFFB2CEEC),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.book,
                              size: 35,
                              color: Colors.black,
                            ),
                            SizedBox(width: 8),
                            Text(
                              'Panduan',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 118,
                    top: 361,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Deteksi()),
                        );
                      },
                      child: Container(
                        width: 157,
                        height: 76,
                        decoration: BoxDecoration(
                          color: Color(0xFFB2CEEC),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.videocam,
                              size: 35,
                              color: Colors.black,
                            ),
                            SizedBox(width: 8),
                            Text(
                              'Deteksi',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 118,
                    top: 468,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => KontakPage()),
                        );
                      },
                      child: Container(
                        width: 157,
                        height: 65,
                        decoration: BoxDecoration(
                          color: Color(0xFFB2CEEC),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.contact_phone,
                              size: 35,
                              color: Colors.black,
                            ),
                            SizedBox(width: 8),
                            Text(
                              'Kontak',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 118,
                    top: 575,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ProfileScreen()),
                        );
                      },
                      child: Container(
                        width: 157,
                        height: 65,
                        decoration: BoxDecoration(
                          color: Color(0xFFB2CEEC),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.person,
                              size: 35,
                              color: Colors.black,
                            ),
                            SizedBox(width: 8),
                            Text(
                              'Profil',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
