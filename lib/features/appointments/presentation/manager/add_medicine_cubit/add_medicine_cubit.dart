import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gluco/core/helper/api.dart';
import 'package:gluco/core/widgets/network.dart';
import 'package:gluco/features/appointments/data/add_medicine_model.dart';
import 'package:gluco/features/appointments/presentation/manager/get_medicine_cubit/get_medicine_cubit.dart';
import 'package:meta/meta.dart';

part 'add_medicine_state.dart';

class AddMedicineCubit extends Cubit<AddMedicineState> {
  AddMedicineCubit() : super(AddMedicineInitial());

  static AddMedicineCubit get(BuildContext context) => BlocProvider.of(context);

  void addMedicine({
    required String name,
    required String dosage,
    required String times,
    required String date,
    required BuildContext context,
  }) {
    DioHelper().postData(
      url: ADD_Medicine,
      token: 'Bearer $userToken',
      data: {
        'name': name,
        'dosage': dosage,
        'times': times,
        'date': date,
        
      },
    ).then((value) {
      AddMedicineModel addMedicineModel = AddMedicineModel.fromJson(value.data);
      emit(AddMedicineSuccess(addMedicineModel));

      // Move this line here to fetch medicines after adding successfully
      GetMedicineCubit.get(context).getMedicines();
    }).catchError((onError) {
      emit(AddMedicineFailure(onError.toString()));
    });
  }
}
