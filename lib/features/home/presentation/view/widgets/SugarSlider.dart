import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class Sugarslider extends StatelessWidget {
   Sugarslider({this.beforemeal,this.aftermeal,this.before,this.after});
double? beforemeal;
double? aftermeal;
String? before;
String? after;
  @override
  Widget build(BuildContext context) {
    return Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              CircularPercentIndicator(
                radius: 58.0, // Outer circle with a larger radius
                lineWidth: 8.0,
                percent: aftermeal?? 0.0,
                center: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("$before/",style: TextStyle(
                      color: Colors.red
                    ),),
                    Text("$after",style: TextStyle(
                      color: Color.fromARGB(255, 4, 107, 192)
                    ),)
                  ],
                ),
                progressColor: Color.fromARGB(255, 4, 107, 192),
              ),
              CircularPercentIndicator(
                radius: 50.0, // Outer circle with a larger radius
                lineWidth: 8.0,
                percent: beforemeal?? 0.0,
                progressColor: Colors.red,
              ),

            ],)
        );
  }
}