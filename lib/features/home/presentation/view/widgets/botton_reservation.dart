import 'package:flutter/material.dart';
import 'package:gluco/core/widgets/custom_button.dart';
import 'package:gluco/features/home/presentation/view/widgets/custom_icon.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class ButtonsInReservation extends StatelessWidget {
  const ButtonsInReservation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: CustomButton(
              text: 'تأكيد',
              circular: 5,
              color: Colors.black,
              textcolor: Colors.white,
              height: 50,
              onTap: () {
                // Navigator.pushNamed(
                //   context,
                //   ConfirmReservation.id,
                // );
              },
            ),
          ),
          CustomIcon(
            icon: Iconsax.message,
            color: Colors.black.withOpacity(0.8),
            colorIcon: Colors.white,
            circular: 30,
          ),
        ],
      ),
    );
  }
}
