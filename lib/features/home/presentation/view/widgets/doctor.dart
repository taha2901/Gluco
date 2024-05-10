import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gluco/features/home/presentation/view/widgets/BarApp.dart';
import 'package:gluco/features/home/presentation/view/widgets/DoctorCard.dart';
import 'package:gluco/features/home/presentation/view/widgets/DoctorList.dart';
import 'package:gluco/features/home/presentation/view/widgets/DoctorOffer.dart';
import 'package:gluco/features/home/presentation/view/widgets/custom_text_field_center_text.dart';

class Doctor extends StatelessWidget {
  const Doctor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(right: 15, left: 15, top: 15),
          child: CustomScrollView(
            slivers: [
              const SliverToBoxAdapter(
                child: BarApp(),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 16,
                ),
              ),
              const SliverToBoxAdapter(
                child: CustomTextFieldCenterlable(
                  hint: 'بحث',
                  fillColor: Colors.white,
                  prefixIcon: FontAwesomeIcons.bars,
                  suffixIcon: Icons.search,
                ),
              ),
              const SliverToBoxAdapter(
                child: Text(
                  "العروض",
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF000000),
                    fontSize: 18,
                  ),
                ),
              ),
              const SliverToBoxAdapter(
                child: DoctorOffer(),
              ),
              const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: Text(
                    "المفضله",
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF000000),
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 210,
                  width: double.infinity,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (BuildContext, index) {
                      return DoctorCard(
                        NameOfDoc: " د سعيد محمد",
                        grade: "4.1",
                        TypeOfDoc: "علاج طبيعي",
                        DistanseOfDoc: "يبعد عنك ب 12 كيلو",
                        TimeOfDoc: "10 ص حتى 10 م",
                      );
                    },
                  ),
                ),
              ),
              const SliverToBoxAdapter(
                child: Text(
                  "الاكثر شهره",
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF000000),
                    fontSize: 18,
                  ),
                ),
              ),
              const SliverToBoxAdapter(
                child: DoctorList(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
