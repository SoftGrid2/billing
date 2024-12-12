import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'login.dart';

class ForgotPasswordScr extends StatelessWidget {
  final TextEditingController email = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1CC1AB),
      appBar: AppBar(
        backgroundColor: Color(0xFF1CC1AB),

        // backgroundColor:Colors.orange.shade700,
        title: const Text('Forgot Password',style: TextStyle(color: Colors.white),),
      ),

      body:

      Container(
        color: Colors.white,
        // width: double.infinity,
        // decoration: BoxDecoration(
        //   gradient: LinearGradient(
        //     colors: [
        //       Colors.orange.shade900,
        //       Colors.orange.shade800,
        //       Colors.orange.shade400,
        //     ],
        //   ),
        // ),


        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Please enter your email to reset your password.',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Container(
                width: 300,
                child: TextFormField(
                  controller: email,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  print(email.text);
                  try {
                    print('inside try');
                    await FirebaseAuth.instance
                        .sendPasswordResetEmail(email: email.text.trim());
                    // Navigator.pushNamed(context, LoginScreen());
                    Get.to(LoginScreen());
                    Fluttertoast.showToast(
                      msg:
                      "Reset Password link has been sent on you verified email.Please Reset and Login again",
                      toastLength: Toast.LENGTH_LONG,
                      gravity: ToastGravity.BOTTOM,
                      backgroundColor: Colors.lightBlueAccent,
                      textColor: Colors.black,
                    );
                  } catch (e) {
                    print(e);
                  }
                },
                child: const Text('Verify Your Email'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}