import 'package:flutter/material.dart';

class KontakPage extends StatefulWidget {
  @override
  _KontakPageState createState() => _KontakPageState();
}

class _KontakPageState extends State<KontakPage> {
  TextEditingController searchController = TextEditingController();
  List<KontakModel> kontakList = [
    KontakModel(
      title: 'Semarang',
      content:
          'Alamat Daerah : Polrestabes Semarang\nAlamat Kepolisian : Jalan Dr.Soetomo No.19 Semarang\nNomor HP: 024-8444444',
    ),
    KontakModel(
      title: 'Semarang',
      content:
          'Alamat Daerah : Polres Semarang\nAlamat Kepolisian : Jalan Diponegoro,Jawa Tengah\nNomor HP: 024-6925666',
    ),
    KontakModel(
      title: 'Boyolali',
      content:
          'Alamat Daerah : Polres Boyolali\nAlamat Kepolisian : Jalan Solo-Semarang km 24\nNomor HP: 0276-321110',
    ),
    KontakModel(
      title: 'Klaten',
      content:
          'Alamat Daerah : Polres Klaten\nAlamat Kepolisian : Jalan Diponegoro No. 27 Klaten\nNomor HP: 0272-321234',
    ),
    KontakModel(
      title: 'Karanganyar',
      content:
          'Alamat Daerah : Polres Karanganyar\nAlamat Kepolisian : Jalan Lawu No. 3 Karanganyar \nNomor HP: 0271-495150',
    ),
    KontakModel(
      title: 'Sukoharjo',
      content:
          'Alamat Daerah : Polres Sukoharjo\nAlamat Kepolisian : Jalan Jaksa Agung R. Suprapto \nNomor HP: 0271-593317',
    ),
  ];

  List<KontakModel> filteredKontakList = [];

  @override
  void initState() {
    filteredKontakList.addAll(kontakList);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Color.fromARGB(255, 255, 255, 255),
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black), // Ubah warna ikon kembali ke hitam
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: Text('Kontak', style: TextStyle(color: Colors.black)),
        ),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(16),
              child: TextField(
                controller: searchController,
                onChanged: (value) {
                  filterSearchResults(value);
                },
                style: TextStyle(color: Colors.black), // Set text color for input text
                decoration: InputDecoration(
                  hintText: 'Cari berdasarkan nama, alamat, atau nomor telepon',
                  hintStyle: TextStyle(color: Colors.grey), // Set text color for hint text
                  prefixIcon: Icon(Icons.search, color: const Color.fromARGB(255, 0, 0, 0)),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: const Color.fromARGB(255, 0, 0, 0)), // warna garis tepi
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Color(0xFF6C96C5)), // warna garis tepi saat aktif
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: filteredKontakList.length,
                itemBuilder: (context, index) {
                  return _buildKontakCard(
                    context,
                    filteredKontakList[index].title,
                    filteredKontakList[index].content,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildKontakCard(BuildContext context, String title, String content) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xFF6C96C5),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Color(0x3F000000),
            blurRadius: 4,
            offset: Offset(0, 4),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.white, // Mengatur warna teks judul menjadi putih
              fontSize: 18,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 8),
          Text(
            content,
            style: TextStyle(
              color: Colors.white, // Mengatur warna teks konten menjadi putih
              fontSize: 12,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }

  void filterSearchResults(String query) {
    List<KontakModel> dummySearchList = [];
    dummySearchList.addAll(kontakList);
    if (query.isNotEmpty) {
      List<KontakModel> dummyListData = [];
      dummySearchList.forEach((item) {
        if (item.title.toLowerCase().contains(query.toLowerCase()) ||
            item.content.toLowerCase().contains(query.toLowerCase())) {
          dummyListData.add(item);
        }
      });
      setState(() {
        filteredKontakList.clear();
        filteredKontakList.addAll(dummyListData);
      });
      return;
    } else {
      setState(() {
        filteredKontakList.clear();
        filteredKontakList.addAll(kontakList);
      });
    }
  }
}

class KontakModel {
  final String title;
  final String content;

  KontakModel({required this.title, required this.content});
}
