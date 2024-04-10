import 'package:flutter/material.dart';
import '../auth/login/login.dart'; // Import the LoginPage and ContactsPage if not already imported
import '../home/contacts.dart';

class ProfilePage extends StatelessWidget {
 final String username; // Assuming you pass the username as a parameter
 final String profileImageUrl; // Assuming you pass the profile image URL as a parameter

 const ProfilePage({required this.username, required this.profileImageUrl});

 @override
 Widget build(BuildContext context) {
    // Get the screen width
    double screenWidth = MediaQuery.of(context).size.width;

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
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                showDialog(
                 context: context,
                 builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Edit Profile'),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          TextFormField(
                            initialValue: username,
                            decoration: InputDecoration(labelText: 'Username'),
                            // Add logic to update username
                          ),
                          // Add image picker for profile picture
                        ],
                      ),
                      actions: <Widget>[
                        TextButton(
                          child: Text('Cancel'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        TextButton(
                          child: Text('Save'),
                          onPressed: () {
                            // Add logic to save changes
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                 },
                );
              },
              child: Text('Edit Profile'),
            ),
            SizedBox(height: 20),
            // Wrap the button in a Container with a border
            Container(
              width: screenWidth, // Set the width to the screen width
              decoration: BoxDecoration(
              ),
              child: ElevatedButton(
                onPressed: () {
                 Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => contacts()),
                 );
                },
                child: Text('Add Contacts'),
                style: ElevatedButton.styleFrom(
                 foregroundColor: Colors.black, backgroundColor: Color.fromARGB(255, 232, 184, 241), // Splash color
                ),
              ),
            ),
            SizedBox(height: 20),
            // Wrap the button in a Container with a border
            Container(
              width: screenWidth, // Set the width to the screen width
              decoration: BoxDecoration(
              ),
              child: ElevatedButton(
                onPressed: () {
                 // Perform log out and navigate to the login page
                 Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                 );
                },
                child: Text('Log Out'),
                style: ElevatedButton.styleFrom(
                 foregroundColor: Colors.black, backgroundColor:  Color.fromARGB(255, 232, 184, 241),  // Splash color
                ),
              ),
            ),
            SizedBox(height: 20),
            // Wrap the button in a Container with a border
            Container(
              width: screenWidth, // Set the width to the screen width
              decoration: BoxDecoration(
              ),
              child: ElevatedButton(
                onPressed: () {
                 // Placeholder for Settings
                },
                child: Text('Settings'),
                style: ElevatedButton.styleFrom(
                 foregroundColor: Colors.black, backgroundColor: Color.fromARGB(255, 232, 184, 241), // Splash color
                ),
              ),
            ),
            SizedBox(height: 20),
            // Wrap the button in a Container with a border
            Container(
              width: screenWidth, // Set the width to the screen width
              decoration: BoxDecoration(
              ),
              child: ElevatedButton(
                onPressed: () {
                 // Placeholder for Support
                },
                child: Text('Support'),
                style: ElevatedButton.styleFrom(
                 foregroundColor: Colors.black, backgroundColor:  Color.fromARGB(255, 232, 184, 241),  // Splash color
                ),
              ),
            ),
          ],
        ),
      ),
    );
 }
}
