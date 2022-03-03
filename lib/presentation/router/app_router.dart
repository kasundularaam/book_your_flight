import 'package:book_your_flight/logic/cubit/booking_type_cubit/booking_type_cubit.dart';
import 'package:book_your_flight/logic/cubit/select_class_cubit/select_class_cubit.dart';
import 'package:book_your_flight/presentation/screens/auth/landing_screen/landing_page.dart';
import 'package:book_your_flight/presentation/screens/auth/login_screen/login_page.dart';
import 'package:book_your_flight/presentation/screens/auth/signup_screen/signup_page.dart';
import 'package:book_your_flight/presentation/screens/home_screen/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/exceptions/route_exception.dart';

class AppRouter {
  static const String landingPage = '/';
  static const String homePage = '/homePage';
  static const String loginPage = '/loginPage';
  static const String signupPage = '/signupPage';

  const AppRouter._();

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case landingPage:
        return MaterialPageRoute(
          builder: (_) => const LandingPage(),
        );
      case homePage:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => BookingTypeCubit(),
              ),
              BlocProvider(
                create: (context) => SelectClassCubit(),
              )
            ],
            child: const HomePage(),
          ),
        );
      case loginPage:
        return MaterialPageRoute(
          builder: (_) => const LoginPage(),
        );
      case signupPage:
        return MaterialPageRoute(
          builder: (_) => const SignupPage(),
        );
      default:
        throw const RouteException('Route not found!');
    }
  }
}
