import 'package:flutter/material.dart';
import 'package:gluco/features/auth/presentation/view/widget/text_field.dart';
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
                        onPressed: () {},
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
              child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return const ChatCard();
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
