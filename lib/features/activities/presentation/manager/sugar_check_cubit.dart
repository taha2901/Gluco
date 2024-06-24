import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gluco/core/helper/api.dart';
import 'package:gluco/features/activities/data/Sugarcheck.dart';
import 'package:gluco/features/activities/presentation/manager/sugar_check_states.dart';

class SugarCheckCubit extends Cubit<SugarCheckStates>{
  SugarCheckCubit() : super(SugarCheckinitial());
  double? maxSugarLevel;
  double? minSugarLevel;

  Future<List<Sugarcheck>> fetchsugardata(String date)async
  {
    List<Sugarcheck> sugardata=[];
    var respons= await DioHelper().fetchData(
      url: 'http://nouraapi.runasp.net/api/Selecting_data/user\'s sugar_data?specificDate=$date', 
      token:'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1laWRlbnRpZmllciI6IjFhNDJkNzQ2LTZjOTgtNDY4Ny04MjE4LWJiMjJkZmIzYTZhYSIsInN1YiI6IkhlbmRhYmRlbG1vbmVtIiwianRpIjoiNTBlNDZkY2UtMTNhMS00OTIyLThjOWEtYmY0ZWMzNGEzNzc2IiwiZW1haWwiOiJoZW5kYWJkZWxtb25lbUBnbWFpbC5jb20iLCJ1aWQiOiIxYTQyZDc0Ni02Yzk4LTQ2ODctODIxOC1iYjIyZGZiM2E2YWEiLCJyb2xlcyI6WyJGb2xsb3dlciIsIlVzZXIiXSwiZXhwIjoxNzIxNzQ4NDQ4LCJpc3MiOiJTZWN1cmVBcGkiLCJhdWQiOiJTZWN1cmVBcGlVc2VyIn0.U0zJKjFOmGpT3v_n6zeVt0A_vC7uW2q8WQtNOq3K5sw'
      );
      var data=respons.data;
      if(respons.statusCode==200 && data!=null)
      {
        for(int i=0;i<data.length;i++)
        {
          sugardata.add(Sugarcheck.fromJson(data[i]));
        }
      }
      
    return sugardata;
  }
  Future<void> getsugarlevel(String date) async {
  List<Sugarcheck> sugardata = [];
  List<int> sugarlevel = [];
    sugardata = await fetchsugardata(date);
    for (int i = 0; i < sugardata.length; i++) { // Use '<' instead of '<='
      sugarlevel.add(sugardata[i].sugar_reading!);
    }
    if(sugardata.isNotEmpty)
    {
      List<double> sugardataDouble = sugarlevel!.map((e) => e.toDouble()).toList();
      emit(haveData(sugardataDouble,sugardata));
      
    }
    else
    {
      emit(nothaveData());
    }
}


}