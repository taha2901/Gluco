import 'package:flutter/material.dart';

class DefineInReservation extends StatelessWidget {
  const DefineInReservation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      // crossAxisAlignment: CrossAxisAlignment.center,
      // mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(
          child: Image.asset(
            'assets/Rectangle 12425.png',
          ),
        ),
        Container(
          // color: const Color(0xFFFFFFFF),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                // mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "دكتور سعيد الحسينى",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Text(
                "استشارى باطنه",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              Row(
                // mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CircleAvatar(
                    radius: 8,
                    backgroundColor: Color(0xFF000000),
                    child: Icon(
                      Icons.location_on_sharp,
                      size: 12,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    'شارع جمال عبد الناصر  ',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 8,
                    backgroundColor: Color(0xFF000000),
                    child: Icon(
                      Icons.location_on_sharp,
                      size: 12,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    'خمس سنين من الخيرة العلميه  ',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CircleAvatar(
                    radius: 8,
                    backgroundColor: Color(0xFF000000),
                    child: Icon(
                      Icons.location_on_sharp,
                      size: 12,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    'سعر الكشف  : 130 ج',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
