import 'package:flutter/material.dart';
import 'package:gluco/core/widgets/custom_button.dart';
import 'package:gluco/core/widgets/custom_text_field.dart';

class AddPerson extends StatelessWidget {
  const AddPerson({super.key});
static String id = 'AddPerson';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const SizedBox(
              height: 20,
            ),
            Stack(
              children: [
                const Padding(
                  padding: EdgeInsets.only(right: 16),
                  child: Text(
                    'تخطي',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 16,
                  child: Container(
                    height: 2,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 63,
            ),
            const Center(
              child: Text(
                'هل تريد احد الاشخاص المقربين ان يتابع معك مستوي السكر و مواعيد الدواء و مستوي الصحه عندك ',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 56,
            ),
             Padding(
              padding:const EdgeInsets.symmetric(horizontal: 16),
              child: CustomTextField(
                hint: 'ادخل اميل او رقم التلفون ',
                prefixIcon: IconButton(
              onPressed: () {}, icon: const Icon(Icons.mail)),
              ),
            ),
            const SizedBox(
              height: 213,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: CustomButton(
                text: 'اضافه',
                icon: Icons.add,
                color: Colors.black,
                textcolor: Colors.white,
                onTap: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) =>SuccessScreen()),
                  //   );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
