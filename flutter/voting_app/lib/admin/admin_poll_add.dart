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
          height: 180,
          child: Container(
            color: const Color(0xFF5AC7F0), 
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
                const Column(children: [
                  Text('[Organization Name]'),
                  Text('[Poll Name]')
                ]),
                TextButton(
                  onPressed: () => setState(() => {}),
                  child: const Text('Close')
                )
              ]),
              SizedBox(
                height: 87,
                width: 336,
                child: Container(
                  color: const Color(0xFFC7E7F3),
                  child: const Text('poll description')
                )
              )
            ]),
          )
      )
    );
  }
}