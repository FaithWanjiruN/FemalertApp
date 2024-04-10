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
        title: const Text('Profile'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(profileImageUrl),
            ),
            const SizedBox(height: 20),
            Text(
              username,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                showDialog(
                 context: context,
                 builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Edit Profile'),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          TextFormField(
                            initialValue: username,
                            decoration: const InputDecoration(labelText: 'Username'),
                            // Add logic to update username
                          ),
                          // Add image picker for profile picture
                        ],
                      ),
                      actions: <Widget>[
                        TextButton(
                          child: const Text('Cancel'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        TextButton(
                          child: const Text('Save'),
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
              child: const Text('Edit Profile'),
            ),
            const SizedBox(height: 20),
            // Wrap the button in a Container with a border
            Container(
              width: screenWidth, // Set the width to the screen width
              decoration: const BoxDecoration(
              ),
              child: ElevatedButton(
                onPressed: () {
                 Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => contacts()),
                 );
                },
                child: const Text('Add Contacts'),
                style: ElevatedButton.styleFrom(
                 foregroundColor: Colors.black, backgroundColor: const Color.fromARGB(255, 232, 184, 241), // Splash color
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Wrap the button in a Container with a border
            Container(
              width: screenWidth, // Set the width to the screen width
              decoration: const BoxDecoration(
              ),
              child: ElevatedButton(
                onPressed: () {
                 // Perform log out and navigate to the login page
                 Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginScreen()),
                 );
                },
                child: const Text('Log Out'),
                style: ElevatedButton.styleFrom(
                 foregroundColor: Colors.black, backgroundColor:  const Color.fromARGB(255, 232, 184, 241),  // Splash color
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Wrap the button in a Container with a border
            Container(
              width: screenWidth, // Set the width to the screen width
              decoration: const BoxDecoration(
              ),
              child: ElevatedButton(
                onPressed: () {
                 // Placeholder for Settings
                },
                child: const Text('Settings'),
                style: ElevatedButton.styleFrom(
                 foregroundColor: Colors.black, backgroundColor: const Color.fromARGB(255, 232, 184, 241), // Splash color
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Wrap the button in a Container with a border
            Container(
              width: screenWidth, // Set the width to the screen width
              decoration: const BoxDecoration(
              ),
              child: ElevatedButton(
                onPressed: () {
                 // Placeholder for Support
                },
                child: const Text('Support'),
                style: ElevatedButton.styleFrom(
                 foregroundColor: Colors.black, backgroundColor:  const Color.fromARGB(255, 232, 184, 241),  // Splash color
                ),
              ),
            ),
          ],
        ),
      ),
    );
 }
}
