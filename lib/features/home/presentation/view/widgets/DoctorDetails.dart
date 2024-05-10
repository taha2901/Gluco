import 'package:flutter/material.dart';
import 'package:gluco/core/widgets/custom_button.dart';
import 'package:gluco/features/home/presentation/view/widgets/DoctorReservation.dart';

class DoctorDetials extends StatefulWidget {
  const DoctorDetials({Key? key}) : super(key: key);

  @override
  State<DoctorDetials> createState() => _DoctorDetialsState();
}

class _DoctorDetialsState extends State<DoctorDetials> {
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    backgroundColor: const Color(0xFF000000),
                    radius: 17,
                    child: IconButton(
                      icon: isFavorite
                          ? const Icon(Icons.favorite)
                          : const Icon(Icons.favorite_border),
                      color: Colors.white,
                      iconSize: 19,
                      onPressed: () {
                        setState(() {
                          isFavorite = !isFavorite;
                        });
                      },
                    ),
                  ),
                ),
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
                      children: [
                        Text(
                          "  4.9",
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.normal,
                              fontSize: 12,
                              color: Color(0xFF000000)),
                        ),
                        Icon(
                          Icons.star,
                          size: 17,
                          color: Color(0xFFFFCC70),
                        ),
                        Text(" (700)   ",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal,
                                fontSize: 15,
                                color: Color(0xFF000000))),
                        Text(
                          "تقييم الزوار",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.normal,
                              fontSize: 15,
                              color: Color(0xFF000000)),
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
            const Row(
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
            const Row(
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
            const Row(
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
            const Row(
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
            CustomButton(
              text: 'حجز',
              color: Colors.black,
              textcolor: Colors.white,
              width: double.infinity,
              height: 40,
              circular: 5,
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const DoctorReservation(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );

  }
}
