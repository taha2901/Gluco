import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gluco/core/helper/cach.dart';
import 'package:gluco/features/layout/presentation/manager/layout_cubit/layout_cubit.dart';
import 'package:gluco/features/settings/presentation/view/widget/form_profile.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key, this.imagePath});
  final String? imagePath;

  @override
  Widget build(BuildContext context) {
    var myPic = ChachHelper.getData(key: 'photoUrl');
    final cubit = context.read<LayoutCubit>();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Profile',
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
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
                              backgroundImage: imagePath != null
                                  ? FileImage(File(imagePath!))
                                  : (myPic != null && myPic is String
                                      ? NetworkImage(myPic)
                                      : null),
                              child: (imagePath == null && myPic == null)
                                  ? const Icon(Icons.person)
                                  : null,
                            ),
                  const SizedBox(
                    width: 10,
                  ),
                  // Display the user's phone number and name.
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '01274975650',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'ياسر ابراهيم',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              // Display the user's form to edit their profile.
              const FormProfile(),
            ],
          ),
        ),
      ),
    );
  }
}
