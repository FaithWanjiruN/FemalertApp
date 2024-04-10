import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class MapPage extends StatefulWidget {
 const MapPage({super.key});

 @override
 State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
 @override
 Widget build(BuildContext context) {
    return InAppWebView(
      initialUrlRequest: URLRequest(
        url: Uri.parse('https://www.google.com/maps'),
      ),
    );
 }
}
