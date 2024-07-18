import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gluco/core/helper/cach.dart';
import 'package:gluco/core/widgets/constants.dart';
import 'package:gluco/features/chat_bot/my_bot.dart';
import 'package:gluco/features/layout/presentation/manager/layout_cubit/layout_cubit.dart';
import 'package:gluco/features/settings/presentation/view/profile_screen.dart';
import 'package:gluco/features/social_media/presentation/manager/provider/user_provider.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:gluco/features/auth/data/auth.dart';
import 'package:provider/provider.dart';

class GlucoLayout extends StatefulWidget {
  final Auth auth;
  final String? imagePath; // استلام مسار الصورة هنا

  const GlucoLayout({Key? key, required this.auth, this.imagePath})
      : super(key: key);

  @override
  State<GlucoLayout> createState() => _GlucoLayoutState();
}

class _GlucoLayoutState extends State<GlucoLayout> {
  @override
  void initState() {
    Provider.of<UserProvider>(context, listen: false).getDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var myPic = ChachHelper.getData(key: 'photoUrl');
    return BlocProvider(
      create: (context) => LayoutCubit(widget.auth),
      child: BlocConsumer<LayoutCubit, LayoutState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = LayoutCubit.get(context);
          bool showAppBar = true; // افتراضياً نعرض AppBar

          // تحديد ما إذا كان يجب عرض AppBar بناءً على الصفحة الحالية
          if (cubit.currentIndex == 4) {
            // SocialView
            showAppBar = false;
          } else {
            showAppBar = true;
          }

          return Scaffold(
            backgroundColor: Colors.transparent,
            appBar: showAppBar
                ? AppBar(
                    backgroundColor: Colors.white,
                    leading: Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ProfileScreen(
                                    imagePath: widget.imagePath,
                                  ),
                                ),
                              );
                            },
                            child: CircleAvatar(
                              radius: 20,
                              backgroundImage: widget.imagePath != null
                                  ? FileImage(File(widget.imagePath!))
                                  : (myPic != null && myPic is String
                                      ? NetworkImage(myPic)
                                      : null),
                              child: (widget.imagePath == null && myPic == null)
                                  ? const Icon(Icons.person)
                                  : null,
                            ),
                          ),
                        ),
                      ],
                    ),
                    actions: [
                      MaterialButton(
                        onPressed: () {},
                        child: const SizedBox(
                          width: 40,
                          height: 40,
                          child: CircleAvatar(
                            radius: 19,
                            backgroundColor: kSecondaryColor,
                            child: Icon(
                              Iconsax.notification,
                              color: kPrimaryTextColor,
                              size: 20,
                            ),
                          ),
                        ),
                      ),
                      MaterialButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const MyBot(),
                            ),
                          );
                        },
                        child: const SizedBox(
                          width: 40,
                          height: 40,
                          child: CircleAvatar(
                            radius: 19,
                            backgroundColor: kSecondaryColor,
                            child: Icon(
                              Iconsax.messages_1_copy,
                              color: kPrimaryTextColor,
                              size: 20,
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                : null, // إذا كانت الصفحة SocialView فلا تعرض AppBar
            body: cubit.screens[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.currentIndex,
              onTap: (index) {
                cubit.changeBottomNavBar(index);
              },
              items: cubit.bottomItem,
              backgroundColor: Colors.white,
              selectedItemColor: Colors.blue,
              unselectedItemColor: Colors.grey,
            ),
          );
        },
      ),
    );
  }
}
