// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:get/get.dart';
// import 'package:provider/provider.dart';
// import 'package:sgibooks/calculator/you_got.dart';
// import 'package:sgibooks/home/home_page.dart';
// import 'package:sgibooks/provider/cal_provider.dart';
// import 'package:sgibooks/services/database.dart';
//
// class EntryDetails extends StatefulWidget {
//   final String? comp;
//   final String? date;
//   final String? Id;
//   final String? billId;
//   final String? name;
//
//   EntryDetails({
//     super.key,
//     this.comp,
//     this.date,
//     this.Id,
//     this.billId,
//     this.name,
//   });
//
//   @override
//   State<EntryDetails> createState() => _EntryDetailsState();
// }
//
// class _EntryDetailsState extends State<EntryDetails> {
//   @override
//   void initState() {
//     super.initState();
//     print(widget.Id);
//     print(widget.comp);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final screenHeight = MediaQuery.of(context).size.height;
//     final screenWidth = MediaQuery.of(context).size.width;
//     return Consumer<CalculatorProvider>(builder: (context, provider, _) {
//       return Scaffold(
//         appBar: AppBar(
//             automaticallyImplyLeading: false,
//             leading: IconButton(
//               icon:
//               Icon(Icons.arrow_back_ios_new_outlined, color: Colors.white),
//               onPressed: () {
//                 Navigator.pop(context); // Navigates back to the previous screen
//               },
//             ),
//             title: Text(
//               'Entry Details'.tr,
//               style: TextStyle(color: Colors.white),
//             ),
//             backgroundColor: Color(0xFF1CC1AB)),
//         body: SingleChildScrollView(
//           child: Column(
//             children: [
//               Container(
//                 color: Color(0xFF1CC1AB),
//                 padding: const EdgeInsets.all(16.0),
//                 child: Card(
//                   child: Padding(
//                     padding: const EdgeInsets.all(16.0),
//                     child: Column(
//                       children: [
//                         Row(
//                           children: [
//                             CircleAvatar(
//                               backgroundColor: Color(0xFF1CC1AB),
//                               child: Icon(Icons.person),
//                               radius: 25,
//                               // backgroundImage: AssetImage('asset/user.jpeg'), // Placeholder image
//                             ),
//                             const SizedBox(width: 16),
//                             Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   '${widget.name}'.tr,
//                                   style: TextStyle(
//                                       fontSize: 20,
//                                       fontWeight: FontWeight.bold),
//                                 ),
//                                 SizedBox(height: 4),
//                                 Text(
//                                   '${widget.date}'.tr,
//                                   style: TextStyle(
//                                       fontSize: 12, color: Colors.black54),
//                                 ),
//                               ],
//                             ),
//                             Spacer(),
//                             Column(
//                               crossAxisAlignment: CrossAxisAlignment.end,
//                               children: [
//                                 Text(
//                                   '₹${widget.comp}'.tr,
//                                   style: TextStyle(
//                                       fontSize: 20,
//                                       fontWeight: FontWeight.bold,
//                                       color: Color(0xFF1CC1AB)),
//                                 ),
//                                 SizedBox(height: 3),
//                                 Text(
//                                   'You got'.tr,
//                                   style: TextStyle(
//                                       fontSize: 16, color: Colors.black54),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                         const Divider(height: 30, thickness: 1),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text('Details'.tr, style: TextStyle(fontSize: 15)),
//                           ],
//                         ),
//                         const SizedBox(height: 5),
//                         const Divider(),
//                         const SizedBox(height: 5),
//                         Row(
//                           children: [
//                             Text(
//                               'Running Balance'.tr,
//                               style: TextStyle(
//                                   fontSize: 16,
//                                   color: Colors.black,
//                                   fontWeight: FontWeight.bold),
//                             ),
//                             Spacer(),
//                             Text(
//                               '₹${provider.compController.text}'.tr,
//                               style: TextStyle(
//                                   fontSize: 16,
//                                   color: Color(0xFF1CC1AB),
//                                   fontWeight: FontWeight.bold),
//                             ),
//                           ],
//                         ),
//                         const Divider(),
//                         GestureDetector(
//                           onTap: () {
//                             Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (context) => Calculatorgot(
//                                       name: '${widget.name}',
//                                       comp:
//                                       '${provider.compController.text}',
//                                       Id: '${widget.Id}',
//                                       billId: '${widget.billId}',
//                                     )));
//                           },
//                           child: Row(
//                             mainAxisSize: MainAxisSize.min,
//                             children: [
//                               Icon(Icons.edit, color: Color(0xFF1CC1AB)),
//                               SizedBox(width: 8),
//                               Text(
//                                 'Edit Entry'.tr,
//                                 style: TextStyle(
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 15,
//                                     color: Color(0xFF1CC1AB)),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//               Container(
//                 color: Colors.grey.shade200,
//                 padding: const EdgeInsets.all(8.0),
//                 child: Column(
//                   children: [
//                     Card(
//                       child: Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Row(
//                               children: [
//                                 Icon(Icons.sms_failed_outlined,
//                                     color: Colors.black),
//                                 const SizedBox(width: 10),
//                                 Text(
//                                   'SMS disabled'.tr,
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontWeight: FontWeight.bold),
//                                 ),
//                               ],
//                             ),
//                             const Divider(),
//                             Text(
//                                 'You gave: ₹ ${provider.compController.text}'
//                                     .tr,
//                                 style: TextStyle(
//                                     fontSize: 15,
//                                     color: Colors.grey,
//                                     fontWeight: FontWeight.bold)),
//                             Text(
//                                 'Balance: +(₹${provider.compController.text})'
//                                     .tr,
//                                 style: TextStyle(
//                                     fontSize: 15,
//                                     color: Colors.grey,
//                                     fontWeight: FontWeight.bold)),
//                             Text('Sent by:'.tr,
//                                 style: TextStyle(
//                                     fontSize: 15,
//                                     color: Colors.grey,
//                                     fontWeight: FontWeight.bold)),
//                             Text('Details:'.tr,
//                                 style: TextStyle(
//                                     fontSize: 15,
//                                     color: Colors.grey,
//                                     fontWeight: FontWeight.bold))
//                           ],
//                         ),
//                       ),
//                     ),
//                     Card(
//                       child: Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Row(
//                           children: [
//                             Icon(Icons.backup, color: Colors.grey.shade800),
//                             const SizedBox(width: 10),
//                             Text(
//                               'Entry is backed up'.tr,
//                               style: TextStyle(
//                                   color: Colors.grey,
//                                   fontWeight: FontWeight.bold),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(18.0),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Icon(Icons.safety_check_outlined,
//                               color: Color(0xFF1CC1AB)),
//                           const SizedBox(width: 10),
//                           Text(
//                             '100% Safe and Secure'.tr,
//                             style: TextStyle(
//                                 fontSize: 22,
//                                 color: Color(0xFF1CC1AB),
//                                 fontWeight: FontWeight.bold),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(15.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     ElevatedButton(
//                       onPressed: () async {
//                         await DatabaseMethods()
//                             .DeletePartyDetails(widget.Id.toString())
//                             .then((value) {
//                           Fluttertoast.showToast(
//                               msg:
//                               "Bill Details has been deleted successfully",
//                               toastLength: Toast.LENGTH_SHORT,
//                               gravity: ToastGravity.CENTER,
//                               timeInSecForIosWeb: 1,
//                               backgroundColor: Colors.red,
//                               textColor: Colors.white,
//                               fontSize: 16.0);
//                         });
//                         Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomePage()));
//                       },
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.red,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(10),
//                           side: BorderSide(color: Colors.red),
//                         ),
//                         minimumSize: Size(screenWidth * 0.4, 50),
//                       ),
//                       child: Row(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           Icon(Icons.delete, color: Colors.white),
//                           SizedBox(width: 8),
//                           Text(
//                             'DELETE'.tr,
//                             style: TextStyle(
//                                 color: Colors.white,
//                                 fontWeight: FontWeight.bold),
//                           ),
//                         ],
//                       ),
//                     ),
//                     ElevatedButton(
//                       onPressed: () {
//                         // Add share logic
//                       },
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Color(0xFF1CC1AB),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         minimumSize: Size(screenWidth * 0.4, 50),
//                       ),
//                       child: Row(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           Icon(Icons.share, color: Colors.white),
//                           SizedBox(width: 8),
//                           Text(
//                             'SHARE'.tr,
//                             style: TextStyle(
//                                 color: Colors.white,
//                                 fontWeight: FontWeight.bold),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       );
//     });
//   }
// }
//
// VIMP
// kkkkkk
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:get/get.dart';
// import 'package:provider/provider.dart';
// import 'package:sgibooks/calculator/you_got.dart';
// import 'package:sgibooks/home/home_page.dart';
// import 'package:sgibooks/provider/cal_provider.dart';
// import 'package:sgibooks/services/database.dart';
//
// class EntryDetails extends StatefulWidget {
//   final String? comp;
//   final String? date;
//   final String? Id;
//   final String? billId;
//   final String? name;
//
//   EntryDetails({
//     super.key,
//     this.comp,
//     this.date,
//     this.Id,
//     this.billId,
//     this.name,
//   });
//
//
//   @override
//   State<EntryDetails> createState() => _EntryDetailsState();
// }
//
// class _EntryDetailsState extends State<EntryDetails> {
//   @override
//   void initState() {
//     super.initState();
//     print(widget.Id);
//     print(widget.comp);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final screenHeight = MediaQuery.of(context).size.height;
//     final screenWidth = MediaQuery.of(context).size.width;
//     return Consumer<CalculatorProvider>(builder: (context, provider, _) {
//       return Scaffold(
//         appBar: AppBar(
//             automaticallyImplyLeading: false,
//             leading: IconButton(
//               icon:
//               Icon(Icons.arrow_back_ios_new_outlined, color: Colors.white),
//               onPressed: () {
//                 Navigator.pop(context); // Navigates back to the previous screen
//               },
//             ),
//             title: Text(
//               'Entry Details'.tr,
//               style: TextStyle(color: Colors.white),
//             ),
//             backgroundColor: Color(0xFF1CC1AB)),
//         body: SingleChildScrollView(
//           child: Column(
//             children: [
//               Container(
//                 color: Color(0xFF1CC1AB),
//                 padding: const EdgeInsets.all(16.0),
//                 child: Card(
//                   child: Padding(
//                     padding: const EdgeInsets.all(16.0),
//                     child: Column(
//                       children: [
//                         Row(
//                           children: [
//                             CircleAvatar(
//                               backgroundColor: Color(0xFF1CC1AB),
//                               child: Icon(Icons.person),
//                               radius: 25,
//                               // backgroundImage: AssetImage('asset/user.jpeg'), // Placeholder image
//                             ),
//                             const SizedBox(width: 16),
//                             Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   '${widget.name}'.tr,
//                                   style: TextStyle(
//                                       fontSize: 20,
//                                       fontWeight: FontWeight.bold),
//                                 ),
//                                 SizedBox(height: 4),
//                                 Text(
//                                   '${widget.date}'.tr,
//                                   style: TextStyle(
//                                       fontSize: 12, color: Colors.black54),
//                                 ),
//                               ],
//                             ),
//                             Spacer(),
//                             Column(
//                               crossAxisAlignment: CrossAxisAlignment.end,
//                               children: [
//                                 Text(
//                                   '₹${widget.comp}'.tr,
//                                   style: TextStyle(
//                                       fontSize: 20,
//                                       fontWeight: FontWeight.bold,
//                                       color: Color(0xFF1CC1AB)),
//                                 ),
//                                 SizedBox(height: 3),
//                                 Text(
//                                   'You got'.tr,
//                                   style: TextStyle(
//                                       fontSize: 16, color: Colors.black54),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                         const Divider(height: 30, thickness: 1),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text('Details'.tr, style: TextStyle(fontSize: 15)),
//                           ],
//                         ),
//                         const SizedBox(height: 5),
//                         const Divider(),
//                         const SizedBox(height: 5),
//                         Row(
//                           children: [
//                             Text(
//                               'Running Balance'.tr,
//                               style: TextStyle(
//                                   fontSize: 16,
//                                   color: Colors.black,
//                                   fontWeight: FontWeight.bold),
//                             ),
//                             Spacer(),
//                             Text(
//                                // '₹${provider.compController.text}'.tr,
//                                '${widget.comp}',
//                               style: TextStyle(
//                                   fontSize: 16,
//                                   color: Color(0xFF1CC1AB),
//                                   fontWeight: FontWeight.bold),
//                             ),
//                           ],
//                         ),
//                         const Divider(),
//                         GestureDetector(
//                           onTap: () {
//                             Navigator.pushReplacement(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (context) => Calculatorgot(
//                                       name: '${widget.name}',
//                                       comp: '${provider.compController.text}',
//                                       Id: '${widget.Id}',
//                                       billId: '${widget.billId}',
//                                     )));
//                           },
//                           child: Row(
//                             mainAxisSize: MainAxisSize.min,
//                             children: [
//                               Icon(Icons.edit, color: Color(0xFF1CC1AB)),
//                               SizedBox(width: 8),
//                               Text(
//                                 'Edit Entry'.tr,
//                                 style: TextStyle(
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 15,
//                                     color: Color(0xFF1CC1AB)),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//               Container(
//                 color: Colors.grey.shade200,
//                 padding: const EdgeInsets.all(8.0),
//                 child: Column(
//                   children: [
//                     Card(
//                       child: Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Row(
//                               children: [
//                                 Icon(Icons.sms_failed_outlined,
//                                     color: Colors.black),
//                                 const SizedBox(width: 10),
//                                 Text(
//                                   'SMS disabled'.tr,
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontWeight: FontWeight.bold),
//                                 ),
//                               ],
//                             ),
//                             const Divider(),
//                             Text(
//                                 'You gave: ₹ ${widget.comp}'
//                                     .tr,
//                                 style: TextStyle(
//                                     fontSize: 15,
//                                     color: Colors.grey,
//                                     fontWeight: FontWeight.bold)),
//                             Text(
//                                 'Balance: +(₹${widget.comp})'
//                                     .tr,
//                                 style: TextStyle(
//                                     fontSize: 15,
//                                     color: Colors.grey,
//                                     fontWeight: FontWeight.bold)),
//                             Text('Sent by:'.tr,
//                                 style: TextStyle(
//                                     fontSize: 15,
//                                     color: Colors.grey,
//                                     fontWeight: FontWeight.bold)),
//                             Text('Details:'.tr,
//                                 style: TextStyle(
//                                     fontSize: 15,
//                                     color: Colors.grey,
//                                     fontWeight: FontWeight.bold))
//                           ],
//                         ),
//                       ),
//                     ),
//                     Card(
//                       child: Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Row(
//                           children: [
//                             Icon(Icons.backup, color: Colors.grey.shade800),
//                             const SizedBox(width: 10),
//                             Text(
//                               'Entry is backed up'.tr,
//                               style: TextStyle(
//                                   color: Colors.grey,
//                                   fontWeight: FontWeight.bold),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(18.0),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Icon(Icons.safety_check_outlined,
//                               color: Color(0xFF1CC1AB)),
//                           const SizedBox(width: 10),
//                           Text(
//                             '100% Safe and Secure'.tr,
//                             style: TextStyle(
//                                 fontSize: 22,
//                                 color: Color(0xFF1CC1AB),
//                                 fontWeight: FontWeight.bold),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(15.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     ElevatedButton(
//                       onPressed: () async {
//                         await DatabaseMethods()
//                             .DeletePartyDetails(widget.Id.toString())
//                             .then((value) {
//                           Fluttertoast.showToast(
//                               msg:
//                               "Bill Details has been deleted successfully",
//                               toastLength: Toast.LENGTH_SHORT,
//                               gravity: ToastGravity.CENTER,
//                               timeInSecForIosWeb: 1,
//                               backgroundColor: Colors.red,
//                               textColor: Colors.white,
//                               fontSize: 16.0);
//                         });
//                         Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomePage()));
//                       },
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.red,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(10),
//                           side: BorderSide(color: Colors.red),
//                         ),
//                         minimumSize: Size(screenWidth * 0.4, 50),
//                       ),
//                       child: Row(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           Icon(Icons.delete, color: Colors.white),
//                           SizedBox(width: 8),
//                           Text(
//                             'DELETE'.tr,
//                             style: TextStyle(
//                                 color: Colors.white,
//                                 fontWeight: FontWeight.bold),
//                           ),
//                         ],
//                       ),
//                     ),
//                     ElevatedButton(
//                       onPressed: () {
//                         },
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Color(0xFF1CC1AB),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         minimumSize: Size(screenWidth * 0.4, 50),
//                       ),
//                       child: Row(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           Icon(Icons.share, color: Colors.white),
//                           SizedBox(width: 8),
//                           Text(
//                             'SHARE'.tr,
//                             style: TextStyle(
//                                 color: Colors.white,
//                                 fontWeight: FontWeight.bold),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       );
//     });
//   }
// }
// lkkkkkkk
//

