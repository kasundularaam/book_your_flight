import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/constants/strings.dart';
import '../../../../logic/cubit/landing_cubit/landing_cubit.dart';
import '../../../router/app_router.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<LandingCubit>(context).loadApp();
    return BlocListener<LandingCubit, LandingState>(
      listener: (context, state) {
        if (state is LandingToAuth) {
          Navigator.of(context)
              .pushNamedAndRemoveUntil(AppRouter.loginPage, (route) => false);
        }
        if (state is LandingToHome) {
          Navigator.of(context).pushNamedAndRemoveUntil(
              AppRouter.homePage, (route) => false,
              arguments: state.user);
        }
        if (state is LandingFailed) {
          SnackBar snackBar =
              SnackBar(content: Text(state.errorMsg.toString()));
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
