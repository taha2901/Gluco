import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gluco/core/widgets/custom_text_field.dart';

class FormProfile extends StatelessWidget {
  const FormProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
          showBorder: false,
          hint: 'تفاصيل شخصيه',
          suffixIcon: Icons.person,
          prefixIcon: IconButton(
              onPressed: () {
                // Navigator.pushNamed(context, PersonalDetails.id);
              },
              icon: const Icon(FontAwesomeIcons.arrowLeft)),
        ),
        const SizedBox(
          height: 10,
        ),
        CustomTextField(
          showBorder: false,
          hint: 'سجلاتي الطبيه',
          suffixIcon: FontAwesomeIcons.fileText,
          prefixIcon: IconButton(
              onPressed: () {
                // Navigator.pushNamed(context, MedicalRecords.id);
              },
              icon: const Icon(FontAwesomeIcons.arrowLeft)),
        ),
        const SizedBox(
          height: 10,
        ),
        CustomTextField(
          showBorder: false,
          hint: 'اضافه اشخاص للمتابعه',
          suffixIcon: FontAwesomeIcons.plusSquare,
          prefixIcon: IconButton(
              onPressed: () {
                // Navigator.pushNamed(context, AddPerson.id);
              },
              icon: const Icon(FontAwesomeIcons.arrowLeft)),
        ),
        const SizedBox(
          height: 10,
        ),
        CustomTextField(
          showBorder: false,
          hint: 'الاشعارات',
          suffixIcon: FontAwesomeIcons.bell,
          prefixIcon: IconButton(
              onPressed: () {
                // Navigator.pushNamed(context, NotificationDetials.id);
              },
              icon: const Icon(FontAwesomeIcons.arrowLeft)),
        ),
        const SizedBox(
          height: 10,
        ),
        CustomTextField(
          showBorder: false,
          hint: 'طرق الدفع',
          suffixIcon: FontAwesomeIcons.creditCard,
          prefixIcon: IconButton(
              onPressed: () {}, icon: const Icon(FontAwesomeIcons.arrowLeft)),
        ),
        const SizedBox(
          height: 10,
        ),
        CustomTextField(
          showBorder: false,
          hint: 'المفضله',
          suffixIcon: FontAwesomeIcons.heart,
          prefixIcon: IconButton(
              onPressed: () {
                //  Navigator.pushNamed(context, StoreFavourities.id);
              },
              icon: const Icon(FontAwesomeIcons.arrowLeft)),
        ),
        const SizedBox(
          height: 10,
        ),
        CustomTextField(
          showBorder: false,
          hint: 'المساعده و الدعم',
          suffixIcon: FontAwesomeIcons.phone,
          prefixIcon: IconButton(
              onPressed: () {}, icon: const Icon(FontAwesomeIcons.arrowLeft)),
        ),
        const SizedBox(
          height: 10,
        ),
        CustomTextField(
          showBorder: false,
          hint: ' تسجيل الخروج',
          suffixIcon: Icons.login,
          prefixIcon: IconButton(
              onPressed: () {}, icon: const Icon(FontAwesomeIcons.arrowLeft)),
        ),
      ],
    );
  }
}
