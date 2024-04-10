import 'package:femalert2/base/cards/card.with.background.image.dart';
import 'package:femalert2/base/cards/tools.card.dart';
import 'package:femalert2/screens/tools/defensetools.dart';
import 'package:femalert2/screens/tools/safetytips.dart';
import 'package:femalert2/screens/tools/youtube.dart';
import 'package:flutter/material.dart';

class ToolsPage extends StatefulWidget {
  const ToolsPage();
  



  @override
  State<ToolsPage> createState() => _ToolsPageState();
}

class _ToolsPageState extends State<ToolsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(15.0),
              child: CardWithBackgroundImage(
                description: " ",
                imagePath: "assets/images/banner.png",
                title: '',
              ),
            ),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              // crossAxisSpacing: 4.0,
              // mainAxisSpacing: 8.0,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 50,
                    width: 50,
                    child: GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => YouTubeVideosScreen()),
        );
      },
      child: ToolsCard(
        imageurl: 'assets/images/Courage.png',
        title: "Self Defense",
      ),
    ),
 ),
),
                Padding(
 padding: const EdgeInsets.all(8.0),
 child: SizedBox(
    height: 50,
    width: 50,
    child: GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SafetyTipsPage()),
        );
      },
      child: ToolsCard(
        imageurl: 'assets/images/Pin.png',
        title: "Safety Tips",
      ),
    ),
 ),
),
                Padding(
  padding: const EdgeInsets.all(8.0),
  child: GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => DefenseToolsPage()),
      );
    },
    child: SizedBox(
      height: 50,
      width: 50,
      child: ToolsCard(
        imageurl: 'assets/images/Group 75.png',
        title: "Defense Tools",
      ),
    ),
  ),
),

                Padding(
  padding: const EdgeInsets.all(8.0),
  child: GestureDetector(
    onTap: () {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Upgrade to Premium"),
            content: const Text("Upgrade to premium to use this feature"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("OK"),
              ),
            ],
          );
        },
      );
    },
    child: SizedBox(
      height: 50,
      width: 50,
      child: ToolsCard(
        imageurl: 'assets/images/scan_taxi_icon.png',
        title: "Scan Taxi",
      ),
    ),
  ),
),

                Padding(
  padding: const EdgeInsets.all(8.0),
  child: GestureDetector(
    onTap: () {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Premium"),
            content: const Text("Upgrade to premium to use this feature"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("OK"),
              ),
            ],
          );
        },
      );
    },
    child: SizedBox(
      height: 50,
      width: 50,
      child: ToolsCard(
        imageurl: 'assets/images/Siren.png',
        title: "Emergency",
      ),
    ),
  ),
),

                Padding(
  padding: const EdgeInsets.all(8.0),
  child: GestureDetector(
    onTap: () {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Upgrade to Premium"),
            content: const Text("Upgrade to premium to use this feature"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("OK"),
              ),
            ],
          );
        },
      );
    },
    child: SizedBox(
      height: 50,
      width: 50,
      child: ToolsCard(
        imageurl: 'assets/images/Wearable Technology.png',
        title: "Link Watch",
      ),
    ),
  ),
),

              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget getWidget(Color color, IconData icon) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 50,
        width: 50,
        color: Colors.white,
        child: Icon(
          icon,
          size: 80,
        ),
      ),
    );
  }
}
