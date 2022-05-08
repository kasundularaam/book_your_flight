import 'package:book_your_flight/core/constants/strings.dart';
import 'package:book_your_flight/logic/cubit/landing_cubit/landing_cubit.dart';
import 'package:book_your_flight/presentation/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  static const Duration duration = Duration(seconds: 2);
  void goToHome() =>
      Future.delayed(duration).then((value) => Navigator.of(context)
          .pushNamedAndRemoveUntil(AppRouter.homePage, (route) => false));
  void goToAuth() =>
      Future.delayed(duration).then((value) => Navigator.of(context)
          .pushNamedAndRemoveUntil(AppRouter.loginPage, (route) => false));
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<LandingCubit>(context).loadApp();
    return BlocListener<LandingCubit, LandingState>(
      listener: (context, state) {
        if (state is LandingToAuth) {
          goToAuth();
        }
        if (state is LandingToHome) {
          goToHome();
        }
        if (state is LandingFailed) {
          SnackBar snackBar = SnackBar(content: Text(state.toString()));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      child: Scaffold(
        body: Center(
          child: Image.asset(
            Strings.logoPrimary,
            height: 50.w,
            width: 50.w,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
