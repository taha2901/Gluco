import 'package:flutter/material.dart';
import 'package:gluco/core/widgets/custom_text_field.dart';
import 'package:gluco/features/home/presentation/view/widgets/custom_text_field_center_text.dart';
import 'package:gluco/features/home/presentation/view/widgets/tick_heart.dart';
import 'package:gluco/features/home/presentation/view/widgets/tick_services.dart';
import 'package:gluco/features/home/presentation/view/widgets/time_line_cal_one.dart';
import 'package:gluco/features/home/presentation/view/widgets/two_square_container.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: CustomTextFieldCenterlable(
                hint: 'بحث',
                fillColor: Colors.white,
                prefixIcon: Icons.account_balance_wallet_rounded,
                suffixIcon: Icons.search,
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 16,
              ),
            ),
            SliverToBoxAdapter(
              child: Text(
                'تتبع الانشطه',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
              ),
            ),
            SliverToBoxAdapter(
              child: MyTimeLineCalender1(),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 24,
              ),
            ),
            SliverToBoxAdapter(
              child: TwoSquareContainer(),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 24,
              ),
            ),
            SliverToBoxAdapter(
              child: TicksOfHeart(),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 32,
              ),
            ),
            SliverToBoxAdapter(
              child: Text(
                'الخدمات',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 8,
              ),
            ),
            SliverToBoxAdapter(
              child: TicksOfServices(),
            ),
          ],
        ),
      ),
    );
  }
}
