import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../logic/cubit/select_class_cubit/select_class_cubit.dart';
import 'select_class_button.dart';

class SelectClassView extends StatelessWidget {
  final Function(String) onSelect;
  const SelectClassView({
    Key? key,
    required this.onSelect,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SelectClassCubit, SelectClassState>(
      listener: (context, state) {
        if (state is SelectClassElite) {
          onSelect("first");
        }
        if (state is SelectClassBusiness) {
          onSelect("business");
        }
        if (state is SelectClassEconomy) {
          onSelect("economy");
        }
      },
      builder: (context, state) {
        if (state is SelectClassElite) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SelectClassButton(
                isSelected: false,
                text: "economy",
                icon: Icons.airline_seat_recline_normal_rounded,
                onSelected: () => BlocProvider.of<SelectClassCubit>(context)
                    .selectClassEconomy(),
              ),
              SelectClassButton(
                isSelected: false,
                text: "business",
                icon: Icons.person,
                onSelected: () => BlocProvider.of<SelectClassCubit>(context)
                    .selectClassBusiness(),
              ),
              SelectClassButton(
                isSelected: true,
                text: "first",
                icon: Icons.person,
                onSelected: () => BlocProvider.of<SelectClassCubit>(context)
                    .selectClassElite(),
              ),
            ],
          );
        }
        if (state is SelectClassBusiness) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SelectClassButton(
                isSelected: false,
                text: "economy",
                icon: Icons.airline_seat_recline_normal_rounded,
                onSelected: () => BlocProvider.of<SelectClassCubit>(context)
                    .selectClassEconomy(),
              ),
              SelectClassButton(
                isSelected: true,
                text: "business",
                icon: Icons.person,
                onSelected: () => BlocProvider.of<SelectClassCubit>(context)
                    .selectClassBusiness(),
              ),
              SelectClassButton(
                isSelected: false,
                text: "first",
                icon: Icons.person,
                onSelected: () => BlocProvider.of<SelectClassCubit>(context)
                    .selectClassElite(),
              ),
            ],
          );
        }
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SelectClassButton(
              isSelected: true,
              text: "economy",
              icon: Icons.airline_seat_recline_normal_rounded,
              onSelected: () => BlocProvider.of<SelectClassCubit>(context)
                  .selectClassEconomy(),
            ),
            SelectClassButton(
              isSelected: false,
              text: "business",
              icon: Icons.person,
              onSelected: () => BlocProvider.of<SelectClassCubit>(context)
                  .selectClassBusiness(),
            ),
            SelectClassButton(
              isSelected: false,
              text: "first",
              icon: Icons.person,
              onSelected: () =>
                  BlocProvider.of<SelectClassCubit>(context).selectClassElite(),
            ),
          ],
        );
      },
    );
  }
}
