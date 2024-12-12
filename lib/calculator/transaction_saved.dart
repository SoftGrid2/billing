// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:provider/provider.dart';
// import 'package:sgibooks/calculator/you_gave.dart';
// import 'package:sgibooks/calculator/you_got.dart';
// import 'package:sgibooks/home/home_page.dart';
// import 'package:sgibooks/provider/cal_provider.dart';
// class TransactionSaved extends StatefulWidget {
//   final String? comp;
//   final String? Id;
//   final String? billId;
//   final String? name;
//   const TransactionSaved({super.key,this.comp, this.Id, this.billId, this.name,});
//
//   @override
//   State<TransactionSaved> createState() => _TransactionSavedState();
// }
//
// class _TransactionSavedState extends State<TransactionSaved> {
//   @override
//   void initState() {
//     super.initState();
//     print('999999999999999');
//     print(widget.comp);
//     print(widget.Id);
//     print(widget.name);
//     print('999999999999999');
//   }
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     final ScreenHeight = MediaQuery.of(context).size.height;
//     final ScreenWidth = MediaQuery.of(context).size.width;
//     return Consumer<CalculatorProvider>(builder: (context, provider, _)
//     {
//       return Scaffold(
//         appBar: AppBar(
//             automaticallyImplyLeading: false,
//             toolbarHeight: ScreenHeight * 0.3,
//             flexibleSpace: Stack(
//               children: [
//                 Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     Center(child: Text('Transaction saved'.tr, style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold),)),
//                     Center(child: Text('₹ ${widget.comp}'.tr, style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 25,
//                         fontWeight: FontWeight.bold),)),
//                   ],
//                 ),
//               ],
//             ),
//             // backgroundColor: Color(0xff0752AD),
//
//             backgroundColor: Color(0xFF1CC1AB)
//         ),
//
//         body: Padding(
//           padding: const EdgeInsets.all(12.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Text('Add another transaction for ${widget.name}'.tr),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     InkWell(
//                       onTap: () {
//                         Navigator.push(context, MaterialPageRoute(builder: (
//                             context) =>
//                             Calculatorgave(
//                               comp: '${provider.compController.text}',
//                               Id: '${widget.Id}',
//                               billId: '${widget.billId}',
//                               name: '${widget.name}',
//                             )));
//                       },
//                       child: Container(
//                         height: ScreenHeight * 0.06, // Responsive height
//                         width: ScreenWidth * 0.4, // 80% of screen width
//                         decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(6),
//                             border: Border.all(
//                               width: 0.4,
//                               color: Colors.black,
//                             ),
//                             color: Colors.red),
//                         child: Padding(
//                           padding: EdgeInsets.only(
//                               left: 10.0, top: 10.0, bottom: 10, right: 10),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             children: [
//                               Text(
//                                 maxLines: 1,
//                                 'YOU GAVE'.tr,
//                                 style: TextStyle(
//                                     color: Colors.white, fontSize: 16),
//                               ),
//                               Icon(
//                                 Icons.currency_rupee,
//                                 color: Colors.white,
//                               )
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                     Spacer(),
//                     InkWell(
//                       onTap: () {
//                         Navigator.push(context, MaterialPageRoute(builder: (
//                             context) =>
//                             Calculatorgot(
//                               comp: '${provider.compController.text}',
//                               Id: '${widget.Id}',
//                               billId: '${widget.billId}',
//                               name: '${widget.name}',
//                             )));
//                       },
//                       child: Container(
//                         height: ScreenHeight * 0.06, // Responsive height
//                         width: ScreenWidth * 0.4, // 80% of screen width
//                         decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(6),
//                             border: Border.all(
//                               width: 0.4,
//                               color: Colors.black,
//                             ),
//                             color: Color(0xFF1CC1AB)),
//                         child: Padding(
//                           padding: EdgeInsets.only(
//                               left: 10.0, top: 10.0, bottom: 10, right: 10),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             children: [
//                               Text(
//                                 maxLines: 1,
//                                 'YOU GOT'.tr,
//                                 style: TextStyle(
//                                     color: Colors.white, fontSize: 16),
//                               ),
//                               Icon(
//                                 Icons.currency_rupee,
//                                 color: Colors.white,
//                               )
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Spacer(),
//               InkWell(
//                 onTap: () async {
//                   await saveBuilkReminder();
//                   Navigator.push(context,
//                       MaterialPageRoute(builder: (context) => HomePage()));
//                 },
//
//                 child: Container(
//                   height: ScreenHeight * 0.06, // Responsive height
//                   width: ScreenWidth * 0.9, // 80% of screen width
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(6),
//                       border: Border.all(
//                         width: 0.4,
//                         color: Colors.black,
//                       ),
//                       color: Color(0xFF1CC1AB)),
//                   child: Padding(
//                     padding: EdgeInsets.only(
//                         left: 10.0, top: 10.0, bottom: 10, right: 10),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         Text(
//                           maxLines: 1,
//                           'DONE'.tr,
//                           style: TextStyle(color: Colors.white, fontSize: 16),
//                         ),
//                         Icon(
//                           Icons.currency_rupee,
//                           color: Colors.white,
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//
//             ],
//           ),
//         ),);
//     }
//     );
//   }
//
//   Future<void>saveBuilkReminder() async {
//     print('okkkkkkk');
//     await Future.delayed(Duration(seconds: 1));
//
//   }
// }
// // Show the bottom sheet
// // showModalBottomSheet(
// //   context: context,
// //   shape: RoundedRectangleBorder(
// //     borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
// //   ),
// //   builder: (context) {
// //     return Container(
// //       padding: const EdgeInsets.all(16.0),
// //       height: MediaQuery.of(context).size.height * 0.3,
// //       child: Column(
// //         mainAxisAlignment: MainAxisAlignment.center,
// //         children: [
// //           const Icon(Icons.check_circle, color: Colors.green, size: 48),
// //           const SizedBox(height: 16),
// //           Text(
// //             'Transaction Saved!',
// //             style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
// //           ),
// //           const SizedBox(height: 8),
// //           Text(
// //             'The details for ₹${provider.compController.text} have been successfully saved.',
// //             textAlign: TextAlign.center,
// //           ),
// //           const SizedBox(height: 16),
// //           ElevatedButton(
// //             style: ElevatedButton.styleFrom(
// //               backgroundColor: Colors.red,
// //             ),
// //             onPressed: () {
// //               // Close the bottom sheet and navigate to the TransactionSaved screen
// //               Navigator.pop(context);
// //               Navigator.push(
// //                 context,
// //                 MaterialPageRoute(
// //                   builder: (context) => TransactionSaved(
// //                     comp: provider.compController.text,
// //                     name: widget.name,
// //                   ),
// //                 ),
// //               );
// //             },
// //             child: const Text('View Details'),
// //           ),
// //         ],
// //       ),
// //     );
// //   },
// // );


