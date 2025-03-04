import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_prix/core/di/injection.dart';
import 'package:prueba_prix/features/dashboard/presentation/bloc/dashboard_navigation_cubit.dart';
import 'package:prueba_prix/router/router.dart';
import 'package:prueba_prix/theme/dark_mode_theme.dart';
import 'package:prueba_prix/theme/light_mode_theme.dart';
import 'package:sizer/sizer.dart';

class TestPrixApp extends StatelessWidget {
  const TestPrixApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<DashboardNavigationCubit>(
          create: (context) => getIt<DashboardNavigationCubit>(),
        ),
      ],
      child: Sizer(builder: (_, __, ___) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'HealthBird',
          routerConfig: TestPrixzRouter.router,
          theme: getLightModeThemeData(),
          darkTheme: getDarkModeThemeData(),
          builder: (context, child) {
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(
                textScaler: const TextScaler.linear(1.0),
              ),
              child: child!,
            );
          },
        );
      }),
    );
  }
}
