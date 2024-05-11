import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gluco/features/activities/presentation/view/Activities.dart';
import 'package:gluco/features/appointments/presentation/view/show_appintment.dart';
import 'package:gluco/features/category/presentation/view/category.dart';
import 'package:gluco/features/chat_bot/my_bot.dart';
import 'package:gluco/features/favourite/presentation/view/favourite.dart';
import 'package:gluco/features/home/presentation/view/home_view.dart';
import 'package:gluco/features/settings/presentation/view/profile_screen.dart';

part 'layout_state.dart';

class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit() : super(LayoutInitial());
  static LayoutCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<Widget> screens = [
    const HomeView(),
    const Category(),
    const Favourite(),
    const ProfileScreen(),
    const ShowAppointment(),
    const MyBot(),
    const Activities()
  ];

  void changeBottomNavBar(int index) {
    currentIndex = index;
    emit(ShopBottomNavbar());
  }

  List<BottomNavigationBarItem> bottomItem = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Home',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.apps),
      label: 'Categories',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.favorite),
      label: 'Favorite',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.settings),
      label: 'Settings',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.timer),
      label: 'appointmets',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.bolt),
      label: 'Gluco Bot',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.local_activity),
      label: 'Activities',
    ),
  ];
}
