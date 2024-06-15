import 'package:flutter/material.dart';
import 'package:gluco/core/widgets/custom_text_field.dart';
import 'package:gluco/features/home/data/doctor_model/doctor_model.dart';
import 'package:gluco/features/home/presentation/view/widgets/DoctorReservation.dart';
import 'package:gluco/features/home/presentation/view/widgets/cusrom_button.dart';

class formReservation extends StatefulWidget {
  const formReservation({super.key, required this.showDoc});
  final DoctorModel showDoc;
  @override
  State<formReservation> createState() => _formReservationState();
}

// ignore: camel_case_types
class _formReservationState extends State<formReservation> {
  String? selectedOption;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
          hint: 'أدخل اسمك',
        ),
        const SizedBox(
          height: 16,
        ),
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  CustomTextField(
                    hint: selectedOption == null ? 'الجنس' : null,
                    suffixtext: selectedOption,
                    dropdownItems: const ['ذكر', 'أنثي'],
                    onDropdownChanged: (String? value) {
                      setState(() {
                        selectedOption = value; // تحديث القيمة المختارة
                      });
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  CustomTextField(
                    hint: 'أدخل عمرك',
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        CustomTextField(
          hint: 'أدخل رقم تلفونك',
        ),
        const SizedBox(
          height: 32,
        ),
        CustomButtonHome(
          text: 'التالي',
          color: Colors.blue,
          textColor: Colors.white,
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DoctorReservation(
                    showDoc: widget.showDoc,
                  ),
                ));
          },
          borderRadius: 4,
        ),
      ],
    );
  }
}
