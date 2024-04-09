import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:voting_app/admin/admin_poll_add.dart';
import 'package:voting_app/admin/admin_polls.dart';
import 'package:voting_app/admin/admin_settings.dart';
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
  Icon middleIcon = isAdmin ? const Icon(Icons.add, color: Colors.white) : const Icon(Icons.search, color: Colors.white);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          backgroundColor: const Color(0xFF5AC7F0),
          indicatorColor: const Color(0xFF113143),
          indicatorShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) {
            controller.selectedIndex.value = index;
            controller.currentScreen.value = isAdmin ? controller.adminNavbar[index] : controller.userNavbar[index];
          },
          destinations: [
            const NavigationDestination(icon: Icon(Icons.ballot, color: Colors.white), label: ''),
            NavigationDestination(icon: middleIcon, label: ''),
            const NavigationDestination(icon: Icon(Icons.settings, color: Colors.white), label: '')
          ],
        ),
      ),
      body: Obx(() => controller.currentScreen.value),
    );
  }
}

class NavigationController extends GetxController {
  //selectedIndex represents which icon on the navbar shows as selected, while currentScreen represents which screen is actually shown
  final Rx<int> selectedIndex = 0.obs;
  final List<Widget> adminNavbar = const [AdminPolls(), AdminPollAdd(), AdminSettings()];
  final List<Widget> userNavbar = const [UserPolls(), UserSearch(), UserSettings()];
  final Rx<Widget> currentScreen = Rx<Widget>(isAdmin ? const AdminPolls() : const UserPolls());

  /*when calling this method:
      if screen NOT on navbar: enter ONLY the screen parameter
      if screen IS on navbar: enter ONLY the index for the navbar screen (use adminNavbar/userNavbar as a reference for indexes)
  */
  navigateToScreen({Widget? screen, int? navbarIndex}) {
    final controller = Get.find<NavigationController>();
    if (screen != null) {controller.currentScreen.value = screen;}
    else if (navbarIndex != null) {
      controller.selectedIndex.value = navbarIndex;
      controller.currentScreen.value = isAdmin ? controller.adminNavbar[navbarIndex] : controller.userNavbar[navbarIndex];
    }
  }
}