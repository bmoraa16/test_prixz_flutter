import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:prueba_prix/core/constants/app_assets.dart';
import 'package:prueba_prix/core/constants/route_constants.dart';
import 'package:prueba_prix/core/di/injection.dart';
import 'package:prueba_prix/features/splash/presentation/cubit/splash_cubit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  // ignore: prefer_typing_uninitialized_variables
  late final _lottieController;

  @override
  void initState() {
    _lottieController = AnimationController(
      vsync: this,
    );
    super.initState();
  }

  @override
  void dispose() {
    _lottieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: BlocListener<SplashCubit, SplashState>(
        listener: (context, state) {
          if (state is NavigateToOnboarding) {
            context.go(TestPrixzRouteConstants.dashboardRoute);
          }
        },
        child: SizedBox(
          width: size.width,
          height: size.height,
          child: FittedBox(
            fit: BoxFit.cover,
            clipBehavior: Clip.hardEdge,
            child: Lottie.asset(
              AppAssets.splashAnimation,
              frameRate: FrameRate.max,
              onLoaded: (p0) {
                _lottieController
                  ..duration = p0.duration
                  ..forward().whenComplete(
                    () {
                      getIt<SplashCubit>().validateConfigurationInfo();
                    },
                  );
              },
            ),
          ),
        ),
      ),
    );
  }
}
