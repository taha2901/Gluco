import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gluco/core/helper/cach.dart';
import 'package:gluco/features/auth/presentation/view/widget/text_field.dart';
import 'package:gluco/features/chat/data/room_model.dart';
import 'package:gluco/features/chat/presentation/manager/fire_database.dart';
import 'package:gluco/features/chat/presentation/view/widgets/chat_card.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class ChatHomeScreen extends StatefulWidget {
  const ChatHomeScreen({super.key});

  @override
  State<ChatHomeScreen> createState() => _ChatHomeScreenState();
}

class _ChatHomeScreenState extends State<ChatHomeScreen> {
  TextEditingController emailCon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final userId = ChachHelper.getData(key: 'id');
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Enter Friend Email",
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        const Spacer(),
                        IconButton.filled(
                          onPressed: () {},
                          icon: const Icon(Iconsax.scan_barcode),
                        )
                      ],
                    ),
                    CustomField(
                      showBorder: false,
                      controller: emailCon,
                      icon: Iconsax.direct,
                      lable: "Email",
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.all(16),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                            backgroundColor:
                                Theme.of(context).colorScheme.primaryContainer),
                        onPressed: () {
                          FireData().createRoom(emailCon.text).then((onValue) {
                            setState(() {
                              emailCon.text = "";
                            });
                            Navigator.pop(context);
                          });
                        },
                        child: const Center(
                          child: Text("Create Chat"),
                        ))
                  ],
                ),
              );
            },
          );
        },
        child: const Icon(Iconsax.message_add),
      ),
      appBar: AppBar(
        title: const Text("شات"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('rooms')
                      .where('member', arrayContains: userId)
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<ChatRoom> items = snapshot.data!.docs
                          .map((e) => ChatRoom.fromJson(e.data()))
                          .toList()
                        ..sort(
                          (a, b) =>
                              b.lastMessageTime!.compareTo(a.lastMessageTime!),
                        );
                      return ListView.builder(
                          itemCount: items.length,
                          itemBuilder: (context, index) {
                            return ChatCard(item: items[index],);
                          });
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
