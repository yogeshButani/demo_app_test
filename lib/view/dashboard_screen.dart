import 'package:demo_app/utils/app_file_imports.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  final int selectedIndex;

  const DashboardScreen({super.key, required this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    Provider.of<DashboardProvider>(context, listen: false).selectedTab =
        selectedIndex;
    return Consumer<DashboardProvider>(builder: (context, provider, __) {
      return Scaffold(
        backgroundColor: AppColors.colorWhite,
        body: getPage(
          provider.currentTab,
        ),
        bottomNavigationBar: Container(
          height: 85,
          padding: const EdgeInsets.symmetric(vertical: 10.5, horizontal: 10),
          decoration: BoxDecoration(
            color: AppColors.colorWhite,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () => provider.onTap(0),
                  child: SizedBox(
                    height: 60,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        provider.currentTab == 0
                            ? SvgPicture.asset(
                                'assets/icons/ic_bnb_home_active.svg',
                                height: 32,
                                width: 32,
                              )
                            : SvgPicture.asset(
                                'assets/icons/ic_bnb_home_inactive.svg',
                                height: 32,
                                width: 32,
                              ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          'Home',
                          style: TextStyle(
                            fontSize: 12,
                            fontStyle: FontStyle.normal,
                            color: provider.currentTab == 0
                                ? AppColors.themeColor
                                : AppColors.color6C6B6B,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () => provider.onTap(1),
                  child: SizedBox(
                    height: 60,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        provider.currentTab == 1
                            ? SvgPicture.asset(
                                'assets/icons/ic_bnb_my_cart_active.svg',
                                height: 32,
                                width: 32,
                              )
                            : SvgPicture.asset(
                                'assets/icons/ic_bnb_my_cart_inactive.svg',
                                height: 32,
                                width: 32,
                              ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          'My Cart',
                          style: TextStyle(
                            fontSize: 12,
                            fontStyle: FontStyle.normal,
                            color: provider.currentTab == 1
                                ? AppColors.themeColor
                                : AppColors.color6C6B6B,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  Widget getPage(int index) {
    switch (index) {
      case 0:
        return const HomeScreen();
      case 1:
        return MyCartScreen();
      default:
        return const HomeScreen();
    }
  }
}
