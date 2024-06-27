import 'package:flutter/material.dart';
import 'package:gluco/core/widgets/constants.dart';

class TicksOfHeart extends StatelessWidget {
  const TicksOfHeart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double containerWidth = constraints.maxWidth * 0.9; // 80% من عرض الشاشة
        double containerHeight = containerWidth * 0.33; // نسبة الطول إلى العرض
        double imageSize =
            containerHeight * 0.55; // حجم الصور كنسبة من الارتفاع

        return Container(
          width: containerWidth,
          height: containerHeight,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: kPrimaryLightColor,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Center(
                    child: Text(
                      'النبص في الدقيقه 68',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            // width: imageSize,
                            // height: imageSize,
                            child: Image.asset(
                              'assets/pulse.png',
                              color: Colors.blue,
                            ),
                          ),
                          SizedBox(
                            // width: imageSize,
                            // height: imageSize,
                            child: Image.asset(
                              'assets/pulse.png',
                              color: Colors.blue,
                            ),
                          ),
                          SizedBox(
                            // width: imageSize,
                            // height: imageSize,
                            child: Image.asset(
                              'assets/pulse.png',
                              color: Colors.blue,
                            ),
                          ),
                          SizedBox(
                            // width: imageSize,
                            // height: imageSize,
                            child: Image.asset(
                              'assets/pulse.png',
                              color: Colors.blue,
                            ),
                          ),
                          SizedBox(
                            // width: imageSize,
                            // height: imageSize,
                            child: Image.asset(
                              'assets/pulse.png',
                              color: Colors.blue,
                            ),
                          ),
                          // SizedBox(
                          //   // width: imageSize,
                          //   // height: imageSize,
                          //   child: Image.asset(
                          //     'assets/pulse.png',
                          //     color: Colors.blue,
                          //   ),
                          // ),
                        ],
                      ),
                      const SizedBox(
                        width: 10, 
                      ),
                      SizedBox(
                        // width: imageSize,
                        // height: imageSize,
                        child: Image.asset(
                          alignment: const AlignmentDirectional(10, 10),
                          'assets/heart.png',
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
