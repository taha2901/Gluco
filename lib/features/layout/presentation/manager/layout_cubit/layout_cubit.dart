import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gluco/features/activities/presentation/view/Activities.dart';
import 'package:gluco/features/appointments/presentation/view/show_appintment.dart';
import 'package:gluco/features/chat_bot/my_bot.dart';
import 'package:gluco/features/home/presentation/view/home_view.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

part 'layout_state.dart';

class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit() : super(LayoutInitial());
  static LayoutCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<Widget> screens = [
    const HomeView(),
     Container(),
    const ShowAppointment(),
    const Activities(),
    const MyBot(),
  ];

  void changeBottomNavBar(int index) {
    currentIndex = index;
    emit(ShopBottomNavbar());
  }

  List<BottomNavigationBarItem> bottomItem = [
    const BottomNavigationBarItem(
      icon: Icon(Iconsax.home),
      label: 'الرئيسيه',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.camera_alt_rounded),
      label: 'camera',
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
      icon: Icon(Icons.chat),
      label: 'جلوكو بوت',
    ),
  ];
}
