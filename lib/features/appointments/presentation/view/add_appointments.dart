import 'package:flutter/material.dart';
import 'package:gluco/features/appointments/presentation/view/widgets/form_appointment.dart';


class AddAppointments extends StatelessWidget {
  const AddAppointments({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text('مواعيد الأدويه'),
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(vertical: 32, horizontal: 16),
        child: FormOfAppointmentMedicine(),
      ),
    );
  }
}
