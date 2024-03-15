
import '../../../core/theming/colors.dart';
import '../../../core/theming/image_manager.dart';
import '../../my_consultations_screen/presentations/screens/my_consultations_screen.dart';
import '../../profile_screen/presentations/screens/profile_screen.dart';
import '../../reports_screen/presentations/screens/reports_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../generated/l10n.dart';
class ButtonNavigationDoctor extends StatelessWidget {
  ButtonNavigationDoctor({Key? key}) : super(key: key);

  final controller = Get.put(NavigationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(() => BottomNavigationBar(
        mouseCursor: MouseCursor.uncontrolled,
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
            activeIcon: Image.asset(ImageManager.selectedOnlineIcon),
            icon: Image.asset(ImageManager.unSelectedOnlineIcon),
            label: S.of(context).online,
          ),
          BottomNavigationBarItem(
            activeIcon: Image.asset(ImageManager.selectedConsultationsIcon),
            icon: Image.asset(ImageManager.unselectedConsultationsIcons),
            label: S.of(context).my_consultations,
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
        children:  const [
          ReportsScreen(),
          MyConsultationsScreen(),
          ProfileScreen(),

        ],
      )),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;
}
