import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gluco/core/helper/api.dart';
import 'package:gluco/features/activities/data/Weightcheck.dart';
import 'package:gluco/features/activities/presentation/manager/weight_check_states.dart';

class WeightCheckCubit extends Cubit<WeightCheckStates>{
  WeightCheckCubit() : super(WeightCheckinitial());

  Future<void> fetchweightdata(String date)async
  {
    List<Weightcheck> weightdata=[];
    List<int> weight=[];

    var respons= await DioHelper().fetchData(
      url: 'http://nouraapi.runasp.net/api/Selecting_data/user\'s weight_data?specificDate=$date', 
      token: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1laWRlbnRpZmllciI6IjFhNDJkNzQ2LTZjOTgtNDY4Ny04MjE4LWJiMjJkZmIzYTZhYSIsInN1YiI6IkhlbmRhYmRlbG1vbmVtIiwianRpIjoiNTBlNDZkY2UtMTNhMS00OTIyLThjOWEtYmY0ZWMzNGEzNzc2IiwiZW1haWwiOiJoZW5kYWJkZWxtb25lbUBnbWFpbC5jb20iLCJ1aWQiOiIxYTQyZDc0Ni02Yzk4LTQ2ODctODIxOC1iYjIyZGZiM2E2YWEiLCJyb2xlcyI6WyJGb2xsb3dlciIsIlVzZXIiXSwiZXhwIjoxNzIxNzQ4NDQ4LCJpc3MiOiJTZWN1cmVBcGkiLCJhdWQiOiJTZWN1cmVBcGlVc2VyIn0.U0zJKjFOmGpT3v_n6zeVt0A_vC7uW2q8WQtNOq3K5sw'
      );
      var data=respons.data;
      if(respons.statusCode==200 && data!=null)
      {
        for(int i=0;i<data.length;i++)
        {
          weightdata.add(Weightcheck.fromJson(data[i]));
        }
      }
      print(weightdata);
      if(weightdata.isNotEmpty)
      {
        for(int i=0;i<weightdata.length;i++)
        {
          weight.add(weightdata[i].weight!);
          
        }
        print(weight);
        emit(haveData(weight,weightdata));

      }
      else{
        emit(nothaveData());
      }
  }
  


}