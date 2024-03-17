import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:voting_app/admin/admin_poll_add.dart';
import 'package:voting_app/admin/admin_polls.dart';
import 'package:voting_app/admin/admin_settings.dart';
import 'package:voting_app/poll_comments.dart';
import 'package:voting_app/poll_results.dart';

class NavigationMenu extends StatelessWidget {
  NavigationMenu({super.key});
  final controller = Get.put(NavigationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          backgroundColor: const Color(0xFF5AC7F0),
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) {
            controller.selectedIndex.value = index;
            if (controller.isNavBar) controller.currentScreenIndex.value = index;
          },
          destinations: const [
            NavigationDestination(icon: Icon(Icons.ballot), label: ''),
            NavigationDestination(icon: Icon(Icons.add), label: ''),
            NavigationDestination(icon: Icon(Icons.settings), label: '')
          ],
        ),
      ),
      body: Obx(() => controller.setScreen()),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;
  Rx<int> currentScreenIndex = 0.obs;
  bool isNavBar = true;
  final navbarScreens = const [AdminPolls(), AdminPollAdd(), AdminSettings()];
  final allScreens = const [AdminPolls(), AdminPollAdd(), AdminSettings(), PollResults(), PollComments()];

  navigateToScreen(int index) {
    final controller = Get.find<NavigationController>();
    controller.currentScreenIndex.value = index;

    if (index > 2) isNavBar = false;
    else isNavBar = true;
  }

  setScreen() {
    final controller = Get.find<NavigationController>();
    if (isNavBar) isNavBar = true;
    return controller.allScreens[controller.currentScreenIndex.value];
  }
}