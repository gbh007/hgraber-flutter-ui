import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hgraber_ui/common/global.dart';
import 'package:hgraber_ui/widgets/navigation.dart';

import 'wigets.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GlobalBloc, GlobalModel>(builder: (context, state) {
      return SimpleScreen(
        titleText: 'Настройки',
        body: SettingsWidget(
          model: state,
          onChange: (newModel) =>
              context.read<GlobalBloc>().updateModel(newModel),
          onApply: (newModel) =>
              context.read<GlobalBloc>().updateModel(newModel),
        ),
      );
    });
  }
}
