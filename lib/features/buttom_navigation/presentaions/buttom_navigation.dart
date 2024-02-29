import '../../../core/theming/colors.dart';
import '../../../core/theming/image_manager.dart';
import '../../history_screen/presentations/history_screen.dart';
import '../../home_screen/presentations/screens/home_screen.dart';
import '../../profile_screen/presentations/screens/profile_screen.dart';
import '../../reports_screen/presentations/screens/reports_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../generated/l10n.dart';
class ButtonNavigation extends StatefulWidget {
  const ButtonNavigation({Key? key}) : super(key: key);

  @override
  _ButtonNavigationState createState() => _ButtonNavigationState();
}

class _ButtonNavigationState extends State<ButtonNavigation> {
  final controller = Get.put(NavigationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(() => BottomNavigationBar(
        backgroundColor: ColorsManager.mainWhite,
        selectedItemColor: controller.selectedIndex.value == 0
            ? ColorsManager.mainBlue // Change color for the selected item
            : Colors.grey, // Set default color for unselected items
        currentIndex: controller.selectedIndex.value,
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: false,
        onTap: (index) => controller.selectedIndex.value = index,
        items: [
          BottomNavigationBarItem(
            activeIcon: Image.asset(ImageManager.selectedHomeIcon),
            icon: Image.asset(ImageManager.unselectedHomeIcon),
            label: S.of(context).home,
          ),
          BottomNavigationBarItem(
            activeIcon: Image.asset(ImageManager.selectedReportsIcon),
            icon: Image.asset(ImageManager.unselectedReportsIcon),
            label: S.of(context).reports,
          ),
          BottomNavigationBarItem(
            activeIcon: Image.asset(ImageManager.selectedHistoryIcon),
            icon: Image.asset(ImageManager.unselectedHistoryIcon),
            label: S.of(context).history,
          ),
          BottomNavigationBarItem(
            activeIcon: Image.asset(ImageManager.selectedProfileIcon),
            icon: Image.asset(ImageManager.unselectedProfileIcon),
            label: S.of(context).profile,
          ),
        ],
      )),
      body: Obx(() => IndexedStack(
        index: controller.selectedIndex.value,
        children: const [
          HomeScreen(),
          ReportsScreen(),
          HistoryScreen(),
          ProfileScreen()

        ],
      )),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;
}
