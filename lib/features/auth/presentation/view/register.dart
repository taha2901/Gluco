import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gluco/core/helper/cach.dart';
import 'package:gluco/core/widgets/custom_button.dart';
import 'package:gluco/core/widgets/custom_show_toast.dart';
import 'package:gluco/core/widgets/network.dart';
import 'package:gluco/features/auth/presentation/manager/register/register_cubit.dart';
import 'package:gluco/features/auth/presentation/manager/register/register_state.dart';
import 'package:gluco/features/auth/presentation/view/widget/text_field.dart';
import 'package:gluco/features/layout/presentation/view/glocu_layout.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:image_picker/image_picker.dart';

// ignore: must_be_immutable
class RegisterScreen extends StatefulWidget {
  RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  File? _file;
  Future pickercamera() async {
    final ImagePicker picker = ImagePicker();
    final XFile? myfile = await picker.pickImage(source: ImageSource.camera);
    setState(() {
      _file = File(myfile!.path);
    });
  }

  var imageController = TextEditingController();

  var emailController = TextEditingController();

  var passWordController = TextEditingController();

  var nameController = TextEditingController();

  var phoneController = TextEditingController();

  var confirmPassController = TextEditingController();

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
                        auth: state.registerModel,
                      ),
                    ),
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
                        height: 15.0,
                      ),
                      CustomButton(
                        text: 'Upload Image',
                        onTap: pickercamera,
                        color: Colors.indigo,
                        textcolor: Colors.white,
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
                                    confirmpPassword:
                                        confirmPassController.text,
                                    phone: phoneController.text,
                                    username: nameController.text,
                                    email: emailController.text,
                                    password: passWordController.text,
                                    image: _file != null ? _file!.path : '',
                                  );
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
