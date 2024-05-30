// import 'package:flutter/material.dart';

// class DoctorCard extends StatefulWidget {
//   DoctorCard(
//       {Key? key,
//       this.grade,
//       this.NameOfDoc,
//       this.TypeOfDoc,
//       this.DistanseOfDoc,
//       this.TimeOfDoc})
//       : super(key: key);
//   String? grade;
//   String? NameOfDoc;
//   String? TypeOfDoc;
//   String? DistanseOfDoc;
//   String? TimeOfDoc;

//   @override
//   State<DoctorCard> createState() => _DoctorCardState();
// }

// class _DoctorCardState extends State<DoctorCard> {
//   bool isFavorite = false;
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(left: 6, bottom: 20),
//       child: Card(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.end,
//           children: [
//             Stack(
//               children: [
//                 Image.asset(
//                   "assets/DoctorSaied.png",
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: CircleAvatar(
//                     backgroundColor: Color(0xFF000000),
//                     radius: 15,
//                     child: IconButton(
//                       icon: isFavorite
//                           ? Icon(Icons.favorite)
//                           : Icon(Icons.favorite_border),
//                       color: Colors.white,
//                       iconSize: 15,
//                       onPressed: () {
//                         setState(() {
//                           isFavorite = !isFavorite;
//                         });
//                       },
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.end,
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     Text(
//                       widget.grade!,
//                       style: const TextStyle(
//                         fontSize: 8,
//                         fontStyle: FontStyle.normal,
//                         fontWeight: FontWeight.w700,
//                         color: Color(0xFF000000),
//                       ),
//                     ),
//                     const Padding(
//                       padding: EdgeInsets.only(right: 40),
//                       child: Icon(
//                         Icons.star,
//                         size: 8,
//                         color: Color(0xFFFFCC70),
//                       ),
//                     ),
//                     Text(
//                       widget.NameOfDoc!,
//                       style: const TextStyle(
//                         fontSize: 12,
//                         fontStyle: FontStyle.normal,
//                         fontWeight: FontWeight.w700,
//                         color: Color(0xFF000000),
//                       ),
//                     ),
//                   ],
//                 ),
//                 Padding(
//                   padding:const EdgeInsets.only(right: 5),
//                   child: Text(
//                     widget.TypeOfDoc!,
//                     style: const TextStyle(
//                       fontSize: 12,
//                       fontStyle: FontStyle.normal,
//                       fontWeight: FontWeight.w400,
//                       color: Color(0xFF000000),
//                     ),
//                   ),
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     Text(
//                       widget.DistanseOfDoc!,
//                       style: const TextStyle(
//                         fontSize: 12,
//                         fontStyle: FontStyle.normal,
//                         fontWeight: FontWeight.w400,
//                         color: Color(0xFF000000),
//                       ),
//                     ),
//                     const Padding(
//                       padding: EdgeInsets.only(right: 5, left: 5),
//                       child: CircleAvatar(
//                         radius: 4.5,
//                         backgroundColor: Color(0xFF000000),
//                         child: Icon(Icons.location_on_sharp,
//                             size: 7, color: Color(0xFFFFCC70)),
//                       ),
//                     ),
//                   ],
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     Text(
//                       widget.TimeOfDoc!,
//                       style: const TextStyle(
//                         fontSize: 12,
//                         fontStyle: FontStyle.normal,
//                         fontWeight: FontWeight.w400,
//                         color: Color(0xFF000000),
//                       ),
//                     ),
//                     const Padding(
//                       padding: EdgeInsets.only(right: 5, left: 5),
//                       child: CircleAvatar(
//                           radius: 4.5,
//                           backgroundColor: Color(0xFF000000),
//                           child: Icon(
//                             Icons.access_time,
//                             size: 7,
//                             color: Color(0xFFFFCC70),
//                           ),),
//                     ),
//                   ],
//                 )
//               ],
//             )
//           ],
//         ),
//       ),
//     );

//   }
// }

import 'package:flutter/material.dart';

class DoctorCard extends StatelessWidget {
  const DoctorCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset("assets/DoctorSaied.png"),
            const Text('  د سعيد محمد'),
            const Text('  علاج طبيعي' ),
            const Text('  يبعد عنك 12 كيلو '),
            const Text('  10 ص ل 10 م'),
          ],
        ),
      ),
    );
  }
}
