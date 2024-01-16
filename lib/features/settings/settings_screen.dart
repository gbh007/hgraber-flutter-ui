import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hgraber_ui/common/global.dart';
import 'package:hgraber_ui/widgets/screen.dart';

import 'wigets.dart';

final class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GlobalBloc, GlobalModel>(builder: (context, state) {
      return SimpleScaffold(
        title: 'Настройки',
        child: SettingsWidget(
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
