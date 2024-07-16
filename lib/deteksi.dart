import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class Deteksi extends StatefulWidget {
  @override
  _DeteksiViewState createState() => _DeteksiViewState();
}

class _DeteksiViewState extends State<Deteksi> {
  final String url ='http://194.31.53.102:21094/realtime'; // Replace with your Flask server URL

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Deteksi Video'),
        backgroundColor: Color(0xFF5079A9),
      ),
      body: InAppWebView(
        initialUrlRequest: URLRequest(
          url: WebUri(url), // Gunakan WebUri sebagai pengganti Uri
        ),
      ),
    );
  }
}