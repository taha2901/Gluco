import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gluco/features/appointments/presentation/view/add_appointments.dart';
import 'package:gluco/features/appointments/presentation/view/widgets/show_appoint_medicine.dart';

class ShowAppointment extends StatelessWidget {
  const ShowAppointment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text('مواعيد الأدويه'),
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AddAppointments(),
                ));
          }),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'اليوم',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
            const SizedBox(
              height: 16,
            ),
            // ListView.builder(
            //   itemBuilder: (context, index) => const ShowAppointMedicine(),
            //   itemCount: 5,
            // ),
            const ShowAppointMedicine(),
          ],
        ),
      ),
    );
  }
}
