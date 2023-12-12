import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hgraber_ui/common/global.dart';
import 'package:hgraber_ui/widgets/navigation.dart';

import 'view.dart';
import 'bloc.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GlobalBloc, GlobalState>(
      builder: (context, state) {
        if (state is GlobalErrorState) {
          return ErrorScreen(
            titleText: 'Настройки',
            text: state.message,
          );
        }

        if (state is GlobalLoadedState) {
          return BlocProvider(
            create: (context) => SettingsBloc(context.read<GlobalBloc>())
              ..add(SetSettingsEvent(state.model)),
            child: const SettingsView(),
          );
        }

        return const LoadingScreen(titleText: 'Настройки');
      },
    );
  }
}
