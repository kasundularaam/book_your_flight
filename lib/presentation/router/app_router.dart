import 'package:book_your_flight/logic/cubit/add_passenger_cubit/add_passenger_cubit.dart';
import 'package:book_your_flight/logic/cubit/passengers_cubit/passengers_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/exceptions/route_exception.dart';
import '../../data/models/byf_user.dart';
import '../../data/models/flight_params.dart';
import '../../logic/cubit/booking_type_cubit/booking_type_cubit.dart';
import '../../logic/cubit/home_page_cubit/home_page_cubit.dart';
import '../../logic/cubit/landing_cubit/landing_cubit.dart';
import '../../logic/cubit/login_cubit/login_cubit.dart';
import '../../logic/cubit/register_cubit/register_cubit.dart';
import '../../logic/cubit/search_flights_cubit/search_flights_cubit.dart';
import '../../logic/cubit/select_class_cubit/select_class_cubit.dart';
import '../screens/add_passengers_screen/add_passengers_page.dart';
import '../screens/auth/landing_screen/landing_page.dart';
import '../screens/auth/login_screen/login_page.dart';
import '../screens/auth/signup_screen/signup_page.dart';
import '../screens/bookings_screen/bookings_page.dart';
import '../screens/checkout_screen/checkout_page.dart';
import '../screens/flight_details_screen/flight_details_page.dart';
import '../screens/flight_list_screen.dart/flight_list_page.dart';
import '../screens/home_screen/home_page.dart';
import '../screens/map_screen/map_page.dart';

class AppRouter {
  static const String landingPage = '/';
  static const String homePage = '/homePage';
  static const String loginPage = '/loginPage';
  static const String signupPage = '/signupPage';
  static const String flightListPage = '/flightListPage';
  static const String flightDetailsPage = '/flightDetailsPage';
  static const String checkoutPage = '/checkoutPage';
  static const String mapPage = '/mapPage';
  static const String bookingsPage = '/bookingsPage';
  static const String addPassengersPage = '/addPassengersPage';

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
        final BYFUser user = settings.arguments as BYFUser;
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => BookingTypeCubit(),
              ),
              BlocProvider(
                create: (context) => HomePageCubit(),
              ),
              BlocProvider(
                create: (context) => SelectClassCubit(),
              )
            ],
            child: HomePage(
              user: user,
            ),
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
        final Map<String, dynamic> args =
            settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (_) => FlightDetailsPage(
            flight: args["flight"],
            seatClass: args["seatClass"],
          ),
        );
      case addPassengersPage:
        final Map<String, dynamic> args =
            settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => AddPassengerCubit(),
              ),
              BlocProvider(
                create: (context) => PassengersCubit(),
              ),
            ],
            child: AppPassengersPage(
              flight: args["flight"],
              seatClass: args["seatClass"],
            ),
          ),
        );
      case bookingsPage:
        return MaterialPageRoute(
          builder: (_) => const BookingsPage(),
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
