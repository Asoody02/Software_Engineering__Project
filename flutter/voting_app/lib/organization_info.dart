import 'package:flutter/material.dart';
import 'package:voting_app/navigation_menu.dart';

class OrganizationInfo extends StatefulWidget {
  const OrganizationInfo({super.key});

  @override
  State<OrganizationInfo> createState() => _OrganizationInfoState();
}

class _OrganizationInfoState extends State<OrganizationInfo> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
      content: Container(
        child: Column(children: [
          Row(children: [
            SizedBox(
              height: 57,
              width: 57,
              child: Container(
                color: const Color(0xFF113143),
                child: const Text('org pic')
              )
            ),
            const Text('[Organization Name]'),
            IconButton(
              onPressed: () => NavigationController().navigateToScreen(0), //calls AdminPolls()
              icon: const Icon(Icons.close)
            ),
          ]),
          SizedBox(
            height: 87,
            width: 336,
            child: Container(
              color: const Color(0xFFC7E7F3),
              child: const Text('organization description')
            )
          )
        ]),
      ),
    );
  }
}