import 'package:flutter/material.dart';
import 'package:gluco/core/widgets/custom_button.dart';
import 'package:gluco/features/home/presentation/view/widgets/DoctorReservation.dart';

class DoctorDetials extends StatelessWidget {
  const DoctorDetials({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.only(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 8,
            ),
            const Row(
              children: [
                SizedBox(
                  width: 8,
                ),
                CircleAvatar(
                  radius: 40,
                ),
                SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('د سعيد محمد '),
                      Text('استشاري جراحه و المسالك البوليه'),
                      Text('4.1  تقييم الزوار'),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            const Row(
              children: [
                SizedBox(
                  width: 8,
                ),
                Icon(
                  Icons.location_on_sharp,
                  size: 15,
                ),
                SizedBox(
                  width: 8,
                ),
                Text('16-شارع جمال عبدالناصر'),
              ],
            ),
            const Row(
              children: [
                SizedBox(
                  width: 8,
                ),
                Icon(
                  Icons.calendar_today,
                  size: 15,
                ),
                SizedBox(
                  width: 8,
                ),
                Text('سبت و ثلاثاء من 7 ص'),
              ],
            ),
            const Row(
              children: [
                SizedBox(
                  width: 8,
                ),
                Icon(
                  Icons.shopping_cart_checkout_sharp,
                  size: 15,
                ),
                SizedBox(
                  width: 8,
                ),
                Text('سعر الكشف::  130 ج'),
              ],
            ),
            const Row(
              children: [
                SizedBox(
                  width: 8,
                ),
                Icon(
                  Icons.timer_outlined,
                  size: 15,
                ),
                SizedBox(
                  width: 8,
                ),
                Text('مده الانتظار: 20 دقيقه'),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            CustomButton(
              text: 'حجز',
              circular: 15,
              color: Colors.black,
              height: 35,
              textcolor: Colors.white,
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const DoctorReservation(),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
