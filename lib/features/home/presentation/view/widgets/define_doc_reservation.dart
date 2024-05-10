
import 'package:flutter/material.dart';

class DefineInReservation extends StatelessWidget {
  const DefineInReservation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          // color: const Color(0xFFFFFFFF),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "دكتور سعيد الحسينى",
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Text(
                "استشارى باطنه",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'شارع جمال عبد الناصر  ',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                  CircleAvatar(
                    radius: 8,
                    backgroundColor: Color(0xFF000000),
                    child: Icon(
                      Icons.location_on_sharp,
                      size: 12,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'خمس سنين من الخيرة العلميه  ',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                  CircleAvatar(
                    radius: 8,
                    backgroundColor: Color(0xFF000000),
                    child: Icon(
                      Icons.location_on_sharp,
                      size: 12,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("130 L.E : "),
                  Text(
                    'سعر الكشف  ',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                  CircleAvatar(
                    radius: 8,
                    backgroundColor: Color(0xFF000000),
                    child: Icon(
                      Icons.location_on_sharp,
                      size: 12,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Expanded(
          child: Image.asset(
            'assets/Rectangle 12425.png',
          ),
        ),
      ],
    );
  }
}
