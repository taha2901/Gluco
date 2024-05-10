import 'package:flutter/material.dart';
import 'package:gluco/features/home/presentation/view/widgets/DoctorDetails.dart';
class DoctorList extends StatelessWidget {
  const DoctorList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
        itemBuilder: (context,index){
          return const DoctorDetials();
        },
        itemCount: 5,
    );
  }
}
