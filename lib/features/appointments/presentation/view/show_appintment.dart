import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gluco/features/appointments/presentation/view/add_appointments.dart';

class ShowAppointment extends StatelessWidget {
  const ShowAppointment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text('مواعيد الأدويه'),
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AddAppointments(),
                ));
          }),
      body: const Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text('اليوم'),
          SizedBox(
            height: 16,
          ),
          ShowAppointMedicine(),
          ShowAppointMedicine(),
          ShowAppointMedicine(),
        ],
      ),
    );
  }
}

class ShowAppointMedicine extends StatelessWidget {
  const ShowAppointMedicine({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: Card(
          color: Colors.grey,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Icon(FontAwesomeIcons.ellipsis),
                ),
                Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'انتينال',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text('قبل الغذاء كبسوله واحده الساعه 4 مساءا'),
                  ],
                ),
                SizedBox(
                  width: 8,
                ),
                CircleAvatar(
                  backgroundColor: Colors.amber,
                  radius: 25,
                  backgroundImage: AssetImage('assets/images/pose_2.png'),
                ),
              ],
            ),
          )),
    );
  }
}
