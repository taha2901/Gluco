import 'package:flutter/material.dart';
import 'package:gluco/features/home/data/doctor_model/doctor_model.dart';

class DoctorCard extends StatelessWidget {
  const DoctorCard({super.key, required this.doc});
  final DoctorModel doc;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8),
      child: Card(
        // decoration: BoxDecoration(
        //   color: Colors.grey,
        //   borderRadius: BorderRadius.circular(15),
        // ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset("assets/DoctorSaied.png"),
            Text(doc.userName.toString()),
            Text(doc.doctorSpecialization.toString()),
            Text(doc.address.toString()),
            Text(doc.appointment.toString()),
          ],
        ),
      ),
    );
  }
}
