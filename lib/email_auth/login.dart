import 'package:billing/email_auth/sign_up.dart';
import 'package:billing/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'forgot_password.dart';
import 'package:firebase_auth/firebase_auth.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formkey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool ispasswordvisible = false;
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    // Get screen size for responsive layout
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.orange.shade900,
              Colors.orange.shade800,
              Colors.orange.shade400,
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: screenHeight * 0.1, // Responsive height
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Email',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: screenWidth * 0.1, // Responsive font size
                        ),
                      ),
                      SizedBox(
                        height: screenHeight * 0.02, // Responsive height
                      ),
                      Text(
                        'WelCome!',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: screenWidth * 0.045, // Responsive font size
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.05, // Responsive height
                ),
                Container(
                  height: screenHeight * 0.7, // Responsive height
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.05, // Responsive padding
                      vertical: screenHeight * 0.03,
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: screenHeight * 0.04, // Responsive height
                        ),
                        Container(
                          padding: EdgeInsets.all(
                              screenHeight * 0.02), // Responsive padding
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromARGB(225, 95, 27, 3),
                                blurRadius: 20,
                                offset: Offset(0, 10),
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.all(screenHeight * 0.01),
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: Colors.grey.shade200,
                                    ),
                                  ),
                                ),
                                child: TextFormField(
                                  // textInputAction: TextInputAction.next,
                                  //   autofillHints: [AutofillHints.email],
                                  controller: emailController,
                                  decoration: InputDecoration(
                                    suffixIcon: Icon(Icons.email_outlined),
                                    hintText: "Email",
                                    hintStyle: TextStyle(color: Colors.grey),
                                    border: InputBorder.none,
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your email';
                                    }
                                    // Email format validation
                                    final emailRegExp = RegExp(
                                        r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
                                    if (!emailRegExp.hasMatch(value)) {
                                      return 'Please enter a valid email';
                                    }
                                    // Add additional email validation here if needed
                                    return null;
                                  },
                                  // validator: (value) {
                                  //   if (value == null || value.isEmpty) {
                                  //     return 'कृपया तुमचा ईमेल प्रविष्ट करा';
                                  //   }
                                  //   String emailPattern =
                                  //        r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
                                  //   RegExp emailRegex = RegExp(emailPattern);
                                  //
                                  //   if (!emailRegex.hasMatch(value)) {
                                  //     return 'नोंदणी ईमेल पत्ता प्रविष्ट करा';
                                  //   }
                                  //   return null;
                                  // }
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(screenHeight * 0.01),
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: Colors.grey.shade200,
                                    ),
                                  ),
                                ),
                                child: TextFormField(
                                  // autofillHints: [AutofillHints.password],
                                  // onEditingComplete: ()=> TextInput.finishAutofillContext(),
                                  obscureText: !ispasswordvisible, // Toggle obscureText based on visibility
                                  controller: passwordController,
                                  decoration: InputDecoration(
                                    suffixIcon: IconButton(
                                      icon: Icon(ispasswordvisible
                                          ? Icons.visibility
                                          : Icons
                                          .visibility_off), // Switch icon based on visibility
                                      onPressed: () {
                                        setState(() {
                                          ispasswordvisible =
                                          !ispasswordvisible;
                                        }
                                        );
                                      },
                                    ),
                                    hintText: "Password",
                                    hintStyle: TextStyle(color: Colors.grey),
                                    border: InputBorder.none,
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your password';
                                    }


                                    if (value.length < 6) {
                                      return 'Password must be at least 6 characters long';
                                    }

                                    return null;

                                  },
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: screenHeight * 0.05, // Responsive height
                        ),
                        InkWell(
                          onTap: () {
                            Get.to(ForgotPasswordScr());
                          },
                          child: Text(
                            'Forgot your password?',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                        SizedBox(
                          height: screenHeight * 0.05, // Responsive height
                        ),
                        Container(
                          height: screenHeight * 0.06, // Responsive height
                          width: screenWidth * 0.8, // Responsive width
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Color(0xffFA6650),
                            border: Border.all(
                              width: 0.2,
                              color: Colors.grey,
                            ),
                          ),
                          child: Center(
                            child: InkWell(
                              onTap: (){
                                if(_formkey.currentState != null &&
                                    _formkey.currentState!.validate()
                                ){
                                  _signIn();
                                }
                              },
                              child: Text('login',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: screenWidth *
                                      0.05, // Responsive font size
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: screenHeight * 0.05, // Responsive height
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text('No account? '),
                            SizedBox(
                              width: 5,
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.to(SignUpScreen());
                              },
                              child: Text(
                                'Sign up' ,
                                style: TextStyle(color: Colors.lightBlueAccent),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Future<void> _signIn()async{
    String email = emailController.text;
    String password = passwordController.text;

    try {
      final userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password:password);
      if(userCredential != null)
      {
        Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
        // Get.to(BillList(billId: ''));
        Fluttertoast.showToast(msg: "Login Successful",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.green,
            textColor: Colors.white
        );
      }
    } catch (e){
      print("Error:$e");
      Fluttertoast.showToast(msg: "Login Failed",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.green,
          textColor: Colors.white
      );
    }
  }

}


