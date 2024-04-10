import 'package:flutter/material.dart';

class CommunityPage extends StatefulWidget {
 const CommunityPage({super.key});

 @override
 _CommunityPageState createState() => _CommunityPageState();
}

class _CommunityPageState extends State<CommunityPage> with SingleTickerProviderStateMixin {
 late TabController _tabController; // Declare the TabController
 List<Map<String, dynamic>> _myPosts = []; // List to store 'My Posts'
 List<Map<String, dynamic>> _timelinePosts = []; // List to store 'Timeline' posts
 final TextEditingController _controller = TextEditingController(); // Controller to capture TextField input

 @override
 void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this); // Initialize the TabController
    // Add some demo posts to the 'Timeline'
    _timelinePosts.addAll([
      {'text': 'Hello, world!', 'time': DateTime.now()},
      {'text': 'How are you?', 'time': DateTime.now().subtract(Duration(hours: 1))},
      {'text': 'Nice to meet you!', 'time': DateTime.now().subtract(Duration(hours: 2))},
    ]);
 }

@override
void dispose() {
 _controller.dispose(); // Dispose of the TextEditingController
 _tabController.dispose(); // Dispose of the TabController
 super.dispose();
}

 void _addPost(String post) {
    setState(() {
      _myPosts.add({
        'text': post,
        'time': DateTime.now(), // Capture the current time
      });
      _controller.clear(); // Clear the TextField after adding the post
    });
 }

 @override
 Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Community'),
        bottom: TabBar(
          controller: _tabController, // Provide the TabController to the TabBar
          tabs: const [
            Tab(text: 'My Posts'),
            Tab(text: 'Timeline'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController, // Provide the TabController to the TabBarView
        children: [
          Column(
            children: [
              Expanded(
                child: ListView.builder(
                 itemCount: _myPosts.length,
                 itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: ListTile(
                        leading: Icon(Icons.person, size: 40), // User icon
                        title: Text(_myPosts[index]['text']),
                        subtitle: Text(
                          'Posted at: ${_myPosts[index]['time'].toString()}', // Display the time
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                    );
                 },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                 children: [
                    Expanded(
                      child: TextField(
                        controller: _controller, // Use the controller to capture input
                        decoration: const InputDecoration(
                          labelText: 'Write something...',
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        String post = _controller.text; // Get the post text from the TextField
                        if (post.isNotEmpty) { // Check if the post is not empty
                          _addPost(post);
                        }
                      },
                      icon: const Icon(Icons.send),
                    ),
                 ],
                ),
              ),
            ],
          ),
          ListView.builder(
            itemCount: _timelinePosts.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                child: ListTile(
                 leading: Icon(Icons.person, size: 40), // User icon
                 title: Text(_timelinePosts[index]['text']),
                 subtitle: Text(
                    'Posted at: ${_timelinePosts[index]['time'].toString()}', // Display the time
                    style: TextStyle(fontSize: 12),
                 ),
                ),
              );
            },
          ),
        ],
      ),
    );
 }
}
