import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gluco/features/home/presentation/view/widgets/tick_heart.dart';
import 'package:gluco/features/home/presentation/view/widgets/tick_services.dart';
import 'package:gluco/features/home/presentation/view/widgets/time_line_cal_one.dart';
import 'package:gluco/features/home/presentation/view/widgets/two_square_container.dart';
import 'package:gluco/features/seacrh/presentation/view/search.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              // child: GestureDetector(
              //   onTap: () {
              //     Navigator.push(context, MaterialPageRoute(builder: (context) => const SearchScreen(),));
              //   },
              //   child: Card(
              //     child: const CustomTextFieldCenterlable(
              //       hint: 'بحث',
              //       fillColor: Colors.white,
              //       prefixIcon: Icons.account_balance_wallet_rounded,
              //       suffixIcon: Icons.search,
              //     ),
              //   ),
              // ),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SearchScreen(),
                    ),
                  );
                },
                child: const Card(
                  child: Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Iconsax.search_normal_copy),
                        Text(
                          'بحث',
                          style: TextStyle(fontSize: 22),
                        ),
                        Icon(Iconsax.square_copy),
                      ],
                    ),
                  ),
                ),
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
            const SliverToBoxAdapter(
              child: TicksOfServices(),
            ),
          ],
        ),
      ),
    );
  }
}
