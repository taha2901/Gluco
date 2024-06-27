import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gluco/core/widgets/custom_show_toast.dart';
import 'package:gluco/core/widgets/custom_text_field.dart';
import 'package:gluco/features/home/presentation/view/widgets/cusrom_button.dart';
import 'package:gluco/features/settings/presentation/manager/update_cubit/update_profile_cubit.dart';

class PersonalDetails extends StatelessWidget {
  const PersonalDetails({super.key});
  static String id = 'PersonalDetails';
  @override
  Widget build(BuildContext context) {
    TextEditingController nameCon = TextEditingController();
    TextEditingController emailCon = TextEditingController();
    TextEditingController phoneCon = TextEditingController();
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return BlocConsumer<UpdateProfileCubit, UpdateProfileState>(
      listener: (context, state) {

        if(state is UpdateUserSuccess){
          showToast(msg: 'Update Succesfully', state: ToastStates.SUCCESS);
        }
        else if(state is UpdateUserFailure){
          showToast(msg: 'Update Failed', state: ToastStates.ERROR);
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("تفاصيل الشخصيه"),
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Form(
              key: formKey,
              child: ListView(
                children: [
                  const Padding(padding: EdgeInsets.only(top: 24)),
                  CircleAvatar(
                    radius: 50,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(40),
                      child: Image.asset(
                        "assets/DoctorAhmed.png",
                        height: 92,
                        width: 92,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  const Padding(padding: EdgeInsets.only(top: 60)),
                  CustomTextField(
                    hint: 'أدخل إسمك',
                    controller: nameCon,
                  ),
                  // const SizedBox(
                  //   height: 16,
                  // ),
                  // CustomTextField(
                  //   hint: 'أدخل عنوانك',
                  // ),
                  const SizedBox(
                    height: 16,
                  ),
                  CustomTextField(
                    hint: 'أدخل ايميلك',
                    controller: emailCon,
                    fillColor: Colors.white,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  CustomTextField(
                    hint: 'أدخل رقم تلفونك',
                    controller: phoneCon,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: state is UpdateUserLoaded
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : CustomButtonHome(
                            text: 'حفظ',
                            color: Colors.blue,
                            textColor: Colors.white,
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                UpdateProfileCubit.get(context).updateUserData(
                                  name: nameCon.text,
                                  phone: phoneCon.text,
                                  email: emailCon.text,
                                );
                              }
                            },
                            borderRadius: 4,
                          ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
