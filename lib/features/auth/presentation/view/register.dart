import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gluco/core/helper/cach.dart';
import 'package:gluco/core/widgets/custom_button.dart';
import 'package:gluco/core/widgets/custom_show_toast.dart';
import 'package:gluco/core/widgets/custom_text_field.dart';
import 'package:gluco/core/widgets/network.dart';
import 'package:gluco/features/auth/presentation/manager/login/login_cubit.dart';
import 'package:gluco/features/auth/presentation/manager/register/register_cubit.dart';
import 'package:gluco/features/auth/presentation/manager/register/register_state.dart';
import 'package:gluco/features/auth/presentation/view/widget/text_field.dart';
import 'package:gluco/features/layout/presentation/view/glocu_layout.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

// ignore: must_be_immutable
class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  var emailController = TextEditingController();
  var passWordController = TextEditingController();
  var nameController = TextEditingController();
  var firstNameController = TextEditingController();
  var secNameController = TextEditingController();
  var addressController = TextEditingController();
  var sexController = TextEditingController();
  var phoneController = TextEditingController();
  var confirmPassController = TextEditingController();
  var ageController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (state is RegisterSuccess) {
            if (state.registerModel.isAuthenticated == true) {
              print(state.registerModel.isAuthenticated);
              print(state.registerModel.token);
              print(state.registerModel.email);

              ChachHelper.saveData(
                      key: 'token', value: state.registerModel.token)
                  .then(
                (value) {
                  userToken = '${state.registerModel.token}';
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) => GlucoLayout(
                              name: state.registerModel.username,
                            )),
                    (route) => false,
                  );
                },
              );
              showToast(msg: 'success', state: ToastStates.SUCCESS);
            } else {
              showToast(msg: 'no', state: ToastStates.ERROR);
            }
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                          child: Text('إنشاء حساب',
                              style: Theme.of(context).textTheme.bodyLarge)),
                      const SizedBox(
                        height: 30.0,
                      ),
                      CustomField(
                        icon: Icons.person,
                        lable: 'أدخل اسمك الاول',
                        controller: firstNameController,
                        showBorder: false,
                        onSubmitted: (value) {
                          firstNameController.text = value;
                        },
                      ),
                      CustomField(
                        icon: Icons.person,
                        lable: 'أدخل اسمك الثاني',
                        controller: secNameController,
                        showBorder: false,
                        onSubmitted: (value) {
                          secNameController.text = value;
                        },
                      ),
                      CustomField(
                        icon: Icons.person,
                        lable: 'أدخل اسمك',
                        controller: nameController,
                        showBorder: false,
                        onSubmitted: (value) {
                          nameController.text = value;
                        },
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      CustomField(
                        icon: Iconsax.direct,
                        lable: 'أدخل الايميل',
                        controller: emailController,
                        showBorder: false,
                        onSubmitted: (value) {
                          emailController.text = value;
                        },
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      CustomField(
                        icon: Iconsax.direct,
                        lable: 'أدخل رقم الهاتف',
                        controller: phoneController,
                        showBorder: false,
                        onSubmitted: (value) {
                          phoneController.text = value;
                        },
                      ),
                      CustomField(
                        icon: Iconsax.direct,
                        lable: 'أدخل عمرك ',
                        controller: ageController,
                        showBorder: false,
                        onSubmitted: (value) {
                          ageController.text = value;
                        },
                      ),
                      CustomField(
                        icon: Iconsax.direct,
                        lable: 'أدخل عنوانك ',
                        controller: addressController,
                        showBorder: false,
                        onSubmitted: (value) {
                          addressController.text = value;
                        },
                      ),
                      CustomField(
                        icon: Iconsax.direct,
                        lable: 'أدخل نوعك ',
                        controller: sexController,
                        showBorder: false,
                        onSubmitted: (value) {
                          sexController.text = value;
                        },
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      CustomField(
                        showBorder: false,
                        obscure: RegisterCubit.get(context).isObsecure,
                        controller: passWordController,
                        lable: "ادخل الرقم السري",
                        icon: Iconsax.password_check,
                        isPass: true,
                        onSubmitted: (value) {
                          passWordController.text = value;
                        },
                        suffixIcon: RegisterCubit.get(context).suffix,
                        suffixPressed: () {
                          RegisterCubit.get(context).changePasswordVisibility();
                        },
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      CustomField(
                        showBorder: false,
                        obscure: RegisterCubit.get(context).isObsecure,
                        controller: confirmPassController,
                        lable: "ادخل الرقم السري مره اخري",
                        icon: Iconsax.password_check,
                        isPass: true,
                        onSubmitted: (value) {
                          confirmPassController.text = value;
                        },
                        suffixIcon: RegisterCubit.get(context).suffix,
                        suffixPressed: () {
                          RegisterCubit.get(context).changePasswordVisibility();
                        },
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      state is RegisterLoaded
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : CustomButton(
                              text: 'Register',
                              color: Colors.blue,
                              textcolor: Colors.white,
                              circular: 30.0,
                              onTap: () {
                                if (formKey.currentState!.validate()) {
                                  RegisterCubit.get(context).userRegister(
                                      address: addressController.text,
                                      age: ageController.text,
                                      confirmpPassword:
                                          confirmPassController.text,
                                      firstName: firstNameController.text,
                                      phone: phoneController.text,
                                      secondName: secNameController.text,
                                      sex: sexController.text,
                                      username: nameController.text,
                                      email: emailController.text,
                                      password: passWordController.text);
                                }
                              },
                            ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
