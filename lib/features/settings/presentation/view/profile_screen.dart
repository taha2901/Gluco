import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gluco/features/settings/presentation/view/widget/form_profile.dart';

class ProfileScreen extends StatelessWidget {
  final String? imagePath;
  const ProfileScreen({super.key, this.imagePath,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.white,
                    backgroundImage:
                        imagePath != null ? FileImage(File(imagePath!)) : null,
                    child: imagePath == null
                        ? const Icon(Icons.person, size: 60)
                        : null,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('01274975650'),
                      SizedBox(
                        width: 25,
                      ),
                      Text(
                        'ياسر ابراهيم ',
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const FormProfile(),
            ],
          ),
        ),
      ),
    );
  }
}
