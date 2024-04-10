// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class ToolsCard extends StatelessWidget {
  String title;
  String imageurl;
  ToolsCard({super.key, required this.title, required this.imageurl});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 180,
      height: 180,
      child: Card(
        color: Colors.white,
        elevation: 5,
        //shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(40)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Image.asset(
                imageurl,
                height: 60,
              ),
              const SizedBox(height: 10),
              Text(title, style: const TextStyle(fontSize: 16)),
            ],
          ),
        ),
      ),
    );
  }
}
