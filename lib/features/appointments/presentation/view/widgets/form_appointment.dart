import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gluco/core/widgets/custom_button.dart';
import 'package:gluco/core/widgets/custom_text_field.dart';
import 'package:gluco/features/appointments/presentation/manager/cubit/add_medicine_cubit.dart';
import 'package:gluco/features/home/presentation/view/widgets/custom_text_field_center_text.dart';
import 'package:gluco/features/home/presentation/view/widgets/data_picker_screen.dart';

class FormOfAppointmentMedicine extends StatefulWidget {
  const FormOfAppointmentMedicine({
    super.key,
  });

  @override
  State<FormOfAppointmentMedicine> createState() =>
      _FormOfAppointmentMedicineState();
}

class _FormOfAppointmentMedicineState extends State<FormOfAppointmentMedicine> {
  String? selectedOption1;
  String? selectedOption2;
  String? selectedOption3;
  String? selectedOption4;
  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    var nameController = TextEditingController();
    var timesController = TextEditingController();
    var dosageController = TextEditingController();
    var dateController = TextEditingController();
    return BlocConsumer<AddMedicineCubit, AddMedicineState>(
      listener: (context, state) {},
      builder: (context, state) {
        return SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                CustomTextFieldCenterlable(
                  showBorder: false,
                  hint: 'ابحث عن الدواء',
                  suffixIcon: Icons.search,
                  controller: nameController,
                ),
                const SizedBox(
                  height: 32,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 16,
                          ),
                          CustomTextField(
                            controller: dosageController,
                            showBorder: false,
                            hint: selectedOption3 == null ? 'الجرعه' : null,
                            suffixtext: selectedOption3,
                            dropdownItems: const [
                              'قرص واحد',
                              'قرصين',
                              'ثلاثة اقراص'
                            ],
                            onDropdownChanged: (String? value) {
                              setState(() {
                                selectedOption3 =
                                    value; // تحديث القيمة المختارة
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
                        children: [
                          const SizedBox(
                            height: 16,
                          ),
                          CustomTextField(
                            controller: timesController,
                            showBorder: false,
                            hint: selectedOption2 == null ? 'الكميه' : null,
                            suffixtext: selectedOption2,
                            dropdownItems: const ['مره', 'مرتين', 'ثلاثة مرات'],
                            onDropdownChanged: (String? value) {
                              setState(() {
                                selectedOption2 =
                                    value; // تحديث القيمة المختارة
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                const Text('التردد'),
                const SizedBox(
                  height: 16,
                ),
                MyDatePickerScreen(),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 16,
                          ),
                          CustomTextField(
                            showBorder: false,
                            hint: selectedOption4 == null ? 'الموعد' : null,
                            suffixtext: selectedOption4,
                            dropdownItems: const [
                              'قبل الفطار',
                              'بعدالفطار',
                              'قبل الغذاء',
                              'بعد الغذاء',
                              'قبل العشاء',
                              'بعد العشاء'
                            ],
                            onDropdownChanged: (String? value) {
                              setState(() {
                                selectedOption4 =
                                    value; // تحديث القيمة المختارة
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
                        children: [
                          const SizedBox(
                            height: 16,
                          ),
                          CustomTextField(
                            showBorder: false,
                            hint: selectedOption1 == null ? '10.00 am' : null,
                            suffixtext: selectedOption1,
                            dropdownItems: const [
                              '9.00 am',
                              '10.00 am',
                              '11.00 am'
                            ],
                            onDropdownChanged: (String? value) {
                              setState(() {
                                selectedOption1 =
                                    value; // تحديث القيمة المختارة
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.2,
                ),
                state is AddMedicineLoaded
                    ? const Center(child: CircularProgressIndicator())
                    : CustomButton(
                        text: 'إضافه',
                        icon: Icons.add,
                        color: Colors.black,
                        textcolor: Colors.white,
                        circular: 10,
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            AddMedicineCubit.get(context).addMedicine(
                              dosage: dosageController.text,
                              name: nameController.text,
                              date: dateController.text,
                              times: timesController.text,
                            );
                          }
                        },
                      ),
              ],
            ),
          ),
        );
      },
    );
  }
}
