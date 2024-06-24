import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gluco/core/helper/cach.dart';
import 'package:gluco/features/chat/data/room_model.dart';
import 'package:gluco/features/chat/presentation/view/chat_screen.dart';

class ChatCard extends StatelessWidget {
  const ChatCard({
    super.key,
    required this.item,
  });
  final ChatRoom item;
  @override
  Widget build(BuildContext context) {
    final userId = ChachHelper.getData(key: 'id');
    String userID = item.member!
        .where(
          (element) => element != userId,
        )
        .first;
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('users')
            .doc(userID)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Card(
              child: ListTile(
                  onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChatScreen(
                            roomId: item.id!,
                          ),
                        ),
                      ),
                  leading: const CircleAvatar(),
                  title:  Text('${snapshot.data!.data()!['name']}'),
                  subtitle: Text(item.lastMessage.toString()),
                  trailing: 1 / 1 == 0
                      ? const Badge(
                          padding: EdgeInsets.symmetric(horizontal: 12),
                          label: Text("3"),
                          largeSize: 30,
                        )
                      : Text(item.lastMessageTime!)),
            );

          }
          else {
            return const Center(child: CircularProgressIndicator(),);
          }
        });
  }
}
