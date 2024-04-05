import 'package:flutter/material.dart';
import 'package:voting_app/main.dart';
import 'package:voting_app/organization.dart';

class OrganizationInfo extends StatefulWidget {
  final Organization organization;
  
  const OrganizationInfo({
    Key? key,
    required this.organization
  }) : super(key: key);
  
  @override
  State<OrganizationInfo> createState() => _OrganizationInfoState();
}

class _OrganizationInfoState extends State<OrganizationInfo> {
  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      contentPadding: const EdgeInsets.all(20),
      //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      backgroundColor: const Color(0xFFC7E7F3),
      children: [
        Row(children: [
          Padding(padding: const EdgeInsets.only(right: 12, bottom: 12), child: Container(
            width: 57,
            height: 57,
            decoration: const BoxDecoration(
              color:  Color(0xFF113143), 
              borderRadius: BorderRadius.all(Radius.circular(8))
            ),
            child: const Center(child: Text('org\npic', style: TextStyle(color: Colors.white)))
          )),
          Expanded(child: Text(widget.organization.name, style: const TextStyle(color: Color(0xFF113143), fontSize: 18, fontWeight: FontWeight.w700))),
          Padding(padding: const EdgeInsets.symmetric(horizontal: 12), child: TextButton(
            style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(widget.organization.isFollowed ? const Color(0xFFFF5B5B) : const Color(0xFF113143))),
            onPressed: () => setState(() => widget.organization.isFollowed ? widget.organization.isFollowed = false : widget.organization.isFollowed = true),
            child: Text(widget.organization.isFollowed ? 'Unfollow' : 'Follow', style: const TextStyle(color: Colors.white, fontSize: 14)),
          ))
        ]),
        Container(
          width: double.maxFinite,
          height: 160,
          decoration: ShapeDecoration(
            color: const Color(0xFFEBEBEB),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
          child: Padding(padding: const EdgeInsets.all(12), child: SingleChildScrollView(child: Text(
            testOrganizations[currentOrganization].description,
            style: const TextStyle(color: Color(0xFF113143))
          )))
        )
      ]
    );
  }
}