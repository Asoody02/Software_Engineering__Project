import 'package:flutter/material.dart';
import 'package:voting_app/organization_info.dart';

class OrganizationThumbnail extends StatefulWidget {
  final int organizationID;
  final String organizationName;

  const OrganizationThumbnail({
    Key? key,
    required this.organizationID,
    required this.organizationName,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => OrganizationThumbnailState();
}

class OrganizationThumbnailState extends State<OrganizationThumbnail> {
  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.only(top: 12, left: 12, right: 12), child: GestureDetector(
      //opens organization info popup when any part of the organization thumbnail is tapped
      onTap: () => const OrganizationInfo(),
      child: Container(
        height: 72,
        decoration: ShapeDecoration(
          color: const Color(0xFFC7E7F3),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: Row(
        children: <Widget>[
          Padding(padding: const EdgeInsets.all(7.5), child: Container(
            width: 57,
            height: 57,
            decoration: const BoxDecoration(
              color:  Color(0xFF113143), 
              borderRadius: BorderRadius.all(Radius.circular(8))
            ),
            child: const Center(child: Text('org\npic', style: TextStyle(color: Colors.white)))
          )),
          Text(
            widget.organizationName,
            style: const TextStyle(
              color: Color(0xFF113143),
              fontSize: 16,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w700,
            )
          ),
        ]),
      )
    ));
  }
}