import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gluco/features/settings/presentation/view/widget/add_person.dart';
import 'package:gluco/features/settings/presentation/view/widget/custom_widget.dart';
import 'package:gluco/features/settings/presentation/view/widget/medical_recoer.dart';
import 'package:gluco/features/settings/presentation/view/widget/modify_personal_detail.dart';

class FormProfile extends StatelessWidget {
  const FormProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomWidget(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const PersonalDetails()),
            );
          },
          icon: Icons.person,
          text: 'تفاصيل شخصيه',
        ),
        const SizedBox(
          height: 10,
        ),
        // CustomTextField(
        //   showBorder: false,
        //   hint: 'سجلاتي الطبيه',
        //   suffixIcon: FontAwesomeIcons.fileText,
        //   prefixIcon: IconButton(
        //       onPressed: () {
        //         // Navigator.pushNamed(context, MedicalRecords.id);
        //       },
        //       icon: const Icon(FontAwesomeIcons.arrowLeft)),
        // ),
        CustomWidget(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MedicalRecords()),
            );
          },
          icon: Icons.medical_services_rounded,
          text: 'سجلاتي الطبيه',
        ),
        const SizedBox(
          height: 10,
        ),
        // CustomTextField(
        //   showBorder: false,
        //   hint: 'اضافه اشخاص للمتابعه',
        //   suffixIcon: FontAwesomeIcons.plusSquare,
        //   prefixIcon: IconButton(
        //       onPressed: () {
        //         // Navigator.pushNamed(context, AddPerson.id);
        //       },
        //       icon: const Icon(FontAwesomeIcons.arrowLeft)),
        // ),
        CustomWidget(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AddPerson()),
            );
          },
          icon: FontAwesomeIcons.plusSquare,
          text: 'اضافه اشخاص للمتابعه',
        ),
        const SizedBox(
          height: 10,
        ),
        // CustomTextField(
        //   showBorder: false,
        //   hint: 'الاشعارات',
        //   suffixIcon: FontAwesomeIcons.bell,
        //   prefixIcon: IconButton(
        //       onPressed: () {
        //         // Navigator.pushNamed(context, NotificationDetials.id);
        //       },
        //       icon: const Icon(FontAwesomeIcons.arrowLeft)),
        // ),
        CustomWidget(
          onPressed: () {
            // Navigator.pushNamed(context, NotificationDetials.id);
          },
          icon: FontAwesomeIcons.bell,
          text: 'الاشعارات',
        ),
        const SizedBox(
          height: 10,
        ),
        // CustomTextField(
        //   showBorder: false,
        //   hint: 'طرق الدفع',
        //   suffixIcon: FontAwesomeIcons.creditCard,
        //   prefixIcon: IconButton(
        //       onPressed: () {}, icon: const Icon(FontAwesomeIcons.arrowLeft)),
        // ),

        CustomWidget(
          // onPressed: () {
          //   // Navigator.pushNamed(context, NotificationDetials.id);
          // },
          icon: FontAwesomeIcons.creditCard,
          text: 'طرق الدفع',
        ),
        const SizedBox(
          height: 10,
        ),
        // CustomTextField(
        //   showBorder: false,
        //   hint: 'المفضله',
        //   suffixIcon: FontAwesomeIcons.heart,
        //   prefixIcon: IconButton(
        //       onPressed: () {
        //         //  Navigator.pushNamed(context, StoreFavourities.id);
        //       },
        //       icon: const Icon(FontAwesomeIcons.arrowLeft)),
        // ),

        CustomWidget(
          onPressed: () {
            // Navigator.pushNamed(context, StoreFavourities.id);
          },
          icon: FontAwesomeIcons.heart,
          text: 'المفضله',
        ),
        const SizedBox(
          height: 10,
        ),
        // CustomTextField(
        //   showBorder: false,
        //   hint: 'المساعده و الدعم',
        //   suffixIcon: FontAwesomeIcons.phone,
        //   prefixIcon: IconButton(
        //       onPressed: () {}, icon: const Icon(FontAwesomeIcons.arrowLeft)),
        // ),
        CustomWidget(
          // onPressed: () {
          //   // Navigator.pushNamed(context, NotificationDetials.id);
          // },
          icon: FontAwesomeIcons.phone,
          text: 'المساعده و الدعم',
        ),
        const SizedBox(
          height: 10,
        ),
        // CustomTextField(
        //   showBorder: false,
        //   hint: ' تسجيل الخروج',
        //   suffixIcon: Icons.login,
        //   prefixIcon: IconButton(
        //       onPressed: () {}, icon: const Icon(FontAwesomeIcons.arrowLeft)),
        // ),
        CustomWidget(
          // onPressed: () {
          //   // Navigator.pushNamed(context, NotificationDetials.id);
          // },
          icon: Icons.logout,
          text: ' تسجيل الخروج',
        ),
      ],
    );
  }
}
