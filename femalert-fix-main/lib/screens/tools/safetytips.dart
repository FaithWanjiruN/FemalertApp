import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart'; // Import FontAwesome

class SafetyTipsPage extends StatelessWidget {
 @override
 Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Safety Tips'),
      ),
      body: ListView.builder(
        itemCount: safetyTips.length,
        itemBuilder: (context, index) {
          return ListTile(
            // ignore: deprecated_member_use
            leading: const Icon(FontAwesomeIcons.shieldAlt, color: Colors.blue), // Example icon
            title: Text(safetyTips[index]),
          );
        },
      ),
    );
 }
}

List<String> safetyTips = [
 'Tip 1: Always carry a phone with .',
 'Tip 2: Be aware of your surroundings.',
 'Tip 3: Stay in well-lit areas.',
 'Tip 4: Avoid walking alone at night.',
 'Tip 5: Trust your instincts.',
 'Tip 6: Keep your personal belongings secure.',
 'Tip 7: Know the emergency numbers.',
 'Tip 8: Stay informed about local safety alerts.',
 'Tip 9: Consider carrying a personal alarm.',
 'Tip 10: Be prepared to defend yourself if necessary.',
];
