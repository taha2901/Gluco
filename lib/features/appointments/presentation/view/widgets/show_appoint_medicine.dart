
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ShowAppointMedicine extends StatelessWidget {
  const ShowAppointMedicine({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Card(
        color: Colors.grey,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundColor: Colors.amber,
                radius: 25,
                backgroundImage: AssetImage('assets/images/pose_2.png'),
              ),
              SizedBox(
                width: 18,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'انتينال',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text('قبل الغذاء كبسوله واحده الساعه 4 مساءا'),
                ],
              ),
              Spacer(),
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Icon(FontAwesomeIcons.ellipsis),
              ),
            ],
          ),
        ));
  }
}
