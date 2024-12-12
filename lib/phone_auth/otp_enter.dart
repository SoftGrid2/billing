import 'package:billing/home/home_page.dart';
import 'package:flutter/material.dart';
class OTPScreen extends StatefulWidget {
  String mobileNumber;
  OTPScreen({super.key, required this.mobileNumber});
  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  TextEditingController otpController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OTP Screen'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: TextField(
              controller: otpController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                  hintText: "Enter The OTP",
                  suffixIcon: Icon(Icons.phone),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25))),
            ),
          ),
          ElevatedButton(
              onPressed: () async {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePage(),
                    ));
              },
              child: Text('Verify OTP'))
        ],
      ),
    );
  }
}

// Text(isTimerRunning ? 'Resend OTP in $otpTimer s': "Din\'t receive OTP?," ,style: TextStyle(color: Colors.grey),),
// ElevatedButton(
//     onPressed: isTimerRunning ? null : () async {
//       setState(() {
//         isTimerRunning = true;
//       });
//       otpTimer 60;
//       Timer.periodic(Duration(seconds: 1), (timer) {
//         setState(() {
//           otpTimer--;
//           if(otpTimer == 0){
//             timer.cancel();
//             isTimerRunning = false;
//           }
//         });
//       });
//
//       Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => Select(),
//           ));
//     },
//     child: Text('Verify OTP')
// )//   //