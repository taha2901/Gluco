import 'package:flutter/material.dart';
import 'package:gluco/features/home/presentation/view/widgets/BarApp.dart';
import 'package:gluco/features/home/presentation/view/widgets/Comments.dart';
import 'package:gluco/features/home/presentation/view/widgets/Time.dart';
import 'package:gluco/features/home/presentation/view/widgets/about_doctor.dart';
import 'package:gluco/features/home/presentation/view/widgets/botton_reservation.dart';
import 'package:gluco/features/home/presentation/view/widgets/define_doc_reservation.dart';
import 'package:gluco/features/home/presentation/view/widgets/easy_infinite_time_lines2.dart';

class DoctorReservation extends StatelessWidget {
  const DoctorReservation({Key? key}) : super(key: key);
  static String id = 'DoctorReservation';
  @override
  Widget build(BuildContext context) {
    // List<Appointment> Appointments = [
    //   Appointment("سبت", "24/8"),
    //   Appointment("الاحد", "25/8"),
    //   Appointment("الاثنين", "26/8"),
    //   Appointment("الثلاثاء", "27/8"),
    //   Appointment("الاربعاء", "28/8"),
    //   Appointment("الخميس", "29/8"),
    //   Appointment("الجمعه", "30/8")
    // ];

    final List<String> times = [
      "8:00م",
      "9:00م",
      "10:00م",
      "11:00م",
      "12:00ص",
      "1:00ص",
      "11:00م",
      "12:00ص",
    ];
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.only(left: 15, right: 15),
          child: CustomScrollView(
            slivers: [
              const SliverToBoxAdapter(
                child: BarApp(),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(top: 34),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const DefineInReservation(),
                      const AboutDoctor(),
                      const SizedBox(
                        height: 24,
                      ),
                      const Text(
                        "الايام",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      // Container(
                      //   margin: const EdgeInsets.only(bottom: 11),
                      //   child: SizedBox(
                      //     height: 80,
                      //     width: double.infinity,
                      //     child: ListView.builder(
                      //       scrollDirection: Axis.horizontal,
                      //       itemCount: Appointments.length,
                      //       itemBuilder: (context, index) =>
                      //           AppointmentsWidget(Appointments[index]),
                      //     ),
                      //   ),
                      // ),
                      const MyCalenderTwo(),
                      const SizedBox(
                        height: 16,
                      ),
                      const Text(
                        "الوقت",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Wrap(
                          spacing: 8.0,
                          runSpacing: 12.0,
                          children: times.map((time) => Time(time)).toList(),
                        ),
                      ),
                      const ButtonsInReservation(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Text("اضافه تعليق"),
                          IconButton(
                              onPressed: () {}, icon: const Icon(Icons.add)),
                          const SizedBox(
                            width: 160,
                          ),
                          const Text("(250)"),
                          const Text("  التعليقات"),
                        ],
                      ),
                      ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 5,
                        itemBuilder: (context, index) => const Comments(),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
