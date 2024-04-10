import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YouTubeVideosScreen extends StatefulWidget {
  const YouTubeVideosScreen({super.key});

 @override
 _YouTubeVideosScreenState createState() => _YouTubeVideosScreenState();
}

class _YouTubeVideosScreenState extends State<YouTubeVideosScreen> {
 YoutubePlayerController _controller1 = YoutubePlayerController(
    initialVideoId: 'SN4_EOlkqhF_e4BM', // Replace with your first video ID
    flags: const YoutubePlayerFlags(
      autoPlay: true,
      mute: false,
    ),
 );

 YoutubePlayerController _controller2 = YoutubePlayerController(
    initialVideoId: 'cxKP6FKNoy7Bajut', // Replace with your second video ID
    flags: const YoutubePlayerFlags(
      autoPlay: true,
      mute: false,
    ),
 );

 @override
 void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    super.dispose();
 }

 @override
 Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Self-defense Videos'),
      ),
      body: Column(
        children: [
          const Text('Self-Defense Techniques:',
          style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold)),
          
          YoutubePlayer(
            controller: _controller1,
            showVideoProgressIndicator: true,
          ),
         const Text('5 Self-Defense Moves Every Woman Should Know:',
          style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold)),
          YoutubePlayer(
            controller: _controller2,
            showVideoProgressIndicator: true,
          ),
        ],
      ),
    );
 }
}