import 'package:billing/calculator/you_gave.dart';
import 'package:billing/calculator/you_got.dart';
import 'package:billing/provider/cal_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../home/home_page.dart';


class TransactionSaved extends StatefulWidget {
  final String? comp;
  final String? Id;
  final String? billId;
  final String? name;
  final String? mobile;
  const TransactionSaved({
    super.key,
    this.comp,
    this.Id,
    this.billId,
    this.name,
    this.mobile
  });

  @override
  State<TransactionSaved> createState() => _TransactionSavedState();
}

class _TransactionSavedState extends State<TransactionSaved> {
  @override
  void initState() {
    super.initState();
    print('999999999999999');
    print(widget.comp);
    print(widget.Id);
    print(widget.name);
    print('999999999999999');
  }

  @override
  Widget build(BuildContext context) {
    final ScreenHeight = MediaQuery.of(context).size.height;
    final ScreenWidth = MediaQuery.of(context).size.width;
    return Consumer<CalculatorProvider>(builder: (context, provider, _) {
      return Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: ScreenHeight * 0.3,
            flexibleSpace: Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                        child: Text(
                      'Transaction saved'.tr,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    )),
                    Center(
                        child: Text(
                      '₹ ${widget.comp}'.tr,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    )),
                  ],
                ),
              ],
            ),
            // backgroundColor: Color(0xff0752AD),

            backgroundColor: Color(0xFF1CC1AB)),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Add another transaction for ${widget.name}'.tr),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Calculatorgave(
                                      comp: '${provider.compController.text}',
                                      Id: '${widget.Id}',
                                      billId: '${widget.billId}',
                                      name: '${widget.name}',
                                    )));
                      },
                      child: Container(
                        height: ScreenHeight * 0.06, // Responsive height
                        width: ScreenWidth * 0.4, // 80% of screen width
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(
                              width: 0.4,
                              color: Colors.black,
                            ),
                            color: Colors.red),
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: 10.0, top: 10.0, bottom: 10, right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                maxLines: 1,
                                'YOU GAVE'.tr,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                              Icon(
                                Icons.currency_rupee,
                                color: Colors.white,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Spacer(),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Calculatorgot(
                                      comp: '${provider.compController.text}',
                                      Id: '${widget.Id}',
                                      billId: '${widget.billId}',
                                      name: '${widget.name}',
                                    )));
                      },
                      child: Container(
                        height: ScreenHeight * 0.06, // Responsive height
                        width: ScreenWidth * 0.4, // 80% of screen width
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(
                              width: 0.4,
                              color: Colors.black,
                            ),
                            color: Color(0xFF1CC1AB)),
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: 10.0, top: 10.0, bottom: 10, right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                maxLines: 1,
                                'YOU GOT'.tr,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                              Icon(
                                Icons.currency_rupee,
                                color: Colors.white,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
              InkWell(
                onTap: () async {
                  await saveBuilkReminder();
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                },

                child: Container(
                  height: ScreenHeight * 0.06, // Responsive height
                  width: ScreenWidth * 0.9, // 80% of screen width
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(
                        width: 0.4,
                        color: Colors.black,
                      ),
                      color: Color(0xFF1CC1AB)),
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: 10.0, top: 10.0, bottom: 10, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          maxLines: 1,
                          'DONE'.tr,
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        Icon(
                          Icons.currency_rupee,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              // hhhhhhhhhhhh

              // InkWell(
              //   onTap: () async {
              //     await saveBuilkReminder();
              //     showModalBottomSheet(
              //       context: context,
              //       shape: RoundedRectangleBorder(
              //         borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
              //       ),
              //       builder: (context) {
              //         return Container(
              //           padding: const EdgeInsets.all(16.0),
              //           height: MediaQuery.of(context).size.height * 0.4,
              //           child: Column(
              //             mainAxisAlignment: MainAxisAlignment.center,
              //             children: [
              //               const Icon(Icons.check_circle, color: Colors.green, size: 48),
              //               const SizedBox(height: 16),
              //               Text(
              //                 'Send Msg to ${widget.name} ?',
              //                 style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              //               ),
              //               const SizedBox(height: 8),
              //               Container(
              //                 decoration: BoxDecoration(
              //                   border: Border.all(
              //                     color: Colors.black, // Set the color of the border
              //                     width: 2.0, // Set the width of the border
              //                   ),
              //                   borderRadius: BorderRadius.circular(8.0), // Optional: to make the corners rounded
              //                 ),
              //                 padding: EdgeInsets.all(16.0), // Optional: add some padding inside the container
              //                 child: Column(
              //                   mainAxisAlignment: MainAxisAlignment.start,
              //                   crossAxisAlignment: CrossAxisAlignment.start,
              //                   children: [
              //                     Text(
              //                       'You got: -${widget.comp}',textAlign: TextAlign.start,
              //
              //                     ),
              //                     Text('Balance: -${widget.comp}', textAlign: TextAlign.start,),
              //                     Text('Send by Priya Jewelers: - (8080371669)'),
              //                   ],
              //                 ),
              //               ),
              //               const SizedBox(height: 16),
              //
              //               Row(children: [
              //                 Container(
              //                   height: ScreenHeight * 0.05, // Responsive height
              //                   width: ScreenWidth * 0.4, // 80% of screen width
              //                   decoration: BoxDecoration(
              //                       borderRadius: BorderRadius.circular(6),
              //                       border: Border.all(
              //                         width: 0.4,
              //                         color: Colors.black,
              //                       ),
              //                       color: Colors.red),
              //                   child: Padding(
              //                     padding: EdgeInsets.only(
              //                         left: 10.0, top: 10.0, bottom: 10, right: 10),
              //                     child: Row(
              //                       mainAxisAlignment: MainAxisAlignment.center,
              //                       crossAxisAlignment: CrossAxisAlignment.center,
              //                       children: [
              //                         InkWell(
              //                           onTap: (){
              //                             print('share sssssss');
              //                           },
              //                           child: Text(
              //                             maxLines: 1,
              //                             'Share'.tr,
              //                             style: TextStyle(
              //                                 color: Colors.white, fontSize: 16),
              //                           ),
              //                         ),
              //                       ],
              //                     ),
              //                   ),
              //                 ),
              //                 Spacer(),
              //                 Container(
              //                   height: ScreenHeight * 0.06, // Responsive height
              //                   width: ScreenWidth * 0.4, // 80% of screen width
              //                   decoration: BoxDecoration(
              //                       borderRadius: BorderRadius.circular(6),
              //                       border: Border.all(
              //                         width: 0.4,
              //                         color: Colors.black,
              //                       ),
              //                       color: Color(0xFF1CC1AB)),
              //                   child: Padding(
              //                     padding: EdgeInsets.only(
              //                         left: 10.0, top: 10.0, bottom: 10, right: 10),
              //                     child: Row(
              //                       mainAxisAlignment: MainAxisAlignment.center,
              //                       crossAxisAlignment: CrossAxisAlignment.center,
              //                       children: [
              //                         InkWell(
              //                           onTap: (){
              //                             Navigator.pop(context);
              //                           },
              //                           child: Text(
              //                             maxLines: 1,
              //                             'NO'.tr,
              //                             style: TextStyle(
              //                                 color: Colors.white, fontSize: 16),
              //                           ),
              //                         ),
              //
              //                       ],
              //                     ),
              //                   ),
              //                 ),
              //
              //               ],)
              //             ],
              //           ),
              //         );
              //
              //       },
              //     ).then((_) {
              //       Navigator.pushReplacement(
              //         context,
              //         MaterialPageRoute(builder: (context) => HomePage()),
              //       );
              //     });
              //   },
              //   child:  Container(
              //     height: ScreenHeight * 0.06, // Responsive height
              //     width: ScreenWidth * 0.9, // 80% of screen width
              //     decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(6),
              //         border: Border.all(
              //           width: 0.4,
              //           color: Colors.black,
              //         ),
              //         color: Color(0xFF1CC1AB)),
              //     child: Padding(
              //       padding: EdgeInsets.only(
              //           left: 10.0, top: 10.0, bottom: 10, right: 10),
              //       child: Row(
              //         mainAxisAlignment: MainAxisAlignment.center,
              //         crossAxisAlignment: CrossAxisAlignment.center,
              //         children: [
              //           Text(
              //             maxLines: 1,
              //             'DONE'.tr,
              //             style: TextStyle(color: Colors.white, fontSize: 16),
              //           ),
              //           Icon(
              //             Icons.currency_rupee,
              //             color: Colors.white,
              //           )
              //         ],
              //       ),
              //     ),
              //   ),
              // )
                  // this is without using sms package

// uuuuuuuuuu
              // import 'package:flutter_sms/flutter_sms.dart'; // Add this dependency to your pubspec.yaml

              // InkWell(
              //   onTap: () async {
              //     await saveBuilkReminder();
              //     showModalBottomSheet(
              //       context: context,
              //       shape: RoundedRectangleBorder(
              //         borderRadius:
              //             BorderRadius.vertical(top: Radius.circular(16)),
              //       ),
              //       builder: (context) {
              //         return Container(
              //           padding: const EdgeInsets.all(16.0),
              //           height: MediaQuery.of(context).size.height * 0.4,
              //           child: Column(
              //             mainAxisAlignment: MainAxisAlignment.center,
              //             children: [
              //               const Icon(Icons.check_circle,
              //                   color: Colors.green, size: 48),
              //               const SizedBox(height: 16),
              //               Text(
              //                 'Send SMS to ${widget.name} ?',
              //                 style: const TextStyle(
              //                     fontSize: 20, fontWeight: FontWeight.bold),
              //               ),
              //               const SizedBox(height: 8),
              //               Container(
              //                 decoration: BoxDecoration(
              //                   border: Border.all(
              //                     color: Colors.black,
              //                     width: 2.0,
              //                   ),
              //                   borderRadius: BorderRadius.circular(8.0),
              //                 ),
              //                 padding: EdgeInsets.all(16.0),
              //                 child: Column(
              //                   mainAxisAlignment: MainAxisAlignment.start,
              //                   crossAxisAlignment: CrossAxisAlignment.start,
              //                   children: [
              //                     Text('You got: -${widget.comp}',
              //                         textAlign: TextAlign.start),
              //                     Text('Balance: -${widget.comp}',
              //                         textAlign: TextAlign.start),
              //                     Text(
              //                         'Send by Priya Jewelers: - (Priya Jewelers)'),
              //                   ],
              //                 ),
              //               ),
              //               const SizedBox(height: 16),
              //               Row(
              //                 children: [
              //                   // YES Button
              //                   Container(
              //                     height: ScreenHeight * 0.05,
              //                     width: ScreenWidth * 0.4,
              //                     decoration: BoxDecoration(
              //                       borderRadius: BorderRadius.circular(6),
              //                       border: Border.all(
              //                         width: 0.4,
              //                         color: Colors.black,
              //                       ),
              //                       color: Colors.red,
              //                     ),
              //                     child: InkWell(
              //                       onTap: () async {
              //                         _sendSMS(message: 'HIIIIIIIIIIIIII', recipients: ['+91 8080371669']);
              //
              //                         // Function to send SMS
              //                         String message =
              //                             "You got: -${widget.comp}\nBalance: -${widget.comp}\nSent by Priya Jewelers.";
              //                         List<String> recipients = [
              //                           // widget.phoneNumber
              //                           '${widget.mobile}'
              //                         ]; // Replace with the recipient's mobile number
              //
              //
              //                         // try {
              //                         //   String result = await sendSMS(
              //                         //       message: message,
              //                         //       recipients: recipients,
              //                         //   sendDirect: false
              //                         //   );
              //                         //   print("SMS sent successfully: $result");
              //                         //   Navigator.pop(
              //                         //       context); // Close modal on success
              //                         // } catch (error) {
              //                         //   print("Failed to send SMS: $error");
              //                         // }
              //                       },
              //                       child: Padding(
              //                         padding: EdgeInsets.all(10.0),
              //                         child: Center(
              //                           child: Text(
              //                             maxLines: 1,
              //                             'YES'.tr,
              //                             style: TextStyle(
              //                                 color: Colors.white,
              //                                 fontSize: 16),
              //                           ),
              //                         ),
              //                       ),
              //                     ),
              //                   ),
              //                   Spacer(),
              //                   // NO Button
              //                   Container(
              //                     height: ScreenHeight * 0.06,
              //                     width: ScreenWidth * 0.4,
              //                     decoration: BoxDecoration(
              //                       borderRadius: BorderRadius.circular(6),
              //                       border: Border.all(
              //                         width: 0.4,
              //                         color: Colors.black,
              //                       ),
              //                       color: Color(0xFF1CC1AB),
              //                     ),
              //                     child: InkWell(
              //                       onTap: () {
              //                         Navigator.pop(context);
              //                       },
              //                       child: Padding(
              //                         padding: EdgeInsets.all(10.0),
              //                         child: Center(
              //                           child: Text(
              //                             maxLines: 1,
              //                             'NO'.tr,
              //                             style: TextStyle(
              //                                 color: Colors.white,
              //                                 fontSize: 16),
              //                           ),
              //                         ),
              //                       ),
              //                     ),
              //                   ),
              //                 ],
              //               ),
              //             ],
              //           ),
              //         );
              //       },
              //     ).then((_) {
              //       Navigator.pushReplacement(
              //         context,
              //         MaterialPageRoute(builder: (context) => HomePage()),
              //       );
              //     });
              //   },
              //   child: Container(
              //     height: ScreenHeight * 0.06,
              //     width: ScreenWidth * 0.9,
              //     decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(6),
              //       border: Border.all(
              //         width: 0.4,
              //         color: Colors.black,
              //       ),
              //       color: Color(0xFF1CC1AB),
              //     ),
              //     child: Padding(
              //       padding: EdgeInsets.all(10.0),
              //       child: Row(
              //         mainAxisAlignment: MainAxisAlignment.center,
              //         crossAxisAlignment: CrossAxisAlignment.center,
              //         children: [
              //           Text(
              //             maxLines: 1,
              //             'DONE'.tr,
              //             style: TextStyle(color: Colors.white, fontSize: 16),
              //           ),
              //           Icon(
              //             Icons.currency_rupee,
              //             color: Colors.white,
              //           ),
              //         ],
              //       ),
              //     ),
              //   ),
              // )
            //    for sms
            ],
          ),
        ),
      );
    });
  }


  Future<void> saveBuilkReminder() async {
    print('okkkkkkk');
    await Future.delayed(Duration(seconds: 1));
  }



