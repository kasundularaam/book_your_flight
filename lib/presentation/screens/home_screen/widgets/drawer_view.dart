import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import 'package:book_your_flight/data/models/byf_user.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/strings.dart';
import '../../../../logic/cubit/sign_out_cubit/sign_out_cubit.dart';
import '../../../router/app_router.dart';

class DrawerView extends StatelessWidget {
  final BYFUser user;
  const DrawerView({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          SafeArea(
            child: Padding(
              padding: EdgeInsets.all(5.w),
              child: Column(
                children: [
                  Row(
                    children: [
                      ClipOval(
                        child: Image.asset(
                          Strings.profile,
                          width: 20.w,
                          height: 20.w,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        width: 3.w,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${user.first_name} ${user.last_name}",
                              style: TextStyle(
                                color: AppColors.darkElv0,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            FittedBox(
                              child: Text(
                                user.email,
                                style: TextStyle(
                                    color: AppColors.darkElv1,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.normal),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Container(
                    height: 0.1.h,
                    color: AppColors.primaryColor,
                  ),
                  BlocConsumer<SignOutCubit, SignOutState>(
                    listener: (context, state) {
                      if (state is SignOutFailed) {
                        SnackBar snackBar =
                            SnackBar(content: Text(state.errorMsg));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                      if (state is SignOutSucceed) {
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          AppRouter.landingPage,
                          (route) => false,
                        );
                      }
                    },
                    builder: (context, state) {
                      return TextButton(
                        onPressed: () =>
                            BlocProvider.of<SignOutCubit>(context).signOut(),
                        child: const Text(
                          "SIGN OUT",
                          style: TextStyle(color: AppColors.primaryColor),
                        ),
                      );
                    },
                  ),
                  Container(
                    height: 0.1.h,
                    color: AppColors.primaryColor,
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            title: Text(
              "Home",
              style: TextStyle(
                color: AppColors.primaryColor,
                fontSize: 14.sp,
              ),
            ),
            leading: const Icon(
              Icons.home_rounded,
              color: AppColors.primaryColor,
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text(
              "History",
              style: TextStyle(
                color: AppColors.primaryColor,
                fontSize: 14.sp,
              ),
            ),
            leading: const Icon(
              Icons.history_rounded,
              color: AppColors.primaryColor,
            ),
            onTap: () {
              Navigator.pushNamed(context, AppRouter.bookingsPage);
            },
          ),
        ],
      ),
    );
  }
}
