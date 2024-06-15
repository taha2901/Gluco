import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gluco/features/settings/presentation/view/widget/form_profile.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   elevation: 0,
      //   backgroundColor: Colors.white,
      //   title: const Text(
      //     'الصفحه الشخصيه',
      //     style: TextStyle(color: Colors.black, fontSize: 25),
      //   ),
      //   centerTitle: true,
      //   actions: const [
      //     Padding(
      //       padding: EdgeInsets.symmetric(horizontal: 18),
      //       child: Icon(
      //         FontAwesomeIcons.arrowRight,
      //         color: Colors.black,
      //         size: 30,
      //       ),
      //     ),
      //   ],
      //   leading: const Icon(
      //     Icons.android_sharp,
      //     color: Colors.black,
      //   ),
      // ),
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CircleAvatar(
                radius: 60,
                backgroundColor: Colors.white,
                child: Image.asset('assets/DoctorAhmed.png'),
              ),
              const SizedBox(
                width: 10,
              ),
              const Row(
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
