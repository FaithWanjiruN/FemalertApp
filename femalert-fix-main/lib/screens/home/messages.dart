import 'package:flutter/material.dart';
import 'package:location/location.dart'; // Import location package for GPS

class SendMessagePage extends StatefulWidget {
  @override
  _SendMessagePageState createState() => _SendMessagePageState();
}

class _SendMessagePageState extends State<SendMessagePage> {
  LocationData? _currentLocation;

  @override
  void initState() {
    super.initState();
    _getLocation();
  }

  Future<void> _getLocation() async {
    Location location = Location();
    LocationData currentLocation;
    try {
      currentLocation = await location.getLocation();
      setState(() {
        _currentLocation = currentLocation;
      });
    } catch (e) {
      print("Failed to get location: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Send Message'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                // Implement logic to choose contact
                // and send message with current location
                // and a customized SMS message
              },
              child: Text('Send Location'),
            ),
            SizedBox(height: 20),
            if (_currentLocation != null)
              Text(
                'Latitude: ${_currentLocation!.latitude}\n'
                'Longitude: ${_currentLocation!.longitude}',
                textAlign: TextAlign.center,
              ),
            if (_currentLocation == null)
              Text(
                'Location not available',
                textAlign: TextAlign.center,
              ),
          ],
        ),
      ),
    );
  }
}
