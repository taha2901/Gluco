import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gluco/core/helper/api.dart';
import 'package:gluco/features/activities/data/pressurecheck.dart';
import 'package:gluco/features/activities/presentation/manager/presssure_check_states.dart';

class PresssureCheckCubit extends Cubit<PresssureCheckStates>{
  PresssureCheckCubit() : super(PresssureCheckinitial());

  Future<void> fetchpressuredata(String date)async
  {
    List<Pressurecheck> pressurdata=[];
    List<int> heart=[];
    List<int> diastolic_pressur=[];
    List<int> systolic_pressure=[];

    var respons= await DioHelper().fetchData(
      url: 'http://nouraapi.runasp.net/api/Selecting_data/user\'s presure_data?specificDate=$date', 
      token: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1laWRlbnRpZmllciI6IjFhNDJkNzQ2LTZjOTgtNDY4Ny04MjE4LWJiMjJkZmIzYTZhYSIsInN1YiI6IkhlbmRhYmRlbG1vbmVtIiwianRpIjoiNTBlNDZkY2UtMTNhMS00OTIyLThjOWEtYmY0ZWMzNGEzNzc2IiwiZW1haWwiOiJoZW5kYWJkZWxtb25lbUBnbWFpbC5jb20iLCJ1aWQiOiIxYTQyZDc0Ni02Yzk4LTQ2ODctODIxOC1iYjIyZGZiM2E2YWEiLCJyb2xlcyI6WyJGb2xsb3dlciIsIlVzZXIiXSwiZXhwIjoxNzIxNzQ4NDQ4LCJpc3MiOiJTZWN1cmVBcGkiLCJhdWQiOiJTZWN1cmVBcGlVc2VyIn0.U0zJKjFOmGpT3v_n6zeVt0A_vC7uW2q8WQtNOq3K5sw'
      );
      var data=respons.data;
      if(respons.statusCode==200 && data!=null)
      {
        for(int i=0;i<data.length;i++)
        {
          pressurdata.add(Pressurecheck.fromJson(data[i]));
        }
      }
      if(pressurdata.isNotEmpty){
        for(int i=0;i<pressurdata.length;i++)
        {
          heart.add(pressurdata[i].heartrate!);
          diastolic_pressur.add(pressurdata[i].diastolicpressure!);
          systolic_pressure.add(pressurdata[i].systolicpressure!);
        }
        emit(haveData(diastolic_pressur,systolic_pressure,heart,pressurdata));
      }
      else
      {
        emit(nothaveData());
      }
  }
  


}