
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gluco/core/helper/api.dart';
import 'package:dio/dio.dart';
import 'package:gluco/core/helper/serverfailure.dart';
import 'package:gluco/features/home/presentation/manager/pressure_cubit/pressure_state.dart';

class PressureCubit extends Cubit<PressureState> {
  PressureCubit() : super(Pressuresuccess());
  void pressure(
    String contraction,
    String extraversion,
    String heart
  )async{
      emit(Pressureloading());
      try{
       var data= await DioHelper().addData(
        url: 'http://nouraapi.runasp.net/api/Measurements/blood pressure', 
        body: {
                "diastolic_pressure": contraction,
                "systolic_pressure": extraversion,
                "heart_rate": heart
              }, 
              Contenttype: 'application/json', 
              token:'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1laWRlbnRpZmllciI6IjFhNDJkNzQ2LTZjOTgtNDY4Ny04MjE4LWJiMjJkZmIzYTZhYSIsInN1YiI6IkhlbmRhYmRlbG1vbmVtIiwianRpIjoiNTBlNDZkY2UtMTNhMS00OTIyLThjOWEtYmY0ZWMzNGEzNzc2IiwiZW1haWwiOiJoZW5kYWJkZWxtb25lbUBnbWFpbC5jb20iLCJ1aWQiOiIxYTQyZDc0Ni02Yzk4LTQ2ODctODIxOC1iYjIyZGZiM2E2YWEiLCJyb2xlcyI6WyJGb2xsb3dlciIsIlVzZXIiXSwiZXhwIjoxNzIxNzQ4NDQ4LCJpc3MiOiJTZWN1cmVBcGkiLCJhdWQiOiJTZWN1cmVBcGlVc2VyIn0.U0zJKjFOmGpT3v_n6zeVt0A_vC7uW2q8WQtNOq3K5sw',
            );
         if(data.statusCode==200)  
         {
          emit(Pressuresuccess());

         }
         else if(data.statusCode==500)
         {
          emit(Pressureserror("internal server error, please try again"));
         }
            
           
      }
        catch(e)
      {
        if(e is DioException)
        {
          emit(Pressureserror(ServerFailure.fromDioError(e).errorMessage));

        }
        else{
          emit(Pressureserror(e.toString()));
        }

      }
       
    
  }
  
}