//   _sendSMS ({required String message, required List<String> recipients})async{
// List<String> recepients =["+91 8080371669"];
// await _sendSMS(message: 'Hiii ', recipients: recepients);
//   }
}

// Show the bottom sheet
// showModalBottomSheet(
//   context: context,
//   shape: RoundedRectangleBorder(
//     borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
//   ),
//   builder: (context) {
//     return Container(
//       padding: const EdgeInsets.all(16.0),
//       height: MediaQuery.of(context).size.height * 0.3,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           const Icon(Icons.check_circle, color: Colors.green, size: 48),
//           const SizedBox(height: 16),
//           Text(
//             'Transaction Saved!',
//             style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(height: 8),
//           Text(
//             'The details for ₹${provider.compController.text} have been successfully saved.',
//             textAlign: TextAlign.center,
//           ),
//           const SizedBox(height: 16),
//           ElevatedButton(
//             style: ElevatedButton.styleFrom(
//               backgroundColor: Colors.red,
//             ),
//             onPressed: () {
//               // Close the bottom sheet and navigate to the TransactionSaved screen
//               Navigator.pop(context);
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => TransactionSaved(
//                     comp: provider.compController.text,
//                     name: widget.name,
//                   ),
//                 ),
//               );
//             },
//             child: const Text('View Details'),
//           ),
//         ],
//       ),
//     );
//   },
// )