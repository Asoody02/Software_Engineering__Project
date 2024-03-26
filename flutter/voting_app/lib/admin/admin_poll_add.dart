import 'package:flutter/material.dart';

class AdminPollAdd extends StatefulWidget {
  const AdminPollAdd({super.key});

  @override
  State<StatefulWidget> createState() => AdminPollAddState();
}

class AdminPollAddState extends State<AdminPollAdd> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
          height: 192,
          child: Container(
            color: const Color(0xFF5AC7F0), 
            child: Column(children: [
              Row(children: [
                Padding(padding: const EdgeInsets.all(12), child: Container(
                  width: 57,
                  height: 57,
                  decoration: const BoxDecoration(
                    color:  Color(0xFF113143), 
                    borderRadius: BorderRadius.all(Radius.circular(8))
                  ),
                  child: const Center(child: Text('org\npic', style: TextStyle(color: Colors.white)))
                )),
                const Column(
                  mainAxisAlignment: MainAxisAlignment.center, 
                  crossAxisAlignment: CrossAxisAlignment.start, 
                  children: [
                    Text(
                      'Dirt Diggin Inc.', 
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(width: 336, child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Enter Poll Name...',
                        prefixIcon: Icon(Icons.edit, color: Color(0xFF113143),)
                      ),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w700,
                      ),
                    ))
                  ]
                ),
              ]),
              Padding(padding: const EdgeInsets.all(12), child: Container(
                width: double.maxFinite,
                height: 87,
                decoration: ShapeDecoration(
                  color: const Color(0xFFC7E7F3),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                child: const Padding(padding: EdgeInsets.only(left: 11.77, top: 6), child: Text('Enter poll description...', style: TextStyle(color: Color(0xFF113143))))
              ))
            ]),
          )
      )
    );
  }
}