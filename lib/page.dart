import 'package:flutter/material.dart';
import 'package:mobile/login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PageSatu extends StatefulWidget {
  const PageSatu({Key? key}) : super(key: key);

  @override
  State<PageSatu> createState() => _PageSatuState();
}

class _PageSatuState extends State<PageSatu> {
  final controller = PageController();
  bool isLastPage = false;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Widget buildPage({
    required Color color,
    required String urlImage,
    required String title,
    required String subtitle,
    double? imageWidth,
    double? imageHeight,
  }) =>
      Container(
        color: color,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              urlImage,
              fit: BoxFit.cover,
              width: imageWidth,
              height: imageHeight,
            ),
            const SizedBox(height: 64),
            Text(
              title,
              style: const TextStyle(
                color: Color.fromARGB(255, 85, 117, 165),
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                subtitle,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.black),
              ),
            )
          ],
        ),
      );

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Container(
          padding: const EdgeInsets.only(bottom: 80),
          child: PageView(
            controller: controller,
            onPageChanged: (index) {
              setState(() => isLastPage = index == 2);
            },
            children: [
              buildPage(
                color: Colors.white,
                urlImage: 'assets/images/pagesatu.jpg',
                title: 'EDUKASI',
                subtitle:
                    'Sebagai media edukasi untuk pengetahuan masyarakat terhadap hand signal for help',
                imageWidth: 300, // ubah sesuai kebutuhan
                imageHeight: 400, // ubah sesuai kebutuhan
              ),
              buildPage(
                color: Colors.white,
                urlImage: 'assets/images/pagedua.png',
                title: 'INFORMASI',
                subtitle:
                    'Sebagai media informasi untuk pengetahuan masyarakat tentang hand signal for helpe',
                imageWidth: 300, // ubah sesuai kebutuhan
                imageHeight: 400, // ubah sesuai kebutuhan
              ),
              buildPage(
                color: Colors.white,
                urlImage: 'assets/images/pagetiga.jpg',
                title: 'Deteksi',
                subtitle:
                    'Mengcapture Gambar dengan memanfaatkan AI dan menghasilkan probability yang tepat',
                imageWidth: 550, // ubah sesuai kebutuhan
                imageHeight: 400, // ubah sesuai kebutuhan
              ),
            ],
          ),
        ),
        bottomSheet: isLastPage
            ? TextButton(
                child: const Text(
                  'Get Started',
                  style: TextStyle(fontSize: 24),
                ),
                onPressed: () async {
                  final prefs = await SharedPreferences.getInstance();
                  prefs.setBool('showHome', true);

                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                },
              )
            : Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                height: 80,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      child: const Text('SKIP'),
                      onPressed: () => controller.jumpToPage(2),
                    ),
                    Center(
                      child: SmoothPageIndicator(
                        controller: controller,
                        count: 3,
                        effect: const WormEffect(
                          spacing: 16,
                          dotColor: Colors.black26,
                          activeDotColor: Color.fromARGB(255, 85, 117, 165),
                        ),
                        onDotClicked: (index) => controller.animateToPage(
                          index,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeIn,
                        ),
                      ),
                    ),
                    TextButton(
                      child: const Text('NEXT'),
                      onPressed: () => controller.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeOut,
                      ),
                    ),
                  ],
                ),
              ),
      );
}
