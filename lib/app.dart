import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'theme/cubit/theme_cubit.dart';
import 'ticker.dart';
import 'timer/timer.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ThemeCubit()),
        BlocProvider(create: (context) => TimerBloc(ticker: Ticker())),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        buildWhen: (prev, state) => prev.themeMode != state.themeMode,
        builder: (context, state) {
          return MaterialApp(
            title: 'Bloc Timer',
            theme: ThemeData.light(useMaterial3: true),
            darkTheme: ThemeData.dark(useMaterial3: true),
            themeMode: state.themeMode,
            home: const TimerPage(),
          );
        },
      ),
    );
  }
}
