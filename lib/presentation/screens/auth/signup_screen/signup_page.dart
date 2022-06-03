import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../data/models/register.dart';
import '../../../../logic/cubit/register_cubit/register_cubit.dart';
import '../../../router/app_router.dart';
import '../widgets/auth_button.dart';
import '../widgets/auth_text_input.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  register() {
    String username = usernameController.text;
    String first_name = firstNameController.text;
    String last_name = lastNameController.text;
    String email = emailController.text;
    String password = passwordController.text;
    if (first_name.isNotEmpty &&
        last_name.isNotEmpty &&
        email.isNotEmpty &&
        password.isNotEmpty) {
      BlocProvider.of<RegisterCubit>(context).register(
        register: Register(
          username: username,
          first_name: first_name,
          last_name: last_name,
          email: email,
          password: password,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        child: SafeArea(
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              SizedBox(
                height: 5.h,
              ),
              Text(
                "SIGN UP",
                style: TextStyle(
                    color: AppColors.primaryColor,
                    fontSize: 30.sp,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 1.h,
              ),
              Text(
                "Please fill the fields below here",
                style: TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: 14.sp,
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              Text(
                "Username",
                style: TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: 12.sp,
                ),
              ),
              AuthTextInput(
                controller: usernameController,
                keyboardType: TextInputType.text,
              ),
              SizedBox(
                height: 4.h,
              ),
              Text(
                "First Name",
                style: TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: 12.sp,
                ),
              ),
              AuthTextInput(
                controller: firstNameController,
                keyboardType: TextInputType.name,
              ),
              SizedBox(
                height: 4.h,
              ),
              Text(
                "Last Name",
                style: TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: 12.sp,
                ),
              ),
              AuthTextInput(
                controller: lastNameController,
                keyboardType: TextInputType.name,
              ),
              SizedBox(
                height: 4.h,
              ),
              Text(
                "email address",
                style: TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: 12.sp,
                ),
              ),
              AuthTextInput(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(
                height: 4.h,
              ),
              Text(
                "Password",
                style: TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: 12.sp,
                ),
              ),
              AuthTextInput(
                controller: passwordController,
                keyboardType: TextInputType.visiblePassword,
                isPassword: true,
              ),
              SizedBox(
                height: 5.h,
              ),
              Center(
                  child: BlocConsumer<RegisterCubit, RegisterState>(
                listener: (context, state) {
                  if (state is RegisterFailed) {
                    SnackBar snackBar =
                        SnackBar(content: Text(state.toString()));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                  if (state is RegisterSucceed) {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        AppRouter.landingPage, (route) => false);
                  }
                },
                builder: (context, state) {
                  if (state is RegisterLoading) {
                    return const CircularProgressIndicator(
                      color: AppColors.primaryColor,
                    );
                  }
                  return AuthButton(
                    text: "SIGN IN",
                    onPress: () => register(),
                  );
                },
              )),
              SizedBox(
                height: 5.h,
              ),
              Center(
                child: Text(
                  "Forgot password?",
                  style: TextStyle(
                    color: AppColors.primaryColor,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              Center(
                child: RichText(
                  text: TextSpan(children: [
                    TextSpan(
                      text: "Already have an account?",
                      style: TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    TextSpan(
                      text: " LOG IN",
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => Navigator.of(context)
                            .pushNamedAndRemoveUntil(
                                AppRouter.loginPage, (route) => false),
                      style: TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ]),
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
