// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:gluco/core/widgets/custom_button.dart';
// import 'package:gluco/core/widgets/custom_show_toast.dart';
// import 'package:gluco/core/widgets/custom_text_field.dart';
// import 'package:gluco/features/appointments/presentation/manager/add_medicine_cubit/add_medicine_cubit.dart';
// import 'package:gluco/features/home/presentation/view/widgets/custom_text_field_center_text.dart';

// class AddAppointments extends StatelessWidget {
//   const AddAppointments({super.key});
//   @override
//   Widget build(BuildContext context) {
//     final GlobalKey<FormState> formKey = GlobalKey<FormState>();
//     var nameController = TextEditingController();
//     var timesController = TextEditingController();
//     var dosageController = TextEditingController();
//     var dateController = TextEditingController();
//     return BlocProvider(
//       create: (context) => AddMedicineCubit(),
//       child: BlocConsumer<AddMedicineCubit, AddMedicineState>(
//         listener: (context, state) {
//           if (state is AddMedicineSuccess) {
//             if (state is AddMedicineSuccess) {
//               showToast(
//                 msg: 'Added Successful',
//                 state: ToastStates.SUCCESS,
//               );
//             } else {
//               showToast(
//                 msg: 'Added Failed',
//                 state: ToastStates.ERROR,
//               );
//             }
//           }
//         },
//         builder: (context, state) {
//           return Scaffold(
//             appBar: AppBar(
//               automaticallyImplyLeading: false,
//               centerTitle: true,
//               title: const Text('مواعيد الأدويه'),
//             ),
//             body: Padding(
//                 padding:
//                     const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
//                 child: SingleChildScrollView(
//                   child: Form(
//                     key: formKey,
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         CustomTextFieldCenterlable(
//                           showBorder: false,
//                           hint: 'ابحث عن الدواء',
//                           suffixIcon: Icons.search,
//                           controller: nameController,
//                         ),
//                         const SizedBox(
//                           height: 32,
//                         ),
//                         Row(
//                           children: [
//                             Expanded(
//                               child: Column(
//                                 children: [
//                                   const SizedBox(
//                                     height: 16,
//                                   ),
//                                   CustomTextField(
//                                     controller: dosageController,
//                                     showBorder: false,
//                                     // hint: selectedOption3 == null ? 'الجرعه' : null,
//                                     hint: 'الجرعه',
//                                     // suffixtext: selectedOption3,
//                                     // dropdownItems: const [
//                                     //   'قرص واحد',
//                                     //   'قرصين',
//                                     //   'ثلاثة اقراص'
//                                     // ],
//                                     // onDropdownChanged: (String? value) {
//                                     //   setState(() {
//                                     //     selectedOption3 = value; // تحديث القيمة المختارة
//                                     //   });
//                                     // },
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             // const SizedBox(
//                             //   width: 8,
//                             // ),
//                             // Expanded(
//                             //   child: Column(
//                             //     children: [
//                             //       const SizedBox(
//                             //         height: 16,
//                             //       ),
//                             //       CustomTextField(
//                             //         controller: timesController,
//                             //         showBorder: false,
//                             //         hint: selectedOption2 == null ? 'الكميه' : null,
//                             //         suffixtext: selectedOption2,
//                             //         dropdownItems: const ['مره', 'مرتين', 'ثلاثة مرات'],
//                             //         onDropdownChanged: (String? value) {
//                             //           setState(() {
//                             //             selectedOption2 = value; // تحديث القيمة المختارة
//                             //           });
//                             //         },
//                             //       ),
//                             //     ],
//                             //   ),
//                             // ),
//                           ],
//                         ),
//                         // const SizedBox(
//                         //   height: 16,
//                         // ),
//                         // const Text('التردد'),
//                         // const SizedBox(
//                         //   height: 16,
//                         // ),
//                         // MyDatePickerScreen(),
//                         const SizedBox(
//                           height: 16,
//                         ),
//                         Row(
//                           children: [
//                             Expanded(
//                               child: Column(
//                                 children: [
//                                   const SizedBox(
//                                     height: 16,
//                                   ),
//                                   CustomTextField(
//                                     showBorder: false,
//                                     // hint: selectedOption4 == null ? 'الموعد' : null,
//                                     hint: 'الموعد',
//                                     // suffixtext: selectedOption4,
//                                     // dropdownItems: const [
//                                     //   'قبل الفطار',
//                                     //   'بعدالفطار',
//                                     //   'قبل الغذاء',
//                                     //   'بعد الغذاء',
//                                     //   'قبل العشاء',
//                                     //   'بعد العشاء'
//                                     // ],
//                                     // onDropdownChanged: (String? value) {
//                                     //   setState(() {
//                                     //     selectedOption4 = value; // تحديث القيمة المختارة
//                                     //   });
//                                     // },
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             const SizedBox(
//                               width: 8,
//                             ),
//                             Expanded(
//                               child: Column(
//                                 children: [
//                                   const SizedBox(
//                                     height: 16,
//                                   ),
//                                   CustomTextField(
//                                     showBorder: false,
//                                     // hint: selectedOption1 == null ? '10.00 am' : null,
//                                     hint: '10.0 pm',
//                                     // suffixtext: selectedOption1,
//                                     // dropdownItems: const [
//                                     //   '9.00 am',
//                                     //   '10.00 am',
//                                     //   '11.00 am'
//                                     // ],
//                                     // onDropdownChanged: (String? value) {
//                                     //   setState(() {
//                                     //     selectedOption1 = value; // تحديث القيمة المختارة
//                                     //   });
//                                     // },
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                         SizedBox(
//                           height: MediaQuery.of(context).size.height * 0.2,
//                         ),
//                         state is AddMedicineLoaded
//                             ? const Center(
//                                 child: CircularProgressIndicator(),
//                               )
//                             : CustomButton(
//                                 text: 'إضافه',
//                                 icon: Icons.add,
//                                 color: Colors.black,
//                                 textcolor: Colors.white,
//                                 circular: 10,
//                                 onTap: () {
//                                   if (formKey.currentState!.validate()) {
//                                     AddMedicineCubit.get(context).addMedicine(
//                                       dosage: dosageController.text,
//                                       name: nameController.text,
//                                       date: dateController.text,
//                                       times: timesController.text,
//                                     );
//                                   }
//                                   Navigator.pop(context);
//                                 },
//                               ),
//                       ],
//                     ),
//                   ),
//                 )),
//           );
//         },
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gluco/core/widgets/custom_button.dart';
import 'package:gluco/core/widgets/custom_show_toast.dart';
import 'package:gluco/core/widgets/custom_text_field.dart';
import 'package:gluco/features/appointments/presentation/manager/add_medicine_cubit/add_medicine_cubit.dart';
import 'package:gluco/features/appointments/presentation/manager/get_medicine_cubit/get_medicine_cubit.dart';
import 'package:gluco/features/home/presentation/view/widgets/custom_text_field_center_text.dart';

class AddAppointments extends StatelessWidget {
  const AddAppointments({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    var nameController = TextEditingController();
    var timesController = TextEditingController();
    var dosageController = TextEditingController();
    var dateController = TextEditingController();

    return BlocConsumer<AddMedicineCubit, AddMedicineState>(
      listener: (context, state) {
        if (state is AddMedicineSuccess) {
          showToast(
            msg: 'Added Successfully',
            state: ToastStates.SUCCESS,
          );
           GetMedicineCubit.get(context).getMedicines();
        } else if (state is AddMedicineFailure) {
          showToast(
            msg: 'Addition Failed: ${state.errMessage}',
            state: ToastStates.ERROR,
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            centerTitle: true,
            title: const Text('مواعيد الأدويه'),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextFieldCenterlable(
                      showBorder: false,
                      hint: 'ابحث عن الدواء',
                      suffixIcon: Icons.search,
                      controller: nameController,
                    ),
                    const SizedBox(height: 32),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              const SizedBox(height: 16),
                              CustomTextField(
                                controller: dosageController,
                                showBorder: false,
                                hint: 'الجرعه',
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              const SizedBox(height: 16),
                              CustomTextField(
                                controller: timesController,
                                showBorder: false,
                                hint: 'الموعد',
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Column(
                            children: [
                              const SizedBox(height: 16),
                              CustomTextField(
                                controller: dateController,
                                showBorder: false,
                                hint: '10.0 pm',
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.2),
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
                              Navigator.pop(context);
                            },
                          ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
