import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'splash_state.dart';

@lazySingleton
class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashLoading());

  Future<void> fetchConfigurationInfo() async {
    try {} catch (_) {}
  }

  Future<void> validateConfigurationInfo() async {
    emit(NavigateToOnboarding());
  }
}
