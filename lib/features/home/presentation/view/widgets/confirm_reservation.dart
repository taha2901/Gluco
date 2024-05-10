import 'package:flutter/material.dart';
import 'package:gluco/features/home/presentation/view/widgets/define_doctor.dart';
import 'package:gluco/features/home/presentation/view/widgets/form_reservation.dart';

class ConfirmReservation extends StatelessWidget {
  const ConfirmReservation({super.key});
  static String id = 'confirmReservation';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: const Icon(Icons.delete),
        actions: const [
          Padding(
            padding:  EdgeInsets.only(right: 16),
            child: Icon(
              Icons.arrow_forward_ios_outlined,
            ),
          ),
        ],
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              defineDoctor(),
              SizedBox(
                height: 30,
              ),
              Divider(
                color: Colors.grey,
                height: 2,
                thickness: 1,
              ),
              SizedBox(
                height: 30,
              ),
              formReservation(),
            ],
          ),
        ),
      ),
    );
  }
}
