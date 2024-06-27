// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:gluco/features/settings/data/get_favourite/get_favourite.dart';
// import 'package:gluco/features/settings/presentation/manager/fav_cubit/fav_cubit.dart';

// class FavouriteDoctors extends StatelessWidget {
//   const FavouriteDoctors({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final GetFavourite fav;
//     return BlocConsumer<GetFavCubit, GetFavState>(
//       listener: (context, state) {
        
//       },
//       builder: (context, state) {
//          return Scaffold(
//             appBar: AppBar(
//               title: Text('الأطباء المفضلين'),
//             ),
//             body: ListView.builder(
//               itemBuilder: (context, index) {
//                 return FavWidget(fav: fav[index],);
//               },
//             ),
//           );
//       },
//     );
//   }
// }

// class FavWidget extends StatelessWidget {
//   const FavWidget({
//     Key? key,
//     required this.fav,
//   }) : super(key: key);

//   final GetFavourite fav;

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       child: ListTile(
//         leading: CircleAvatar(
//           backgroundImage: NetworkImage(fav.doctor!.photo ?? ''),
//         ),
//         title: Text(fav.doctor!.userName ?? ''),
//         subtitle: Text(fav.doctor!.doctorspecialization ?? ''),
//         onTap: () {
//           // Handle onTap if needed
//         },
//       ),
//     );
//   }
// }
