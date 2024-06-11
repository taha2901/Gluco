import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gluco/features/home/data/doctor_model/doctor_model.dart';
import 'package:gluco/features/home/data/doctor_offer.dart';
import 'package:gluco/features/home/presentation/manager/cubit/doctor_cubit.dart';
import 'package:gluco/features/home/presentation/view/widgets/BarApp.dart';
import 'package:gluco/features/home/presentation/view/widgets/DoctorCard.dart';
import 'package:gluco/features/home/presentation/view/widgets/DoctorList.dart';
import 'package:gluco/features/home/presentation/view/widgets/DoctorOffer.dart';
import 'package:gluco/features/home/presentation/view/widgets/custom_text_field_center_text.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

// class Doctor extends StatelessWidget {
//   Doctor({super.key, required this.doctorModels});
//   final List<DoctorModel> doctorModels;

//   final List<DoctorOfferModel> offer = [
//     DoctorOfferModel(
//       price: 'الكشف بنصف الثمن 90 جنيه',
//       time: 'السبت / 7 مساءا',
//       title: '(امراض القلب) دكتور احمد ضاحي',
//       image: 'assets/DoctorAhmed.png',
//     ),
//     DoctorOfferModel(
//       price: 'الكشف بنصف الثمن 150 جنيه',
//       time: 'السبت / 10 مساءا',
//       title: 'دكتور طارق احمد',
//       image: 'assets/DoctorAhmed.png',
//     ),
//     DoctorOfferModel(
//       price: 'الكشف ب 90 جنيه',
//       time: 'السبت / 7 مساءا',
//       title: 'دكتور روماني ',
//       image: "assets/DoctorAhmed.png",
//     ),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     var boardController = PageController();
//     return Scaffold(
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.only(right: 15, left: 15, top: 15),
//           child: CustomScrollView(
//             slivers: [
//               const SliverToBoxAdapter(
//                 child: BarApp(),
//               ),
//               const SliverToBoxAdapter(
//                 child: SizedBox(
//                   height: 16,
//                 ),
//               ),
//               const SliverToBoxAdapter(
//                 child: CustomTextFieldCenterlable(
//                   hint: 'بحث',
//                   fillColor: Colors.white,
//                   prefixIcon: FontAwesomeIcons.bars,
//                   suffixIcon: Iconsax.search_normal_copy,
//                 ),
//               ),
//               const SliverToBoxAdapter(
//                 child: SizedBox(
//                   height: 16,
//                 ),
//               ),
//               const SliverToBoxAdapter(
//                 child: Text(
//                   "العروض",
//                   textAlign: TextAlign.right,
//                   style: TextStyle(
//                     fontWeight: FontWeight.w600,
//                     color: Color(0xFF000000),
//                     fontSize: 18,
//                   ),
//                 ),
//               ),
//               const SliverToBoxAdapter(
//                 child: DoctorOffer(),
//               ),
//               const SliverToBoxAdapter(
//                 child: SizedBox(
//                   height: 16,
//                 ),
//               ),
//               const SliverToBoxAdapter(
//                 child: Text(
//                   "المفضله",
//                   style: TextStyle(
//                     fontWeight: FontWeight.w600,
//                     fontSize: 18,
//                   ),
//                 ),
//               ),
//               SliverToBoxAdapter(
//                 child: SizedBox(
//                   height: MediaQuery.of(context).size.height * 0.23,
//                   child: ListView.builder(
//                     scrollDirection: Axis.horizontal,
//                     itemCount: doctorModels.length,
//                     itemBuilder: (context, index) {
//                       return DoctorCard(
//                         doc: doctorModels[index],
//                       );
//                     },
//                   ),
//                 ),
//               ),
//               const SliverToBoxAdapter(
//                 child: SizedBox(
//                   height: 16,
//                 ),
//               ),
//               const SliverToBoxAdapter(
//                 child: Text(
//                   "الاكثر شهره",
//                   style: TextStyle(
//                     fontWeight: FontWeight.w600,
//                     color: Color(0xFF000000),
//                     fontSize: 18,
//                   ),
//                 ),
//               ),
//               const SliverToBoxAdapter(
//                 child: DoctorList(),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }




class Doctor extends StatelessWidget {
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
                  suffixIcon: Iconsax.search_normal_copy,
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 16,
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
                child: SizedBox(
                  height: 16,
                ),
              ),
              const SliverToBoxAdapter(
                child: Text(
                  "المفضله",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                ),
              ),
              BlocBuilder<DoctorCubit, DoctorState>(
                builder: (context, state) {
                  if (state is DoctorssLoadingState) {
                    return const SliverToBoxAdapter(
                      child: Center(child: CircularProgressIndicator()),
                    );
                  } else if (state is DoctorsSuccessState) {
                    return SliverToBoxAdapter(
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.23,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: state.doctorModels.length,
                          itemBuilder: (context, index) {
                            return DoctorCard(doc: state.doctorModels[index]);
                          },
                        ),
                      ),
                    );
                  } else if (state is DoctorsErrorState) {
                    return SliverToBoxAdapter(
                      child: Center(child: Text(state.error)),
                    );
                  } else {
                    return const SliverToBoxAdapter(
                      child: Center(child: Text('Unknown state')),
                    );
                  }
                },
              ),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 16,
                ),
              ),
              const SliverToBoxAdapter(
                child: Text(
                  "الاكثر شهره",
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
