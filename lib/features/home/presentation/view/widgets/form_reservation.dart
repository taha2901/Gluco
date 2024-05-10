import 'package:flutter/material.dart';
import 'package:gluco/core/widgets/custom_button.dart';
import 'package:gluco/core/widgets/custom_text_field.dart';

class formReservation extends StatefulWidget {
  const formReservation({super.key});

  @override
  State<formReservation> createState() => _formReservationState();
}

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
        CustomButton(
          text: 'التالي',
          color: Colors.black,
          height: 50,
          textcolor: Colors.white,
          circular: 10,
        ),
      ],
    );
    ;
  }
}
