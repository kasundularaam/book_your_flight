import 'package:book_your_flight/core/constants/strings.dart';
import 'package:book_your_flight/presentation/router/app_router.dart';
import 'package:flutter/material.dart';
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
  void goToLogin() =>
      Future.delayed(duration).then((value) => Navigator.of(context)
          .pushNamedAndRemoveUntil(AppRouter.loginPage, (route) => false));
  @override
  Widget build(BuildContext context) {
    goToLogin();
    return Scaffold(
      body: Center(
        child: Image.asset(
          Strings.logoPrimary,
          height: 50.w,
          width: 50.w,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
