import 'package:flutter/material.dart';
import 'package:gluco/features/home/data/doctor_model/doctor_model.dart';
import 'package:gluco/features/home/presentation/view/widgets/card_of_search.dart';
import 'package:gluco/features/home/presentation/view/widgets/tick_heart.dart';
import 'package:gluco/features/home/presentation/view/widgets/tick_services.dart';
import 'package:gluco/features/home/presentation/view/widgets/time_line_cal_one.dart';
import 'package:gluco/features/home/presentation/view/widgets/two_square_container.dart';
import 'package:gluco/features/seacrh/presentation/view/search.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    // Assuming you have a list of DoctorModel objects
    final List<DoctorModel> doctorModels = [
      DoctorModel(
        userName: 'دكتور احمد ضاحي',
        phone: '0123456789',
        email: 'ahmed@example.com',
        address: 'Cairo, Egypt',
        appointment: 'السبت / 7 مساءا',
        detectionPrice: 90,
        doctorSpecialization: 'امراض القلب',
      ),
      // Add more doctor models here
    ];

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SearchScreen(),
                    ),
                  );
                },
                child: const CardOfSearch(),
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 16,
              ),
            ),
            const SliverToBoxAdapter(
              child: Text(
                'تتبع الانشطه',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
              ),
            ),
            const SliverToBoxAdapter(
              child: MyTimeLineCalender1(),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 24,
              ),
            ),
            const SliverToBoxAdapter(
              child: TwoSquareContainer(),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 24,
              ),
            ),
            const SliverToBoxAdapter(
              child: TicksOfHeart(),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 32,
              ),
            ),
            const SliverToBoxAdapter(
              child: Text(
                'الخدمات',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 8,
              ),
            ),
            SliverToBoxAdapter(
              child: TicksOfServices(doctorModels: doctorModels),
            ),
          ],
        ),
      ),
    );
  }
}
