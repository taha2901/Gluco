import 'package:flutter/material.dart';
import 'package:gluco/features/chat/presentation/view/chat_screen.dart';

class ChatCard extends StatelessWidget {
  const ChatCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
          onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ChatScreen(),
                ),
              ),
          leading: const CircleAvatar(),
          title: const Text("الاسم"),
          subtitle: const Text("اخر رساله"),
          trailing: const Badge(
            padding: EdgeInsets.symmetric(horizontal: 12),
            label: Text("3"),
            largeSize: 30,
          )),
    );
  }
}
