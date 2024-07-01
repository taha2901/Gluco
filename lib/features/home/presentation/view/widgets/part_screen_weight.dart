
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gluco/core/widgets/custom_button.dart';
import 'package:gluco/core/widgets/custom_show_toast.dart';
import 'package:gluco/features/activities/presentation/manager/weight_cubit/weight_check_cubit.dart';
import 'package:gluco/features/activities/presentation/manager/weight_cubit/weight_check_states.dart';
import 'package:gluco/features/activities/presentation/view/widgets/WeightChart.dart';
import 'package:gluco/features/activities/presentation/view/widgets/chartempty.dart';
import 'package:gluco/features/home/presentation/manager/sport_cubit/sport_cubit.dart';
import 'package:gluco/features/home/presentation/manager/sport_cubit/sport_state.dart';
import 'package:gluco/features/home/presentation/view/widgets/TextFieldNumber.dart';
import 'package:gluco/features/home/presentation/view/widgets/drop_down_activity.dart';

class PartScreenWeight extends StatelessWidget {
  String? Text1;
  String? Text2;
  String Text3;
  String? selectedActivity;
  var weight= TextEditingController();
  PartScreenWeight(this.Text2, this.Text3);
  TextEditingController? controller;
void _onActivityChanged(String? value) {
    
      selectedActivity = value;

  }
GlobalKey<FormState> valid=GlobalKey();
  @override
  
  Widget build(BuildContext context) {
    DateTime currentDate = DateTime.now();
    String formattedDate =
        "${currentDate.year}-${currentDate.month}-${currentDate.day}";
    return MultiBlocProvider(
      providers: [
        BlocProvider(create:(context)=>SportCubit()),
        BlocProvider(create:(context)=>WeightCheckCubit()..fetchweightdata(formattedDate))

      ],
      child: SingleChildScrollView(
        child: Column(
          children: [
            BlocConsumer<SportCubit,SportState>(
            builder: (context, state){
           return Column(
            children: [
      Form(
        key: valid,
        child: Padding(
          padding: const EdgeInsets.only(top: 24),
          child: Column(
            children: [
              Textfieldnumber(Text2, Text3, weight),
              const SizedBox(height: 16,),
              DropdownActivity(onChanged: _onActivityChanged,),
            ],
          ),
        ),
      ),
      const SizedBox(height: 24,),
      Column(
        children: [
          CustomButton(
            text: 'حفظ',
            circular: 5,
            color: Colors.blue,
            textcolor: Colors.white,
            onTap: () {
              if(valid.currentState!.validate())
              {
                BlocProvider.of<SportCubit>(context).sport(
                  weight.text.toString(), 
                  selectedActivity!
                  );
                   BlocProvider.of<WeightCheckCubit>(context).fetchweightdata(formattedDate);
                  print(state);
            }
            }
          ),
        ],
      ),
            ]);
        },
        listener: (context, state) {
          if(state is Sportsuccess)
          {
            
           showToast(msg: "added", state: ToastStates.SUCCESS);
          }
          else if(state is Sporterror)
          {
            showToast(msg: state.errormessage, state: ToastStates.ERROR);
          }
          else{
            const Center(child: CircularProgressIndicator());
          }
          
        },
        ),
        BlocConsumer<WeightCheckCubit,WeightCheckStates>(
                builder:(context,state){
                  if(state is WeightCheckloading)
                  {
                    return const Center(child: CircularProgressIndicator(),);
                  }
                  else if(state is haveData)
                  {
                    List<FlSpot> spots = state.weight.asMap().entries.map((entry) {
                        int index = entry.key;
                        double value = entry.value.toDouble();
                        return FlSpot(index.toDouble(), value);
                      }).toList();
                      print(spots);
                    return Column(
                        children: [
                          SizedBox(
                             width: double.infinity,
                            height: 300,
                            child: Weightchart(spots)
                            ),
                        ],);
                  }
                  else{
                    return SizedBox(
                        width: double.infinity,
                        height: 300,
                        child: Chartempty()
                        );
                  }
                }, 
                listener: (context,state){}),




          ],
          ),
      )
      );
  }
}
