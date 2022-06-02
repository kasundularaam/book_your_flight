import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../data/models/new_passenger.dart';
import '../../../../logic/cubit/add_passenger_cubit/add_passenger_cubit.dart';
import '../../../../logic/cubit/passengers_cubit/passengers_cubit.dart';
import '../../auth/widgets/auth_button.dart';
import '../../auth/widgets/auth_text_input.dart';
import 'gender_selecter.dart';

class AddPassengerView extends StatefulWidget {
  const AddPassengerView({Key? key}) : super(key: key);

  @override
  State<AddPassengerView> createState() => _AddPassengerViewState();
}

class _AddPassengerViewState extends State<AddPassengerView> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  String gender = "";

  addPassenger() {
    String first_name = firstNameController.text;
    String last_name = lastNameController.text;
    if (first_name.isNotEmpty && last_name.isNotEmpty && gender.isNotEmpty) {
      BlocProvider.of<AddPassengerCubit>(context).addPassenger(
        newPassenger: NewPassenger(
            first_name: first_name, last_name: last_name, gender: gender),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
          height: 2.h,
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
          height: 2.h,
        ),
        Text(
          "Gender",
          style: TextStyle(
            color: AppColors.primaryColor,
            fontSize: 12.sp,
          ),
        ),
        SizedBox(
          height: 2.h,
        ),
        GenderSelector(onSelect: (value) => gender = value),
        SizedBox(
          height: 5.h,
        ),
        Center(
            child: BlocConsumer<AddPassengerCubit, AddPassengerState>(
          listener: (context, state) {
            if (state is AddPassengerFailed) {
              SnackBar snackBar = SnackBar(content: Text(state.toString()));
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
            if (state is AddPassengerSucceed) {
              BlocProvider.of<PassengersCubit>(context)
                  .addPassenger(passenger: state.passenger);
            }
          },
          builder: (context, state) {
            log(state.toString());
            if (state is AddPassengerLoading) {
              return const CircularProgressIndicator(
                color: AppColors.primaryColor,
              );
            }
            return AuthButton(
              text: "Add",
              onPress: () => addPassenger(),
            );
          },
        )),
      ],
    );
  }
}
