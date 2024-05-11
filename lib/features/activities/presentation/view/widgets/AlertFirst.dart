import 'package:flutter/material.dart';
import 'package:gluco/features/activities/presentation/view/widgets/Chart.dart';
import 'package:gluco/features/activities/presentation/view/widgets/Warinig.dart';
import 'package:gluco/features/home/presentation/view/widgets/time_line_cal_one.dart';

class AlertFirst extends StatelessWidget {
  const AlertFirst({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Warning('assets/img_4.png',
            "يوم رائع عبدالرحمن يوجد تحسن في مستوي السكر لديك وصل في اخذ الادويه و عمل بعض الانشطه "),
        const MyTimeLineCalender1(),
        Padding(
          padding: const EdgeInsets.only(right: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                children: [
                  Text("قبل الوجبه"),
                  Padding(
                    padding: EdgeInsets.only(right: 5),
                    child: CircleAvatar(
                      backgroundColor: Colors.black87,
                      radius: 5,
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(right: 50)),
                  Text("بعد الوجبه"),
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
                child: chart(0, 10, 40, 145, "اليوم", "mg/dl"),
              ),
              const Text(
                "تفاصيل اخرى",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const Text(
                  "يتم فيها اضافه كل التفاصيل المدخله بمعنى قام المستخدم بإدخال قياس السكر قبل الغداء وكانت النسبه 120 تعرض هذه التفاصيل كلها وعدد المرات التى قام المريض بقياس السكر فيها ")
            ],
          ),
        ),
      ],
    );
  }
}
