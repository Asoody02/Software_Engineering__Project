import 'package:flutter/material.dart';

class CustomAlertDialog extends StatelessWidget {
  final String title;
  final String content;

  const CustomAlertDialog({
    Key? key,
    required this.title,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title, style: const TextStyle(
        color: Color(0xFF113143),
        fontSize: 20,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w700,
      )),
      content: Text(content, style: const TextStyle(
        color: Color(0xFF113143),
        fontSize: 16,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w400,
      )),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.of(context).pop(false), 
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(const Color(0xFFB2B2B2)),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)))
          ),
          child: const Text('Cancel', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700))
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(true), 
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(const Color(0xFF113143)),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)))
          ),
          child: const Text('Confirm', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700))
        )
      ],
    );
  }
}
