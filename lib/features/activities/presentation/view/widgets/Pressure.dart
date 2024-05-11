
import 'package:flutter/material.dart';
import 'package:gluco/features/activities/presentation/view/widgets/Chart.dart';
import 'package:gluco/features/home/presentation/view/widgets/time_line_cal_one.dart';

class Pressure extends StatelessWidget {
  const Pressure({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15, top: 20, left: 15),
      child: ListView(
        children: [
          const MyTimeLineCalender1(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                children: [
                  Text("الانقباض"),
                  Padding(
                    padding: EdgeInsets.only(right: 5, left: 70),
                    child: CircleAvatar(
                      backgroundColor: Colors.black87,
                      radius: 5,
                    ),
                  ),
                  Text("الانبساط"),
                  Padding(
                    padding: EdgeInsets.only(right: 5, left: 70),
                    child: CircleAvatar(
                      backgroundColor: Colors.black87,
                      radius: 5,
                    ),
                  ),
                  Text("ضربات القلب"),
                  Padding(
                    padding: EdgeInsets.only(right: 5),
                    child: CircleAvatar(
                      backgroundColor: Colors.black87,
                      radius: 5,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: chart(1, 10, 60, 150, "اليوم", "الضغط"),
              ),
              const Text(
                "تفاصيل اخرى",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const Text(
                  "يتم فيها اضافه كل التفاصيل المدخله بمعنى قام المستخدم بإدخال قياس السكر قبل الغداء وكانت النسبه 120 تعرض هذه التفاصيل كلها وعدد المرات التى قام المريض بقياس السكر فيها ")
            ],
          )
        ],
      ),
    );
  }
}
