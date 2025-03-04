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
import '../../features/book_search/data/datasources/book_search_datasource.dart'
    as _i8;
import '../../features/book_search/data/datasources/book_search_datasource_impl.dart'
    as _i9;
import '../../features/book_search/data/repositories/book_search_repository_impl.dart'
    as _i11;
import '../../features/book_search/domain/repositories/book_search_repository.dart'
    as _i10;
import '../../features/book_search/domain/usecases/get_book_use_case.dart'
    as _i12;
import '../../features/book_search/presentation/bloc/book_search_bloc.dart'
    as _i13;
import '../../features/dashboard/presentation/bloc/dashboard_navigation_cubit.dart'
    as _i5;
import '../../features/personal_data/presentation/bloc/personal_data_bloc.dart'
    as _i6;
import '../../features/splash/presentation/cubit/splash_cubit.dart' as _i7;
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
    gh.lazySingleton<_i7.SplashCubit>(() => _i7.SplashCubit());
    gh.factory<_i8.BookSearchDataSource>(
        () => _i9.DrSearchDataSourceImpl(gh<_i3.NetworkManager>()));
    gh.factory<_i10.BookSearchRepository>(
        () => _i11.DrSearchRepositoryImpl(gh<_i8.BookSearchDataSource>()));
    gh.lazySingleton<_i12.GetBooksUseCase>(
        () => _i12.GetBooksUseCase(gh<_i10.BookSearchRepository>()));
    gh.singleton<_i13.BookSearchBloc>(
        () => _i13.BookSearchBloc(gh<_i12.GetBooksUseCase>()));
    return this;
  }
}
