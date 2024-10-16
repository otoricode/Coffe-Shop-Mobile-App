import 'package:app/common/widgets/appbar_dashboard.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

import 'package:app/common/styles/app_colors.dart';
import 'package:app/modules/dashboard/dashboard_bloc.dart';
import 'package:app/modules/home/screen/home_page.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = DashboardBloc();
    final screens = _screens();
    return Scaffold(
      appBar: const AppbarDashboard(appbarText: 'Coffeeku'),
      body: StreamBuilder<int>(
          stream: bloc.index.stream,
          initialData: bloc.index.value,
          builder: (context, snapshot) {
            return screens[snapshot.data ?? 0];
          }),
      bottomNavigationBar: StreamBuilder<int>(
          stream: bloc.index.stream,
          initialData: bloc.index.value,
          builder: (context, snapshot) {
            return _MyBottonNavigationBar(
              index: snapshot.data ?? 0,
              onTap: (val) => bloc.index.add(val),
            );
          }),
    );
  }

  List<Widget> _screens() {
    return const [
      HomePage(),
      SizedBox(),
      SizedBox(),
      SizedBox(),
    ];
  }
}

class _MyBottonNavigationBar extends StatelessWidget {
  const _MyBottonNavigationBar({
    Key? key,
    required this.index,
    required this.onTap,
  }) : super(key: key);
  final int index;
  final Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: AppColors.white,
          offset: Offset(4, 12),
          blurRadius: 12,
        )
      ]),
      child: Theme(
        data: ThemeData(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: index,
          onTap: (value) {
            onTap(value);
          },
          unselectedItemColor: AppColors.white,
          elevation: 12,
          showUnselectedLabels: true,
          selectedItemColor: AppColors.primary,
          backgroundColor: AppColors.background,
          items: _items(),
        ),
      ),
    );
  }

  List<BottomNavigationBarItem> _items() {
    return const <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        label: 'Home',
        icon: Icon(IconlyBold.home),
      ),
      BottomNavigationBarItem(
        label: 'Favorite',
        icon: Icon(IconlyBold.heart),
      ),
      BottomNavigationBarItem(
        label: 'My Cart',
        icon: Icon(IconlyBold.bag),
      ),
      BottomNavigationBarItem(
        label: 'Profile',
        icon: Icon(IconlyBold.profile),
      ),
    ];
  }
}
