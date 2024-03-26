import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:voting_app/admin/admin_poll_add.dart';
import 'package:voting_app/admin/admin_polls.dart';
import 'package:voting_app/admin/admin_settings.dart';
import 'package:voting_app/poll_comments.dart';
import 'package:voting_app/poll_results.dart';
import 'package:voting_app/user/user_search.dart';
import 'package:voting_app/user/user_polls.dart';
import 'package:voting_app/user/user_settings.dart';
import 'package:voting_app/main.dart';

class NavigationMenu extends StatefulWidget {
  const NavigationMenu({super.key});

  @override
  State<StatefulWidget> createState() => NavigationMenuState();
}

class NavigationMenuState extends State<NavigationMenu> {
  final controller = Get.put(NavigationController());
  Icon middleIcon = isAdmin ? const Icon(Icons.add) : const Icon(Icons.search);

  static var isAdmin;

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
          destinations: [
            const NavigationDestination(icon: Icon(Icons.ballot), label: ''),
            NavigationDestination(icon: middleIcon, label: ''),
            const NavigationDestination(icon: Icon(Icons.settings), label: '')
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
  final adminScreens = const [AdminPolls(), AdminPollAdd(), AdminSettings(), PollResults(), PollComments()];
  final userScreens = const [UserPolls(), UserSearch(), UserSettings(), PollResults(), PollComments()];

  var isAdmin;

  navigateToScreen(int index) {
    final controller = Get.find<NavigationController>();
    controller.currentScreenIndex.value = index;

    if (index > 2) isNavBar = false;
    else isNavBar = true;
  }

  setScreen() {
    final controller = Get.find<NavigationController>();
    if (isNavBar) isNavBar = true;
    return isAdmin ? controller.adminScreens[controller.currentScreenIndex.value] : controller.userScreens[controller.currentScreenIndex.value];
  }
}