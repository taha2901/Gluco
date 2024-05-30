
import 'package:flutter/material.dart';

class AboutDoctor extends StatelessWidget {
  const AboutDoctor({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "عن الطبيب",
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Text(" الزيارات : (150) "),
        Text(
          "سعيد الحسيني: طبيب استشاري أمراض الجهاز الهضمي والكبد في مستشفى القصر العيني بالقاهرة. تخرج من كلية الطب بجامعة القاهرة عام 2017 ، وحصل على درجة الماجستير في أمراض الجهاز الهضمي والكبد عام 2020.",
        ),
      ],
    );
  }
}