import 'package:billing/calculator/you_got.dart';
import 'package:billing/home/home_page.dart';
import 'package:billing/provider/cal_provider.dart';
import 'package:billing/services/database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:fluttertoast/fluttertoast.dart';

class EntryDetails extends StatefulWidget {
  final String? comp;
  final String? date;
  final String? Id;
  final String? billId;
  final String? name;

  EntryDetails({
    super.key,
    this.comp,
    this.date,
    this.Id,
    this.billId,
    this.name,
  });

  @override
  State<EntryDetails> createState() => _EntryDetailsState();
}

class _EntryDetailsState extends State<EntryDetails> {
  @override
  void initState() {
    super.initState();
    print(widget.Id);
    print(widget.comp);
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Consumer<CalculatorProvider>(builder: (context, provider, _) {
      return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new_outlined, color: Colors.white),
            onPressed: () {
              Navigator.pop(context); // Navigates back to the previous screen
            },
          ),
          title: Text(
            'Entry Details'.tr,
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Color(0xFF1CC1AB),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: Color(0xFF1CC1AB),
                padding: const EdgeInsets.all(16.0),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: Color(0xFF1CC1AB),
                              child: Icon(Icons.person),
                              radius: 25,
                            ),
                            const SizedBox(width: 16),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${widget.name}'.tr,
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  '${widget.date}'.tr,
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.black54),
                                ),
                              ],
                            ),
                            Spacer(),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  '₹${widget.comp}'.tr,
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF1CC1AB)),
                                ),
                                SizedBox(height: 3),
                                Text(
                                  'You got'.tr,
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.black54),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const Divider(height: 30, thickness: 1),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Details'.tr, style: TextStyle(fontSize: 15)),
                          ],
                        ),
                        const SizedBox(height: 5),
                        const Divider(),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            Text(
                              'Running Balance'.tr,
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            Spacer(),
                            Text(
                              '${widget.comp}',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Color(0xFF1CC1AB),
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const Divider(),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Calculatorgot(
                                      name: '${widget .name}',
                                      comp: '${provider.compController.text}',
                                      Id: '${widget.Id}',
                                      billId: '${widget.billId}',
                                    )));
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.edit, color: Color(0xFF1CC1AB)),
                              SizedBox(width: 8),
                              Text(
                                'Edit Entry'.tr,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: Color(0xFF1CC1AB)),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                color: Colors.grey.shade200,
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.sms_failed_outlined,
                                    color: Colors.black),
                                const SizedBox(width: 10),
                                Text(
                                  'SMS disabled'.tr,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            const Divider(),
                            Text(
                                'You gave: ₹ ${widget.comp}'
                                    .tr,
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold)),
                            Text(
                                'Balance: +(₹${widget.comp})'
                                    .tr,
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold)),
                            Text('Sent by:'.tr,
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold)),
                            Text('Details:'.tr,
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold))
                          ],
                        ),
                      ),
                    ),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Icon(Icons.backup, color: Colors.grey.shade800),
                            const SizedBox(width: 10),
                            Text(
                              'Entry is backed up'.tr,
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.safety_check_outlined,
                              color: Color(0xFF1CC1AB)),
                          const SizedBox(width: 10),
                          Text(
                            '100% Safe and Secure'.tr,
                            style: TextStyle(
                                fontSize: 22,
                                color: Color(0xFF1CC1AB),
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        await DatabaseMethods()
                            .DeletePartyDetails(widget.Id.toString())
                            .then((value) {
                          Fluttertoast.showToast(
                              msg:
                              "Bill Details has been deleted successfully",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0);
                        });
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomePage()));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide(color: Colors.red),
                        ),
                        minimumSize: Size(screenWidth * 0.4, 50),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.delete, color: Colors.white),
                          SizedBox(width: 8),
                          Text(
                            'DELETE'.tr,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        final String message = 'Check out this entry: ${widget.name}, Date: ${widget.date}, Amount: ₹${widget.comp}';
                        // Share.share(message, subject: 'Entry Details');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF1CC1AB),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        minimumSize: Size(screenWidth * 0.4, 50),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.share, color: Colors.white),
                          SizedBox(width: 8),
                          Text(
                            'SHARE'.tr,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
