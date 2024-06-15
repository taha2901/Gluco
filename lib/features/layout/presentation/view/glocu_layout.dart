import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gluco/features/chat/presentation/view/chat_home_screen.dart';
import 'package:gluco/features/layout/presentation/manager/layout_cubit/layout_cubit.dart';
import 'package:gluco/features/settings/presentation/view/profile_screen.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class GlucoLayout extends StatelessWidget {
  final String? name;
  const GlucoLayout({super.key, this.name});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LayoutCubit(),
      child: BlocConsumer<LayoutCubit, LayoutState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = LayoutCubit.get(context);
          return Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              leading: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ProfileScreen()),
                        );
                      },
                      child: const CircleAvatar(
                        radius: 20,
                        // child: Image.asset('assets/1.jpg'),
                      ),
                    ),
                  ),
                  // Expanded(
                  //   child: Padding(
                  //     padding: EdgeInsets.all(8.0),
                  //     child: Text(
                  //       'أهلا ${name}',
                  //       style: const TextStyle(
                  //           color: Colors.black,
                  //           fontSize: 13,
                  //           fontWeight: FontWeight.w600),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
              actions: [
                MaterialButton(
                  onPressed: () {},
                  child: const Icon(Iconsax.notification),
                ),
                MaterialButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ChatHomeScreen(),
                        ));
                  },
                  child: const Icon(Iconsax.messages_1_copy),
                )
              ],
            ),
           
           
            body: cubit.screens[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.currentIndex,
              onTap: (index) {
                cubit.changeBottomNavBar(index);
              },
              items: cubit.bottomItem,
              backgroundColor: const Color.fromRGBO(255, 255, 255, 0.5),
              selectedItemColor: Colors.blue,
              unselectedItemColor: Colors.grey,
            ),
          );
        },
      ),
    );
  }
}
