
import 'package:flutter/material.dart';
import 'package:gluco/core/widgets/constants.dart';

class TwoSquareContainer extends StatelessWidget {
  const TwoSquareContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 140,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: kPrimaryLightColor,
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: Container(
            height: 140,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: kPrimaryLightColor,
            ),
          ),
        ),
      ],
    );
  }
}
