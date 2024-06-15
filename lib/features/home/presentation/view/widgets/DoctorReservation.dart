import 'package:flutter/material.dart';
import 'package:gluco/features/home/data/doctor_model/doctor_model.dart';
import 'package:gluco/features/home/presentation/view/widgets/Comments.dart';
import 'package:gluco/features/home/presentation/view/widgets/Time.dart';
import 'package:gluco/features/home/presentation/view/widgets/about_doctor.dart';
import 'package:gluco/features/home/presentation/view/widgets/bar_app_one_doc.dart';
import 'package:gluco/features/home/presentation/view/widgets/botton_reservation.dart';
import 'package:gluco/features/home/presentation/view/widgets/define_doc_reservation.dart';
import 'package:gluco/features/home/presentation/view/widgets/easy_infinite_time_lines2.dart';

class DoctorReservation extends StatelessWidget {
  const DoctorReservation({super.key, required this.showDoc});
  final DoctorModel showDoc;
  @override
  Widget build(BuildContext context) {
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
                child: BarAppOneDoc(),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(top: 34),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       DefineInReservation(showDoc: showDoc,),
                      const AboutDoctor(),
                      const SizedBox(
                        height: 24,
                      ),
                      const Text(
                        "الايام",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
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
