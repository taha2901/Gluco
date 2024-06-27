import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gluco/features/appointments/data/get_medicine_model/get_medicine_model.dart';

class ShowAppointMedicine extends StatelessWidget {
  const ShowAppointMedicine({
    super.key,
    this.medicineModel,
  });
  final GetMedicineModel? medicineModel;
  @override
  Widget build(BuildContext context) {
    return Card(
        color: const Color.fromARGB(255, 214, 211, 211),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    medicineModel!.name.toString(),
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Text(medicineModel!.dosage.toString()),
                      Text(medicineModel!.date.toString()),
                      Text(medicineModel!.times.toString()),

                    ],
                  ),
                ],
              ),
              const Spacer(),
              const Padding(
                padding: EdgeInsets.only(left: 10),
                child: Icon(FontAwesomeIcons.ellipsis),
              ),
            ],
          ),
        ));
  }
}
