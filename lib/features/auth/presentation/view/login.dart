import 'package:flutter/material.dart';
import 'package:gluco/core/widgets/custom_button.dart';
import 'package:gluco/core/widgets/custom_text_field.dart';
import 'package:gluco/features/auth/presentation/view/register.dart';
import 'package:gluco/features/auth/presentation/view/widget/text_field.dart';
import 'package:gluco/features/layout/presentation/view/glocu_layout.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    var emailController = TextEditingController();
    var passWordController = TextEditingController();

    // return BlocProvider(
    //   create: (context) => LoginCubit(),
    //   child: BlocConsumer<LoginCubit, LoginState>(
    //     listener: (context, state) {
    //       if (state is LoginSuccess) {
    //         if (state.loginModel.success == true) {
    //           print(state.loginModel.success);
    //           print(state.loginModel.data!.token);
    //           print(state.loginModel.data!.user!.email);

    //           ChachHelper.saveData(
    //                   key: 'token', value: state.loginModel.data!.token)
    //               .then(
    //             (value) {
    //               String token = '${state.loginModel.data!.token}';
    //               Navigator.pushAndRemoveUntil(
    //                 context,
    //                 MaterialPageRoute(
    //                   builder: (context) =>   SouqLayout(name: '${state.loginModel.data!.user!.username}',)

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
                  child: Text(
                    'تسجيل الدخول',
                    style: Theme.of(context).textTheme.headline4!.copyWith(),
                  ),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                // CustomTextField(
                //   hint: 'أدخل الايميل',
                //   prefixIcon: const Icon(Icons.email_outlined),
                //   controller: emailController,
                //   onSubmitted: (value) {
                //     emailController.text = value;
                //   },
                // ),
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
                // CustomTextField(
                //   hint: 'أدخل الرقم السري',
                //   prefixIcon: const Icon(Icons.lock_outlined),
                //   // obscure: LoginCubit.get(context).isObsecure,
                //   controller: passWordController,
                //   onSubmitted: (value) {
                //     passWordController.text = value;
                //   },
                //   // suffixIcon: LoginCubit.get(context).suffix,
                //   suffixPressed: () {
                //     // LoginCubit.get(context).changePasswordVisibility();
                //   },
                // ),

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
                Row(
                  children: [
                    const Spacer(),
                    GestureDetector(
                      child: const Text("هل نسيت كلمة السر؟"),
                      onTap: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //       builder: (context) => const ForgetScreen(),
                        //     ));
                      },
                    )
                  ],
                ),
                const SizedBox(
                  height: 30.0,
                ),
                // state is LoginLoaded
                //     ? const Center(
                //         child: CircularProgressIndicator(),
                //       )
                //     :
                CustomButton(
                  text: 'تسجيل دخول',
                  color: Colors.blue,
                  textcolor: Colors.white,
                  circular: 30.0,
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      // LoginCubit.get(context).userLogin(
                      //     email: emailController.text,
                      //     password: passWordController.text);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const GlucoLayout(),
                          ));
                    }
                  },
                ),
                const SizedBox(
                  height: 15.0,
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     const Text('Don\'t have an account?'),
                //     TextButton(
                //       onPressed: () {
                //         Navigator.push(
                //           context,
                //           MaterialPageRoute(
                //             builder: (context) {
                //               return RegisterScreen();
                //             },
                //           ),
                //         );
                //       },
                //       child: const Text('Register'),
                //     ),
                //   ],
                // ),
                OutlinedButton(
                  
                  style: OutlinedButton.styleFrom(
                    
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    padding: const EdgeInsets.all(16),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return RegisterScreen();
                        },
                      ),
                    );
                  },
                  child: Center(
                    child: Text(
                      "أنشئ حساب",
                      style: TextStyle(
                        color: Theme.of(context)
                            .colorScheme
                            .onBackground, // onBackground not background
                      ),
                    ),
                  ),
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
