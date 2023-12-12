import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hgraber_ui/widgets/navigation.dart';

import 'wigets.dart';
import 'bloc.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (context, state) {
        if (state is SettingsErrorState) {
          return ErrorScreen(
            titleText: 'Настройки',
            text: state.message,
          );
        }

        if (state is SettingsLoadedState) {
          return SimpleScreen(
            titleText: 'Настройки',
            body: SettingsWidget(
              model: state.model,
              onChange: (newModel) =>
                  context.read<SettingsBloc>().add(SetSettingsEvent(newModel)),
              onApply: (newModel) => context
                  .read<SettingsBloc>()
                  .add(ApplySettingsEvent(newModel)),
            ),
          );
        }

        return const LoadingScreen(titleText: 'Настройки');
      },
    );
  }
}
