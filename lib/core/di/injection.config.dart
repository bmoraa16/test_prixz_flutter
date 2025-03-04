// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../features/book_details/presentation/bloc/book_details_bloc.dart'
    as _i4;
import '../../features/dashboard/presentation/bloc/dashboard_navigation_cubit.dart'
    as _i5;
import '../../features/personal_data/presentation/bloc/personal_data_bloc.dart'
    as _i6;
import '../../features/search_book/presentation/bloc/search_book_bloc.dart'
    as _i7;
import '../../features/splash/presentation/cubit/splash_cubit.dart' as _i8;
import '../managers/network_manager.dart' as _i3;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i3.NetworkManager>(() => _i3.NetworkManager());
    gh.singleton<_i4.BookDetailsBloc>(() => _i4.BookDetailsBloc());
    gh.singleton<_i5.DashboardNavigationCubit>(
        () => _i5.DashboardNavigationCubit());
    gh.singleton<_i6.PersonalDataBloc>(() => _i6.PersonalDataBloc());
    gh.singleton<_i7.SearchBookBloc>(() => _i7.SearchBookBloc());
    gh.lazySingleton<_i8.SplashCubit>(() => _i8.SplashCubit());
    return this;
  }
}
