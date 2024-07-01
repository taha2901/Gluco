import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gluco/core/widgets/custom_button.dart';
import 'package:gluco/core/widgets/custom_show_toast.dart';
import 'package:gluco/features/activities/presentation/manager/pressure_cubit/presssure_check_states.dart';
import 'package:gluco/features/activities/presentation/manager/pressure_cubit/pressure_check_cubit.dart';
import 'package:gluco/features/activities/presentation/manager/suger_cubit/sugar_check_cubit.dart';
import 'package:gluco/features/activities/presentation/view/widgets/PressureChart.dart';
import 'package:gluco/features/activities/presentation/view/widgets/chartempty.dart';
import 'package:gluco/features/home/presentation/manager/pressure_cubit/pressure_cubit.dart';
import 'package:gluco/features/home/presentation/manager/pressure_cubit/pressure_state.dart';
import 'package:gluco/features/home/presentation/view/widgets/TextFieldNumber.dart';
import 'package:gluco/features/home/presentation/view/widgets/cusrom_button.dart';

class PartScreenPressure extends StatelessWidget {
  String? Text1;
  String? Text2;
  String? Text3;
  String? Text4;
  String? Text5;
  String? Text6;

  PartScreenPressure(
      this.Text1, this.Text2, this.Text3, this.Text4, this.Text5, this.Text6);

  var contraction = TextEditingController();

  var extraversion = TextEditingController();

  var heart = TextEditingController();

  GlobalKey<FormState> valid = GlobalKey();

  @override
  
  

  @override
  Widget build(BuildContext context) {
   DateTime currentDate = DateTime.now();
    String formattedDate =
        "${currentDate.year}-${currentDate.month}-${currentDate.day}";


    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => PressureCubit()),
        BlocProvider(create: (context) => PresssureCheckCubit()..fetchpressuredata(formattedDate)),
      ],
      child: BlocConsumer<PressureCubit, PressureState>(
        listener: (context, state) {
          if (state is Pressuresuccess) {
            showToast(msg: "added", state: ToastStates.SUCCESS);
          } else if (state is Pressureserror) {
            showToast(msg: state.errormessage, state: ToastStates.ERROR);
          } else {
            const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 28),
                  child: Form(
                    key: valid,
                    child: Column(
                      children: [
                        Textfieldnumber(Text1, Text4, contraction),
                        const SizedBox(
                          height: 16,
                        ),
                        Textfieldnumber(Text2, Text5, extraversion),
                        const SizedBox(
                          height: 16,
                        ),
                        Textfieldnumber(Text3, Text6, heart),
                        const SizedBox(
                          height: 16,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                GestureDetector(
                  onTap: () async {
                    if (valid.currentState!.validate()) {
                      BlocProvider.of<PressureCubit>(context).pressure(
                          contraction.text, extraversion.text, heart.text);
                          DateTime currentDate = DateTime.now();
                          String formattedDate ="${currentDate.year}-${currentDate.month}-${currentDate.day}";
                          BlocProvider.of<PresssureCheckCubit>(context).fetchpressuredata(formattedDate);
           
                    }
                  },
                  child: Column(
                    children: [
                      CustomButton(
                        text: 'حفظ',
                        circular: 5,
                        color: Colors.blue,
                        textcolor: Colors.white,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top:20),
                  child: Column(
                    children: [
                      const Row(
                        children: [
                          Text("الانقباض"),
                          Padding(
                            padding: EdgeInsets.only(right: 5, left: 70),
                            child: CircleAvatar(
                              backgroundColor: Colors.yellow,
                              radius: 5,
                            ),
                          ),
                          Text("الانبساط"),
                          Padding(
                            padding: EdgeInsets.only(right: 5, left: 70),
                            child: CircleAvatar(
                              backgroundColor: Colors.red,
                              radius: 5,
                            ),
                          ),
                          Text("ضربات القلب"),
                          Padding(
                            padding: EdgeInsets.only(right: 5),
                            child: CircleAvatar(
                              backgroundColor: Colors.blue,
                              radius: 5,
                            ),
                          ),
                        ],
                      ),
                      BlocConsumer<PresssureCheckCubit, PresssureCheckStates>(
                        builder: (context, state) {
                          if (state is PresssureCheckinitial) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          } else if (state is haveData) {
                            List<FlSpot> heart = state.heart.asMap().entries.map((entry) {
                              int index = entry.key;
                              double value = entry.value.toDouble();
                              return FlSpot(index.toDouble(), value);
                            }).toList();
                            List<FlSpot> diastolicpressure = state.diastolicpressure
                                .asMap()
                                .entries
                                .map((entry) {
                              int index = entry.key;
                              double value = entry.value.toDouble();
                              return FlSpot(index.toDouble(), value);
                            }).toList();
                            List<FlSpot> systolicpressure = state.systolicpressure
                                .asMap()
                                .entries
                                .map((entry) {
                              int index = entry.key;
                              double value = entry.value.toDouble();
                              return FlSpot(index.toDouble(), value);
                            }).toList();
                            return Column(
                              children: [
                                SizedBox(
                                  width: double.infinity, // تحديد العرض
                                  height: 300,
                                  child: Pressurechart(
                                      heart, diastolicpressure, systolicpressure),
                                ),
                              ],
                            );
                          } else {
                            return SizedBox(
                              width: double.infinity, // تحديد العرض
                              height: 300,
                              child: Chartempty(),
                            );
                          }
                        },
                        listener: (context, state) {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
