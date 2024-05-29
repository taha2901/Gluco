import 'package:flutter/material.dart';
import 'package:gluco/core/widgets/custom_button.dart';
import 'package:gluco/core/widgets/custom_text_field.dart';
import 'package:gluco/features/auth/presentation/view/widget/text_field.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

// ignore: must_be_immutable
class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  var emailController = TextEditingController();
  var passWordController = TextEditingController();
  var nameController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // return BlocProvider(
    //   create: (context) => RegisterCubit(),
    //   child: BlocConsumer<RegisterCubit, RegisterState>(
    //     listener: (context, state) {
    //       if (state is RegisterSuccess) {
    //         if (state.registerModel.success == true) {
    //           print(state.registerModel.success);
    //           print(state.registerModel.data!.token);
    //           print(state.registerModel.data!.user!.email);

    //           ChachHelper.saveData(
    //                   key: 'token', value: state.registerModel.data!.token)
    //               .then(
    //             (value) {
    //               String token = '${state.registerModel.data!.token}';
    //               Navigator.pushAndRemoveUntil(
    //                 context,
    //                 MaterialPageRoute(
    //                   builder: (context) =>   SouqLayout(name: state.registerModel.data!.user!.username,)
    //                 ),
    //                 (route) => false,
    //               );
    //             },
    //           );
    //           showToast(msg: 'success', state: ToastStates.SUCCESS);
    //         } else {
    //           showToast(msg: 'no', state: ToastStates.ERROR);
    //         }
    //       }
    //     },
    //     builder: (context, state) {
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
                // CustomTextField(
                //   hint: 'أدخل اسمك',
                //   prefixIcon: const Icon(Icons.person),
                //   controller: nameController,
                //   onSubmitted: (value) {
                //     nameController.text = value;
                //   },
                //   // type: TextInputType.name,
                // ),
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
                  showBorder: false,
                  // obscure: LoginCubit.get(context).isObsecure,
                  controller: passWordController,
                  lable: "ادخل الرقم السري",
                  icon: Iconsax.password_check,
                  isPass: true,
                  onSubmitted: (value) {
                    passWordController.text = value;
                  },
                  // suffixIcon: LoginCubit.get(context).suffix,
                  suffixPressed: () {
                    // LoginCubit.get(context).changePasswordVisibility();
                  },
                ),
                const SizedBox(
                  height: 30.0,
                ),
                // state is RegisterLoaded
                //     ? const Center(
                //         child: CircularProgressIndicator(),
                //       )
                //     :
                CustomButton(
                  text: 'Register',
                  color: Colors.blue,
                  textcolor: Colors.white,
                  circular: 30.0,
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      // RegisterCubit.get(context).userRegister(
                      //     username: nameController.text,
                      //     email: emailController.text,
                      //     password: passWordController.text);
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
    //     },
    //   ),
    // );
  }
}
