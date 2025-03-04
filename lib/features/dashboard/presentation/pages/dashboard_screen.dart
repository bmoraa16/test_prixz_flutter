import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_prix/core/di/injection.dart';
import 'package:prueba_prix/features/dashboard/presentation/bloc/dashboard_navigation_cubit.dart';
import 'package:prueba_prix/features/dashboard/presentation/widgets/bottom_nav_bar_widget.dart';
import 'package:prueba_prix/features/dashboard/utils/loading_mixin.dart';
import 'package:prueba_prix/features/personal_data/presentation/bloc/personal_data_bloc.dart';
import 'package:prueba_prix/features/personal_data/presentation/pages/personal_data.dart';
import 'package:prueba_prix/features/search_book/presentation/bloc/search_book_bloc.dart';
import 'package:prueba_prix/features/search_book/presentation/pages/search_book.dart';
import 'package:prueba_prix/theme/widgets/hb_scaffold_widget.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen>
    with WidgetsBindingObserver, LoadingMixin {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    getIt<DashboardNavigationCubit>().init();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return HbScaffoldWidget(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: getIt<DashboardNavigationCubit>().pageController,
        children: [
          BlocProvider.value(
            value: getIt<SearchBookBloc>(),
            child: const SearchBookScreen(),
          ),
          BlocProvider.value(
            value: getIt<PersonalDataBloc>(),
            child: const PersonalDataScreen(),
          ),
        ],
      ),
      bottomNavigationBar: const BottomNavBarWidget(),
    );
  }
}
