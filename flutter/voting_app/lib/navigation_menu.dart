import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:voting_app/admin_poll_add.dart';
import 'package:voting_app/admin_polls.dart';
import 'package:voting_app/admin_settings.dart';
import 'package:voting_app/poll_results.dart';
import 'package:voting_app/poll_comments.dart';

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
            if (index < controller.screens.length) {
              controller.selectedIndex.value = index;
            } else {
              controller.navigateToHiddenScreen(index - controller.screens.length);
            }
          },
          destinations: const [
            NavigationDestination(icon: Icon(Icons.ballot), label: ''),
            NavigationDestination(icon: Icon(Icons.add), label: ''),
            NavigationDestination(icon: Icon(Icons.settings), label: '')
          ],
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }

  goToPage(int index) {
    final controller = Get.find<NavigationController>();
    if (index < controller.screens.length) {
      controller.selectedIndex.value = index;
    } else {
      controller.navigateToHiddenScreen(index - controller.screens.length);
    }
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;
  final screens = const [AdminPolls(), AdminPollAdd(), AdminSettings()];
  final hiddenScreens = const [PollResults(), PollComments()];

  navigateToHiddenScreen(int index) {
    Get.to(hiddenScreens[index]);
  }
}