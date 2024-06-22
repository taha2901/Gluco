import 'package:flutter/material.dart';
import 'package:gluco/features/home/data/doctor/doctor.model.dart';

class DoctorCard extends StatelessWidget {
  const DoctorCard({super.key, required this.doc});
  final DoctorModel doc;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8),
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset("assets/DoctorSaied.png"),
            Text(doc.userName.toString()),
            Text(doc.doctorspecialization.toString()),
            Text(doc.address.toString()),
            Text(doc.appointment.toString()),
          ],
        ),
      ),
    );
  }
}
