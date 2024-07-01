import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gluco/core/helper/api.dart';
import 'package:gluco/core/widgets/network.dart';
import 'package:gluco/features/activities/data/Sugarcheck.dart';
import 'package:gluco/features/activities/presentation/manager/suger_cubit/sugar_check_states.dart';

class SugarCheckCubit extends Cubit<SugarCheckStates> {
  SugarCheckCubit() : super(SugarCheckinitial());
  double? maxSugarLevel;
  double? minSugarLevel;

  Future<List<Sugarcheck>> fetchsugardata(String date) async {
    // emit(SugarCheckloading());
    List<Sugarcheck> sugardata = [];
    var respons = await DioHelper().fetchData(
      url:
          'http://nouraapi.runasp.net/api/Selecting_data/user\'s sugar_data?specificDate=$date',
      token: userToken!,
    );
    var data = respons.data;
    if (respons.statusCode == 200 && data != null) {
      for (int i = 0; i < data.length; i++) {
        sugardata.add(Sugarcheck.fromJson(data[i]));
      }
    }

    return sugardata;
  }

  Future<void> getsugarlevel(String date) async {
    
    emit(SugarCheckloading());
    List<Sugarcheck> sugardata = [];
    List<int>  beforemeal= [];
    List<int>  aftermeal= [];
    
    
    sugardata = await fetchsugardata(date);
    for (int i = 0; i < sugardata.length; i++) {

      if(sugardata[i].measurement_date=="قبل الوجبه")
      {
          beforemeal.add(sugardata[i].sugar_reading!);
      }
      else if(sugardata[i].measurement_date=="بعد الوجبه")
      {
        aftermeal.add(sugardata[i].sugar_reading!);
      }
    }
    
    if (sugardata.isNotEmpty) {
      List<double> beforemealdouble =
          beforemeal.map((e) => e.toDouble()).toList();
          List<double> aftermealdouble =
          aftermeal.map((e) => e.toDouble()).toList();
      
          print('token in suger cubit $userToken');
      emit(haveData(beforemealdouble,aftermealdouble ,sugardata));
      
    } else {
      emit(nothaveData());
    }
  }
}
