import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gluco/features/home/presentation/view/widgets/custom_icon.dart';
import 'package:gluco/features/layout/presentation/manager/layout_cubit/layout_cubit.dart';

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
              leading: CustomIcon(
                onTap: () {},
                icon: Icons.facebook_outlined,
                color: Colors.black.withOpacity(0.1),
                colorIcon: Colors.black,
              ),
              actions: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'أهلا طه',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //       builder: (context) => const ProfileScreen()),
                    // );
                  },
                  child: CircleAvatar(
                    radius: 20,
                    child: Image.asset('assets/1.jpg'),
                  ),
                ),
              ],
            ),
            body: cubit.screens[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.currentIndex,
              onTap: (index) {
                cubit.changeBottomNavBar(index);
              },
              items: cubit.bottomItem,
              backgroundColor: Color.fromRGBO(255, 255, 255, 0.5),
              selectedItemColor: Colors.blue,
              unselectedItemColor: Colors.grey,
            ),
          );
        },
      ),
    );
  }
}
