import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/constants/app_colors.dart';

class NonstopFlightFilterSwitch extends StatefulWidget {
  final Function(bool) onChange;
  const NonstopFlightFilterSwitch({
    Key? key,
    required this.onChange,
  }) : super(key: key);

  @override
  State<NonstopFlightFilterSwitch> createState() =>
      _NonstopFlightFilterSwitchState();
}

class _NonstopFlightFilterSwitchState extends State<NonstopFlightFilterSwitch> {
  bool isOn = true;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Nonstop flights first",
          style: TextStyle(
              color: AppColors.primaryColor,
              fontSize: 14.sp,
              fontWeight: FontWeight.bold),
        ),
        Switch(
          value: isOn,
          onChanged: (isSwitchOn) {
            setState(() {
              isOn = isSwitchOn;
            });

            widget.onChange(isOn);
          },
        ),
      ],
    );
  }
}
