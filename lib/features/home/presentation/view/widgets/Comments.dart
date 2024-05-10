import 'package:flutter/material.dart';
class Comments extends StatelessWidget {
  const Comments({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const Divider(
          thickness: 1,
          color: Colors.black,
          height: 10,
        ),
       Row(
         mainAxisAlignment: MainAxisAlignment.end,
         children: [
           const Padding(
             padding: EdgeInsets.only(right: 13),
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.end,
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Row(
                   mainAxisAlignment: MainAxisAlignment.end,
                   crossAxisAlignment: CrossAxisAlignment.center,
                   children: [
                     Text("12/9/2023 -"),
                     Text("محمد السيد"),
                   ],
                 ),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.end,
                   crossAxisAlignment: CrossAxisAlignment.end,
                   mainAxisSize: MainAxisSize.min,
                   children: [
                     Icon(Icons.star_border,size: 12,color: Color(0xFFFFCC70)),
                      Icon(Icons.star_border,size: 12,color: Color(0xFFFFCC70)),
                     Icon(Icons.star_border,size: 12,color: Color(0xFFFFCC70)),
                     Icon(Icons.star_border,size: 12,color: Color(0xFFFFCC70)),
                     Icon(Icons.star_border,size: 12,color: Color(0xFFFFCC70)),
                   ],
                 )
               ],
             ),
           ),
           Column(
             crossAxisAlignment: CrossAxisAlignment.end,
             children: [
               Image.asset('assets/Ellipse 114.png',height: 40,width: 40,)
             ],
           ),
           
         ],
       ),
        const Padding(
          padding: EdgeInsets.only(right: 19),
          child: Text( "دكتور سعيد من احسن دكاتره الباطنى الى اتعاملت معاهم كويس جدا ومريح فى التعامل",
            textAlign: TextAlign.end,
          ),
        )
      ],
    );
  }
}
