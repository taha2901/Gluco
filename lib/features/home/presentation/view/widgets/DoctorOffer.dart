import 'package:flutter/material.dart';

class DoctorOffer extends StatelessWidget {
  const DoctorOffer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color(0xFF203640),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 24, left: 16, right: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              "assets/DoctorAhmed.png",
            ),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "دكتور احمد ضاحى (امراض القلب)",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "السبت /7:00 مساء   ",
                      style: TextStyle(color: Colors.white),
                    ),
                    Icon(
                      Icons.calendar_today,
                      color: Color(0xffFFCC70),
                      size: 15,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      '90 L.E : ',
                      style: TextStyle(
                        color: Color(0xffFFCC70),
                      ),
                    ),
                    Text(
                      'الكشف بنصف الثمن ',
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
