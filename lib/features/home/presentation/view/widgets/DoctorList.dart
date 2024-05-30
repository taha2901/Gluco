import 'package:flutter/material.dart';
import 'package:gluco/features/home/presentation/view/widgets/DoctorDetails.dart';

class DoctorList extends StatelessWidget {
  const DoctorList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return const Padding(
          padding: EdgeInsets.only(bottom: 8),
          child: DoctorDetials(),
        );
      },
      itemCount: 5,
    );
  }
}
