part of 'splash_cubit.dart';

abstract class SplashState extends Equatable {
  const SplashState(this.timestamp);

  final DateTime timestamp;

  @override
  List<Object> get props => [timestamp];
}

final class SplashLoading extends SplashState {
  SplashLoading() : super(DateTime.now());

  @override
  List<Object> get props => [timestamp];
}

class CompromisedDeviceState extends SplashState {
  CompromisedDeviceState() : super(DateTime.now());

  @override
  List<Object> get props => [timestamp];
}

class MaintenanceState extends SplashState {
  MaintenanceState() : super(DateTime.now());

  @override
  List<Object> get props => [timestamp];
}

class LockoutState extends SplashState {
  LockoutState() : super(DateTime.now());

  @override
  List<Object> get props => [timestamp];
}

class NavigateToOnboarding extends SplashState {
  NavigateToOnboarding() : super(DateTime.now());

  @override
  List<Object> get props => [timestamp];
}
