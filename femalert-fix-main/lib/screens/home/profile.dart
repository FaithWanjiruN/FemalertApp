import 'package:flutter/material.dart';
import '../auth/login/login.dart'; // Import the LoginPage and ContactsPage if not already imported
import '../home/contacts.dart';

class ProfilePage extends StatelessWidget {
  final String username; // Assuming you pass the username as a parameter
  final String profileImageUrl; // Assuming you pass the profile image URL as a parameter

  const ProfilePage({required this.username, required this.profileImageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 50,
               backgroundImage: AssetImage(profileImageUrl),
            ),
            SizedBox(height: 20),
            Text(
              username,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => contacts()),
                );
              },
              child: Text('Add Contacts'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Perform log out and navigate to the login page
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
              child: Text('Log Out'),
            ),
          ],
        ),
      ),
    );
  }
}
