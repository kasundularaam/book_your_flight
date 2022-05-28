import 'package:book_your_flight/data/models/flight_params.dart';
import 'package:book_your_flight/logic/cubit/landing_cubit/landing_cubit.dart';
import 'package:book_your_flight/logic/cubit/login_cubit/login_cubit.dart';
import 'package:book_your_flight/logic/cubit/register_cubit/register_cubit.dart';
import 'package:book_your_flight/logic/cubit/search_flights_cubit/search_flights_cubit.dart';
import 'package:book_your_flight/presentation/screens/checkout_screen/checkout_page.dart';
import 'package:book_your_flight/presentation/screens/map_screen/map_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/exceptions/route_exception.dart';
import '../../logic/cubit/booking_type_cubit/booking_type_cubit.dart';
import '../../logic/cubit/select_class_cubit/select_class_cubit.dart';
import '../screens/auth/landing_screen/landing_page.dart';
import '../screens/auth/login_screen/login_page.dart';
import '../screens/auth/signup_screen/signup_page.dart';
import '../screens/flight_details_screen/flight_details_page.dart';
import '../screens/flight_list_screen.dart/flight_list_page.dart';
import '../screens/home_screen/home_page.dart';

class AppRouter {
  static const String landingPage = '/';
  static const String homePage = '/homePage';
  static const String loginPage = '/loginPage';
  static const String signupPage = '/signupPage';
  static const String flightListPage = '/flightListPage';
  static const String flightDetailsPage = '/flightDetailsPage';
  static const String checkoutPage = '/checkoutPage';
  static const String mapPage = '/mapPage';

  const AppRouter._();

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case landingPage:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => LandingCubit(),
            child: const LandingPage(),
          ),
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
          builder: (_) => BlocProvider(
            create: (context) => LoginCubit(),
            child: const LoginPage(),
          ),
        );
      case signupPage:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => RegisterCubit(),
            child: const SignupPage(),
          ),
        );
      case flightListPage:
        final FlightParams flightParams = settings.arguments as FlightParams;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => SearchFlightsCubit(),
            child: FlightListPage(
              flightParams: flightParams,
            ),
          ),
        );
      case flightDetailsPage:
        return MaterialPageRoute(
          builder: (_) => const FlightDetailsPage(),
        );
      case checkoutPage:
        return MaterialPageRoute(
          builder: (_) => const CheckoutPage(),
        );
      case mapPage:
        return MaterialPageRoute(
          builder: (_) => const MapPage(),
        );
      default:
        throw const RouteException('Route not found!');
    }
  }
}
