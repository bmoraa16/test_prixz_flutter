import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:prueba_prix/core/constants/route_constants.dart';
import 'package:prueba_prix/core/di/injection.dart';
import 'package:prueba_prix/features/dashboard/presentation/bloc/dashboard_navigation_cubit.dart';
import 'package:prueba_prix/features/dashboard/presentation/pages/dashboard_screen.dart';
import 'package:prueba_prix/features/splash/presentation/cubit/splash_cubit.dart';
import 'package:prueba_prix/features/splash/presentation/pages/splash_screen.dart';

class TestPrixzRouter {
  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: TestPrixzRouteConstants.initialRoute,
        builder: (BuildContext context, GoRouterState state) {
          return BlocProvider.value(
            value: getIt<SplashCubit>()..fetchConfigurationInfo(),
            child: const SplashScreen(),
          );
        },
      ),
      GoRoute(
        path: TestPrixzRouteConstants.dashboardRoute,
        builder: (BuildContext context, GoRouterState state) {
          return MultiBlocProvider(
            providers: [
              BlocProvider.value(value: getIt<DashboardNavigationCubit>()),
            ],
            child: const DashboardScreen(),
          );
        },
        routes: <RouteBase>[
          GoRoute(
            path: TestPrixzRouteConstants.searchBookRoute,
            builder: (BuildContext context, GoRouterState state) {
              return const SizedBox.shrink();
            },
          ),
          GoRoute(
            path: TestPrixzRouteConstants.personalDataRoute,
            builder: (BuildContext context, GoRouterState state) {
              return const SizedBox.shrink();
            },
          ),
        ],
      ),
    ],
  );
}
