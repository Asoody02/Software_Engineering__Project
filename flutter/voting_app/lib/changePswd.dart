import 'package:flutter/material.dart';
import 'package:voting_app/changePswd.dart';


class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => ResetPasswordState();
}

class ResetPasswordState extends State<ResetPassword> {
  final _formKey = GlobalKey<FormState>();
  String? password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reset Password'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration (
                labelText: 'Enter new password: '
               ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Enter New Password';
                }
                else {
                  return null;
                }
              },
               onChanged:(value){
                setState(() {
                  password = value;
                });
              }
            ),
            TextFormField(
              validator: (value) {

                if(value != password) {

                 return 'The passwords do not match, please try again.';
                 //TODO: pass password to database
                }
              },
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Password Change Successful"),
                    ),
                  );
                }
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
