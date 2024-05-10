
import 'package:flutter/material.dart';

class defineDoctor extends StatelessWidget {
  const defineDoctor({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(Icons.delete,color: Colors.red,),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "د سعيد محمد ",
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                      fontSize: 15,
                      color: Color(0xFF000000)),
                ),
                Text(
                  "استشاري جراحه و المسالك البوليه",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.normal,
                      fontSize: 15,
                      color: Color(0xFF000000)),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "شارع جمال عبدالناصر",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          fontSize: 15,
                          color: Color(0xFF000000)),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Icon(
                      Icons.location_on_sharp,
                      size: 15,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "7:00 pm : ",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.normal,
                          fontSize: 15,
                          color: Color(0xFF000000)),
                    ),
                    Text(
                      "سبت و ثلاثاء",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.normal,
                          fontSize: 15,
                          color: Color(0xFF000000)),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Icon(
                      Icons.calendar_today,
                      size: 15,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "130 L.E : ",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.normal,
                          fontSize: 15,
                          color: Color(0xFF000000)),
                    ),
                    Text(
                      "سعر الكشف",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          fontSize: 15,
                          color: Color(0xFF000000)),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Icon(
                      Icons.shopping_cart_checkout_sharp,
                      size: 15,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "20 minute : ",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.normal,
                          fontSize: 15,
                          color: Color(0xFF000000)),
                    ),
                    Text(
                      "مده الانتظار",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          fontSize: 15,
                          color: Color(0xFF000000)),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Icon(
                      Icons.timer_outlined,
                      size: 15,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              width: 6,
            ),
            Expanded(
              child: Image.asset(
                "assets/DoctorSaied.png",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
