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
import 'package:gluco/features/chat/presentation/manager/fire_auth.dart';
import 'package:gluco/features/layout/presentation/view/glocu_layout.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:image_picker/image_picker.dart';

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
        listener: (context, state) async {
          if (state is RegisterSuccess) {
            if (state.registerModel.isAuthenticated == true) {
              print(state.registerModel.isAuthenticated);
              print(state.registerModel.token);
              print('emaaaaaaail issssss${state.registerModel.email}');

              await ChachHelper.saveData(
                      key: 'token', value: state.registerModel.token)
                  .then(
                (value) async {
                  userToken = '${state.registerModel.token}';
                  await FireAuth().createUser(state.registerModel);
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
              showToast(
                  msg: state.registerModel.message.toString(),
                  state: ToastStates.SUCCESS);
            } else {
              showToast(
                  msg: state.registerModel.message.toString(),
                  state: ToastStates.ERROR);
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
                        lable: "أكد الرقم السري",
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
                      Container(
                        height: 80,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey[300],
                        ),
                        child: InkWell(
                          onTap: () {
                            pickercamera();
                          },
                          child: _file == null
                              ? const Center(
                                  child: Text('من فضلك اختار صورة',
                                      style: TextStyle(color: Colors.blue)))
                              : Image.file(
                                  _file!,
                                  fit: BoxFit.cover,
                                ),
                        ),
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      if (state is! RegisterLoaded)
                        CustomButton(
                          color: Colors.blue,
                          text: 'تسجيل',
                          onTap: () {
                            if (formKey.currentState!.validate()) {
                              RegisterCubit.get(context).userRegister(
                                username: nameController.text,
                                email: emailController.text,
                                password: passWordController.text,
                                confirmpPassword: confirmPassController.text,
                                phone: phoneController.text,
                                image: _file!,
                              );
                            }
                          },
                        ),
                      if (state is RegisterLoaded)
                        const Center(
                          child: CircularProgressIndicator(),
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
