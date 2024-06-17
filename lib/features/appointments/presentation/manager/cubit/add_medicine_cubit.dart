import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gluco/core/helper/api.dart';
import 'package:gluco/core/widgets/network.dart';
import 'package:gluco/features/appointments/data/add_medicine_model.dart';
import 'package:meta/meta.dart';

part 'add_medicine_state.dart';

class AddMedicineCubit extends Cubit<AddMedicineState> {
  AddMedicineCubit() : super(AddMedicineInitial());

   static AddMedicineCubit get(context) => BlocProvider.of(context);

   AddMedicineModel? addMedicineModel;
  void addMedicine({
    required String name,
    required String dosage,
    required String times,
    required String date,
  }) {
    emit(AddMedicineLoaded());
    DioHelper().postData(
      url: ADD_Medicine,
      data: {
        'name': name,
        'dosage':dosage,
        'times':times,
        'date':date,
      },
    ).then((value) {
      final addMedicineModel = AddMedicineModel.fromJson(value.data);
      emit(AddMedicineSuccess(addMedicineModel));
    }).catchError((onError) {
      print('Error in Addd medicine cubit: ${onError.toString()}');
      emit(AddMedicineFailure(onError.toString()));
    });
  }
}

