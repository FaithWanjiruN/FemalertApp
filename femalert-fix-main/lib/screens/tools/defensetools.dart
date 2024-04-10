import 'package:flutter/material.dart';

class DefenseToolsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Defense Tools'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 0),
            const Text(
              'Defense Tools Information',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Here is some information about different defense tools and how they can be used to enhance personal safety and security.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  _buildDefenseToolItem(
                    'Pepper Spray',
                    'Pepper spray is a self-defense weapon that can be used to incapacitate an attacker by causing temporary blindness and irritation to the eyes and skin.',
                    Icons.sports_bar,
                  ),
                  _buildDefenseToolItem(
                    'Personal Alarm',
                    'A personal alarm emits a loud sound when activated, which can attract attention and scare off potential attackers.',
                    Icons.alarm,
                  ),
                  _buildDefenseToolItem(
                    'Taser',
                    'Self-defense training teaches techniques and strategies to protect oneself against physical attacks. It can include martial arts, self-defense tactics, and awareness training.',
                    Icons.fitness_center,
                 ),
                 _buildDefenseToolItem(
                    'Pocket Knife',
                    'Security gadgets, such as pocket knnives, can enhance personal safety and security by deterring potential threats and providing peace of mind.',
                    Icons.security,
                 ),
                  // Add more defense tool items as needed
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDefenseToolItem(String title, String description, IconData icon) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Icon(icon, color: Colors.blue),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(description),
      ),
    );
  }
}
