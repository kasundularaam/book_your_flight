import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../core/constants/app_colors.dart';
import '../../../data/models/flight.dart';
import '../../../data/models/passenger.dart';
import '../../../logic/cubit/passengers_cubit/passengers_cubit.dart';
import 'widgets/add_passenger_view.dart';

class AppPassengersPage extends StatefulWidget {
  final Flight flight;
  final String seatClass;
  const AppPassengersPage({
    Key? key,
    required this.flight,
    required this.seatClass,
  }) : super(key: key);

  @override
  State<AppPassengersPage> createState() => _AppPassengersPageState();
}

class _AppPassengersPageState extends State<AppPassengersPage> {
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
              const AddPassengerView(),
              SizedBox(
                height: 5.h,
              ),
              BlocBuilder<PassengersCubit, PassengersState>(
                builder: (context, state) {
                  if (state is PassengersShow) {
                    return ListView.builder(itemBuilder: (context, index) {
                      Passenger passenger = state.passengers[index];
                      return ListTile(
                        title: Text(passenger.first_name),
                        subtitle: Text(passenger.gender),
                      );
                    });
                  }
                  return Container();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
