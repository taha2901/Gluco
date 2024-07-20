// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:gluco/core/helper/cach.dart';
// import 'package:gluco/features/layout/presentation/manager/layout_cubit/layout_cubit.dart';
// import 'package:gluco/features/settings/presentation/manager/profile_cubit/profile_cubit.dart';
// import 'package:gluco/features/settings/presentation/view/widget/form_profile.dart';

// class ProfileScreen extends StatelessWidget {
//   const ProfileScreen({super.key, this.imagePath});
//   final String? imagePath;

//   @override
//   Widget build(BuildContext context) {
//     var myPic = ChachHelper.getData(key: 'photoUrl');
//     final cubit = context.read<LayoutCubit>();
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         title: const Text(
//           'Profile',
//           style: TextStyle(color: Colors.black),
//         ),
//         iconTheme: const IconThemeData(color: Colors.black),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               Row(
//                 children: [
//                   CircleAvatar(
//                     radius: 60,
//                     backgroundImage: imagePath != null
//                         ? FileImage(File(imagePath!))
//                         : (myPic != null && myPic is String
//                             ? NetworkImage(myPic)
//                             : null),
//                     child: (imagePath == null && myPic == null)
//                         ? const Icon(Icons.person)
//                         : null,
//                   ),
//                   const SizedBox(
//                     width: 10,
//                   ),
//                   BlocBuilder<ProfileCubit, ProfileState>(
//                     builder: (context, state) {
//                       if (state is ProfileLoaded) {
//                         return const CircularProgressIndicator();
//                       } else if (state is ProfileSuccess) {
//                         return Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               state.profileModel.phone ?? '',
//                               style: const TextStyle(
//                                   fontSize: 16, fontWeight: FontWeight.bold),
//                             ),
//                             const SizedBox(
//                               height: 10,
//                             ),
//                             Text(
//                               state.profileModel.username ?? '',
//                               style: const TextStyle(
//                                   fontSize: 20, fontWeight: FontWeight.bold),
//                             ),
//                           ],
//                         );
//                       } else if (state is ProfileFailure) {
//                         return Text(
//                           'Error: ${state.errMessage}',
//                           style: TextStyle(color: Colors.red),
//                         );
//                       } 
//                       else {
//                         return ElevatedButton(
//                           onPressed: () {
//                             ProfileCubit.get(context).getUserData();
//                           },
//                           child: Text('Get User Data'),
//                         );
//                       }
//                     },
//                   ),
//                 ],
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               // Display the user's form to edit their profile.
//               const FormProfile(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gluco/core/helper/cach.dart';
import 'package:gluco/features/layout/presentation/manager/layout_cubit/layout_cubit.dart';
import 'package:gluco/features/settings/presentation/manager/profile_cubit/profile_cubit.dart';
import 'package:gluco/features/settings/presentation/view/widget/form_profile.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key, this.imagePath});
  final String? imagePath;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit()..getUserData(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            'Profile',
            style: TextStyle(color: Colors.black),
          ),
          iconTheme: const IconThemeData(color: Colors.black),
        ),
        body: BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
            if (state is ProfileLoaded) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ProfileSuccess) {
              var profileModel = state.profileModel;
              var myPic = ChachHelper.getData(key: 'photoUrl');

              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 60,
                            backgroundImage: imagePath != null
                                ? FileImage(File(imagePath!))
                                : (myPic != null && myPic is String
                                    ? NetworkImage(myPic)
                                    : null),
                            child: (imagePath == null && myPic == null)
                                ? const Icon(Icons.person)
                                : null,
                          ),
                          const SizedBox(width: 10),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                profileModel.phone.toString(),
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                profileModel.username.toString(),
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      // Display the user's form to edit their profile.
                      const FormProfile(),
                    ],
                  ),
                ),
              );
            } else if (state is ProfileFailure) {
              return Center(child: Text(state.errMessage));
            } else {
              return const Center(child: Text('Unexpected state'));
            }
          },
        ),
      ),
    );
  }
}
