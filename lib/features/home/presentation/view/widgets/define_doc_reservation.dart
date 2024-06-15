import 'package:flutter/material.dart';
import 'package:gluco/features/home/data/doctor_model/doctor_model.dart';

class DefineInReservation extends StatelessWidget {
  const DefineInReservation({
    super.key, required this.showDoc,
  });
  final DoctorModel showDoc;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Image.asset(
            'assets/Rectangle 12425.png',
          ),
        ),
        Container(
          child:  Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    showDoc.userName.toString(),
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Text(
                showDoc.doctorSpecialization.toString(),
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              Row(
                children: [
                  const CircleAvatar(
                    radius: 8,
                    backgroundColor: Color(0xFF000000),
                    child: Icon(
                      Icons.location_on_sharp,
                      size: 12,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    showDoc.address.toString(),
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              const Row(
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
                  const CircleAvatar(
                    radius: 8,
                    backgroundColor: Color(0xFF000000),
                    child: Icon(
                      Icons.location_on_sharp,
                      size: 12,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    'سعر الكشف  : ${showDoc.detectionPrice} ج',
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
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
