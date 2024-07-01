import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gluco/features/activities/presentation/view/Activities.dart';
import 'package:gluco/features/appointments/presentation/view/show_appintment.dart';
import 'package:gluco/features/auth/data/auth.dart';
import 'package:gluco/features/home/presentation/view/home_view.dart';
import 'package:gluco/features/pic_products/presentation/view/pic_products.dart';
import 'package:gluco/features/social/presentation/view/social_view.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

part 'layout_state.dart';

class LayoutCubit extends Cubit<LayoutState> {
  final Auth auth;
  String? imagePath;
  late final List<Widget> screens;

  LayoutCubit(this.auth) : super(LayoutInitial()) {
    screens = [
      const HomeView(),
      const PicProductsView(),
      const ShowAppointment(),
      const Activities(),
      SocialView(auth: auth),
    ];
  }

  static LayoutCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  void changeBottomNavBar(int index) {
    currentIndex = index;
    emit(LayoutChangeBottomNavBarState());
  }

  void setImagePath(String? path) {
    imagePath = path;
    emit(LayoutImageChangedState());
  }

  List<BottomNavigationBarItem> bottomItem = [
    const BottomNavigationBarItem(
      icon: Icon(Iconsax.home),
      label: 'الرئيسيه',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Iconsax.camera),
      label: 'تصوير منتجات',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Iconsax.timer_start_copy),
      label: 'توقيتات',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Iconsax.activity),
      label: 'االانشطه',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Iconsax.user_octagon_copy),
      label: 'التواصل', 
    ),
  ];
}
