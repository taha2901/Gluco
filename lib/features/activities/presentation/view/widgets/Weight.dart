
import 'package:flutter/material.dart';
import 'package:gluco/features/activities/presentation/view/widgets/Chart.dart';
import 'package:gluco/features/home/presentation/view/widgets/time_line_cal_one.dart';

class Weight extends StatelessWidget {
  const Weight({Key? key}) : super(key: key);

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
                  Text("بعد النشاط"),
                  Padding(
                    padding: EdgeInsets.only(right: 5),
                    child: CircleAvatar(
                      backgroundColor: Colors.black87,
                      radius: 5,
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(right: 50)),
                  Text("قبل النشاط"),
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
                child: chart(0, 9, 50, 90, "اليوم", "الوزن"),
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
