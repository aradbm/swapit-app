import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List<String> newChats = [
    'Jane',
    'John',
    'Emily',
    'David',
    'James',
    'Sarah',
    'Jane',
    'John',
    'Emily',
  ]; // Replace with your dynamic data
  List<String> olderChats = [
    'Mike',
    'Emma',
    'Lucas',
    'Sophie',
    'Isabella'
  ]; // Replace with your dynamic data

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chats'),
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 80, // You can adjust this based on your design needs
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: newChats.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        CircleAvatar(
                          // Add your image or a placeholder here
                          child: Text(newChats[index]
                              [0]), // Displays first letter of the name
                        ),
                        Text(newChats[index]),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
          const Divider(),
          Expanded(
            child: ListView.builder(
              itemCount: olderChats.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    // Add your image or a placeholder here
                    child: Text(olderChats[index]
                        [0]), // Displays first letter of the name
                  ),
                  title: Text(olderChats[index]),
                  onTap: () {
                    // Navigate to chat details with the selected user
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
