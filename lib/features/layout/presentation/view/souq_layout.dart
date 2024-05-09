import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
              title: Text('Hi ${name} ' ?? 'salla'),
              actions: [
                IconButton(
                  onPressed: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => const SearchScreen(),
                    //   ),
                    // );
                  },
                  icon: const Icon(Icons.search),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.logout_outlined),
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
              selectedItemColor: Colors.blue, // لون العنصر المحدد
              unselectedItemColor: Colors.grey,
            ),
          );
        },
      ),
    );
  }
}
