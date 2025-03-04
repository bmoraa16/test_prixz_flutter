import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_prix/core/constants/app_assets.dart';
import 'package:prueba_prix/core/constants/app_dictionary.dart';
import 'package:prueba_prix/core/di/injection.dart';
import 'package:prueba_prix/core/extensions/num_extensions.dart';
import 'package:prueba_prix/core/helpers/screen_helper.dart';
import 'package:prueba_prix/features/dashboard/presentation/bloc/dashboard_navigation_cubit.dart';
import 'package:prueba_prix/features/dashboard/presentation/widgets/nav_bar_widgets/notifcation_dot_widget.dart';
import 'package:prueba_prix/theme/app_colors.dart';

class BottomNavBarWidget extends StatelessWidget {
  const BottomNavBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      height: size.height * ScreenHelper.getNavbarMultiplier(),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(15),
          topLeft: Radius.circular(15),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(15.0), topRight: Radius.circular(15.0)),
        child: BlocBuilder<DashboardNavigationCubit, int>(
            builder: (context, currentPage) {
          return BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            showUnselectedLabels: true,
            selectedItemColor: Theme.of(context).primaryColor,
            unselectedItemColor: AppColors.hbGreyText,
            currentIndex: currentPage,
            selectedFontSize: 12,
            unselectedFontSize: 12,
            onTap: (index) {
              getIt<DashboardNavigationCubit>().navigateToPage(index);
            },
            backgroundColor: Colors.white,
            elevation: 0,
            items: _buildNavbarItems(),
          );
        }),
      ),
    );
  }

  List<BottomNavigationBarItem> _buildNavbarItems() {
    return <BottomNavigationBarItem>[
      _buildNavbarItem(
        icon: const ImageIcon(
          AssetImage(AppAssets.searchBookIcon),
          size: 24,
        ),
        label: AppDictionary.searchBook,
      ),
      _buildNavbarItem(
        icon: const ImageIcon(
          AssetImage(AppAssets.personalDataIcon),
          size: 24,
        ),
        label: AppDictionary.addUser,
      ),
    ];
  }

  _buildNavbarItem(
      {required Widget icon,
      bool hasIndicator = false,
      required String label}) {
    return BottomNavigationBarItem(
      icon: Stack(
        children: [
          Column(
            children: [
              icon,
              5.ph,
            ],
          ),
          if (hasIndicator) const NotificationDotWidget(),
        ],
      ),
      label: label,
    );
  }
}
