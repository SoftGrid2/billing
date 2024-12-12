// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:provider/provider.dart';
// import 'package:sgibooks/provider/cal_provider.dart';
// import 'entry_details.dart';
// import '../calculator/you_gave.dart';
// import '../calculator/you_got.dart';
//
// class CustomerHistory extends StatefulWidget {
//
//   final String? name;
//   final String? flat;
//   final String? comp;
//   final String? date;
//   final String? Id;
//   final String? billId;
//
//   CustomerHistory({
//     Key? key,
//     this.name,
//     this.flat,
//     this.comp,
//     this.date,
//     this.Id,
//     this.billId,
//   }) : super(key: key);
//
//   @override
//   State<CustomerHistory> createState() => _CustomerHistoryState();
// }
//
// class _CustomerHistoryState extends State<CustomerHistory> {
//   @override
//   Widget build(BuildContext context) {
//     return LayoutBuilder(
//       builder: (context, constraints) {
//         final screenHeight = constraints.maxHeight;
//         final screenWidth = constraints.maxWidth;
//         return Consumer<CalculatorProvider>(builder: (context, provider, _)
//         {
//           return Scaffold(
//             backgroundColor: Color(0xFFFFFFFF),
//             appBar: AppBar(
//                 automaticallyImplyLeading: false,
//                 toolbarHeight: screenHeight * 0.2,
//                 flexibleSpace: Stack(
//                   children: [
//                     Column(
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.all(16.0),
//                           child: ListTile(
//                             title: Row(
//                               children: [
//                                 Expanded(
//                                   child: Text(
//                                     // '{$name}'.trParams({'name':name}),
//                                     '${widget.name}'.tr,
//                                     style: TextStyle(color:Color(0xFFFFFFFF),
//                                         fontSize: screenHeight * 0.02),
//                                     overflow: TextOverflow.ellipsis,
//                                   ),
//                                 ),
//                                 SizedBox(width: screenWidth * 0.01),
//                                 Container(
//                                   height: screenHeight * 0.03,
//                                   width: screenWidth * 0.2,
//                                   decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(8.0),
//                                     border: Border.all(
//                                         width: 0.4, color: Colors.black),
//                                   ),
//                                   child: Center(
//                                     child: Text(
//                                       'Customer'.tr,
//                                       style: TextStyle(color: Color(0xFFFFFFFF),
//                                           fontSize: screenHeight * 0.015),
//                                       textAlign: TextAlign.center,
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             subtitle: Text(
//                               '${widget.flat}'.tr,
//                               style: TextStyle(color: Color(0xFFFFFFFF),
//                                   fontSize: screenHeight * 0.02),
//                             ),
//                             leading: CircleAvatar(
//                               radius: screenHeight * 0.03,
//                             ),
//                             trailing: Icon(Icons.call, color: Color(0xFFFFFFFF)),
//                           ),
//                         ),
//                         Container(
//                           margin: EdgeInsets.symmetric(
//                               horizontal: screenWidth * 0.05),
//                           padding: EdgeInsets.all(screenHeight * 0.01),
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(6),
//                             border: Border.all(width: 0.4, color: Colors.black),
//                             color: Color(0xFFFFFFFF),
//                           ),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text('You will give'.tr, style: TextStyle(
//                                   fontSize: screenHeight * 0.02)),
//                               Text('${widget.comp}'.tr, style: TextStyle(
//                                   fontSize: screenHeight * 0.02)),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//                 backgroundColor: Color(0xFF1CC1AB)
//             ),
//             body: Padding(
//               padding: EdgeInsets.all(screenWidth * 0.03),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       _buildActionIcon(
//                           Icons.picture_as_pdf, 'Report'.tr, screenHeight),
//                       _buildActionIcon(
//                           Icons.add_ic_call, 'Reminder'.tr, screenHeight),
//                       _buildActionIcon(
//                           Icons.message_sharp, 'SMS'.tr, screenHeight),
//                     ],
//                   ),
//                   SizedBox(height: screenHeight * 0.02),
//                   Container(
//                     height: screenHeight * 0.5,
//                     padding: EdgeInsets.all(screenWidth * 0.03),
//                     decoration: BoxDecoration(
//                       color: Colors.grey[200],
//                       borderRadius: BorderRadius.circular(8.0),
//                     ),
//                     child: Column(
//                       children: [
//                         Container(
//                           padding: EdgeInsets.all(screenHeight * 0.015),
//                           decoration: BoxDecoration(
//                             color: Colors.grey[300],
//                             borderRadius: BorderRadius.circular(8.0),
//                           ),
//                           child: Row(
//                             children: [
//                               Icon(Icons.lock, size: screenHeight * 0.03),
//                               SizedBox(width: screenWidth * 0.03),
//                               Expanded(
//                                 child: Text(
//                                   // 'Only you and {name} can see these entries'.trParams({'name':name}),
//                                   'Only you and ${widget.name} can see these entries'.tr,
//                                   style: TextStyle(fontWeight: FontWeight.bold,
//                                       fontSize: screenHeight * 0.018),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         Spacer(),
//                         GestureDetector(
//                           onTap: () {
//                             print(widget.Id);
//                             // return;
//                             Navigator.push(context, MaterialPageRoute(
//                                 builder: (context) =>
//                                     EntryDetails(
//                                       comp: '${provider.compController.text}',
//                                       date : '${widget.date}',
//                                       name: '${widget.name}',
//                                       billId: '${widget.billId}',
//                                       Id: '${widget.Id}',
//                                     )));
//                           },
//                           child: Container(
//                             padding: EdgeInsets.all(screenHeight * 0.015),
//                             decoration: BoxDecoration(
//                               color: Colors.grey[300],
//                               borderRadius: BorderRadius.circular(8.0),
//                             ),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Text('${widget.date}'.tr, style: TextStyle(
//                                     fontWeight: FontWeight.bold)),
//                                 Text('${widget.comp}'.tr),
//                               ],
//                             ),
//                           ),
//                         ),
//                         Spacer(),
//                         Text(
//                           // 'Start adding transactions with {name}'.trParams({'name':name}),
//                           'Start adding transactions with ${widget.name}'.tr,
//                           style: TextStyle(fontWeight: FontWeight.bold,
//                               fontSize: screenHeight * 0.022),
//                           textAlign: TextAlign.center,
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(height: screenHeight * 0.03),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       _buildTransactionButton(
//                         context,
//                         'YOU GAVE'.tr,
//                         Icons.currency_rupee,
//                         Colors.red,
//                             () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) =>
//                                   Calculatorgave(
//                                     comp: '${provider.compController.text}',
//                                     Id: widget.Id,
//                                     billId: 'billId',
//                                     name: '${widget.name}',
//                                   ),
//                             ),
//                           );
//                         },
//                         screenHeight,
//                         screenWidth,
//                       ),
//
//                       _buildTransactionButton(
//                         context,
//                         'YOU GOT'.tr,
//                         Icons.currency_rupee,
//                         Color(0xFF1CC1AB),
//                             () {
//                           Navigator.push(context,MaterialPageRoute(
//                               builder: (context) =>
//                                   Calculatorgot(comp: '${provider.compController.text}',
//                                     billId: 'billId',
//                                     Id: widget.Id,
//                                     name: '${widget.name}',
//                                   )));
//                         },
//                         screenHeight,
//                         screenWidth,
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           );
//         });
//       },
//     );
//   }
//
//   Widget _buildActionIcon(IconData icon, String label, double screenHeight) {
//     return Column(
//       children: [
//         Icon(icon, size: screenHeight * 0.04),
//         SizedBox(height: screenHeight * 0.01),
//         Text(label, style: TextStyle(fontSize: screenHeight * 0.02)),
//       ],
//     );
//   }
//
//   Widget _buildTransactionButton(
//       BuildContext context,
//       String text,
//       IconData icon,
//       Color color,
//       VoidCallback onTap,
//       double screenHeight,
//       double screenWidth,
//       ) {
//     return Container(
//       height: screenHeight * 0.06,
//       width: screenWidth * 0.4,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(6),
//         color: color,
//       ),
//       child: InkWell(
//         onTap: onTap,
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(text, style: TextStyle(color:Color(0xFFFFFFFF), fontSize: screenHeight * 0.02)),
//             Icon(icon, color: Color(0xFFFFFFFF)),
//           ],
//         ),
//       ),
//     );
//   }
// }
// VIMP

import 'package:billing/provider/cal_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'entry_details.dart';
import '../calculator/you_gave.dart';
import '../calculator/you_got.dart';

class CustomerHistory extends StatefulWidget {
  final String? name;
  final String? mobile;
  final String? flat;
  final String? comp;
  final String? date;
  final String? Id;
  final String? billId;
  CustomerHistory({
    Key? key,
    this.name,
    this.mobile,
    this.flat,
    this.comp,
    this.date,
    this.Id,
    this.billId,
  }) : super(key: key);

  @override
  State<CustomerHistory> createState() => _CustomerHistoryState();
}


class _CustomerHistoryState extends State<CustomerHistory> {


  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final screenHeight = constraints.maxHeight;
        final screenWidth = constraints.maxWidth;
        return Consumer<CalculatorProvider>(builder: (context, provider, _) {
          return Scaffold(
            backgroundColor: Color(0xFFFFFFFF),
            appBar: AppBar(
                automaticallyImplyLeading: false,
                toolbarHeight: screenHeight * 0.2,
                flexibleSpace: Stack(
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: ListTile(
                            title: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    // '{$name}'.trParams({'name':name}),
                                    '${widget.name}'.tr,
                                    style: TextStyle(
                                        color: Color(0xFFFFFFFF),
                                        fontSize: screenHeight * 0.02),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                SizedBox(width: screenWidth * 0.01),
                                Container(
                                  height: screenHeight * 0.03,
                                  width: screenWidth * 0.2,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.0),
                                    border: Border.all(
                                        width: 0.4, color: Colors.black),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Customer'.tr,
                                      style: TextStyle(
                                          color: Color(0xFFFFFFFF),
                                          fontSize: screenHeight * 0.015),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            subtitle: Text(
                              '${widget.flat}'.tr,
                              style: TextStyle(
                                  color: Color(0xFFFFFFFF),
                                  fontSize: screenHeight * 0.02),
                            ),
                            leading: CircleAvatar(
                              radius: screenHeight * 0.03,
                            ),
                            trailing:
                                Icon(Icons.call, color: Color(0xFFFFFFFF)),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: screenWidth * 0.05),
                          padding: EdgeInsets.all(screenHeight * 0.01),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(width: 0.4, color: Colors.black),
                            color: Color(0xFFFFFFFF),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('You will give'.tr,
                                  style:
                                      TextStyle(fontSize: screenHeight * 0.02)),
                              Text('${widget.comp}'.tr,
                                  style:
                                      TextStyle(fontSize: screenHeight * 0.02)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                backgroundColor: Color(0xFF1CC1AB)),
            body: Padding(
              padding: EdgeInsets.all(screenWidth * 0.03),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Icon(Icons.picture_as_pdf),
                          Text('Report'),
                        ],
                      ),

                      InkWell(
                        onTap: (){
                           FlutterPhoneDirectCaller.callNumber('+9822521916');
                          // _makePhoneCall('9822521916');

                        },
                        // launch('tel:+123456');
                        child: Column(
                          children: [
                            Icon(Icons.call),
                            Text('Reminder')
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          sendsms();
                        },
                        child: Column(
                          children: [
                            Icon(Icons.sms_outlined),
                            Text('SMS')
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Container(
                    height: screenHeight * 0.5,
                    padding: EdgeInsets.all(screenWidth * 0.03),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(screenHeight * 0.015),
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.lock, size: screenHeight * 0.03),
                              SizedBox(width: screenWidth * 0.03),
                              Expanded(
                                child: Text(
                                  // 'Only you and {name} can see these entries'.trParams({'name':name}),
                                  'Only you and ${widget.name} can see these entries'
                                      .tr,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: screenHeight * 0.018),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Spacer(),
                        GestureDetector(
                          onTap: () {
                            print(widget.comp);
                            // return;
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => EntryDetails(
                                          // comp: '${provider.compController.text}',
                                          comp: '${widget.comp}',
                                          date: '${widget.date}',
                                          name: '${widget.name}',
                                          billId: '${widget.billId}',
                                          Id: '${widget.Id}',
                                        )));
                          },
                          child: Container(
                            padding: EdgeInsets.all(screenHeight * 0.015),
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('${widget.date}'.tr,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                Text('${widget.comp}'.tr),
                              ],
                            ),
                          ),
                        ),
                        Spacer(),
                        Text(
                          // 'Start adding transactions with {name}'.trParams({'name':name}),
                          'Start adding transactions with ${widget.name}'.tr,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: screenHeight * 0.022),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.05),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildTransactionButton(
                        context,
                        'YOU GAVE'.tr,
                        Icons.currency_rupee,
                        Colors.red,
                        () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Calculatorgave(
                                comp: '${provider.compController.text}',
                                Id: widget.Id,
                                billId: 'billId',
                                name: '${widget.name}',
                              ),
                            ),
                          );
                        },
                        screenHeight,
                        screenWidth,
                      ),
                      _buildTransactionButton(
                        context,
                        'YOU GOT'.tr,
                        Icons.currency_rupee,
                        Color(0xFF1CC1AB),
                        () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Calculatorgot(
                                        comp: '${provider.compController.text}',
                                        billId: 'billId',
                                        Id: widget.Id,
                                        name: '${widget.name}',
                                      )));
                        },
                        screenHeight,
                        screenWidth,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
      },
    );
  }

  Widget _buildActionIcon(IconData icon, String label, double screenHeight) {
    return Column(
      children: [
        Icon(icon, size: screenHeight * 0.04),
        SizedBox(height: screenHeight * 0.01),
        Text(label, style: TextStyle(fontSize: screenHeight * 0.02)),
      ],
    );
  }

  Widget _buildTransactionButton(
    BuildContext context,
    String text,
    IconData icon,
    Color color,
    VoidCallback onTap,
    double screenHeight,
    double screenWidth,
  ) {
    return Container(
      height: screenHeight * 0.06,
      width: screenWidth * 0.4,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: color,
      ),
      child: InkWell(
        onTap: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(text,
                style: TextStyle(
                    color: Color(0xFFFFFFFF), fontSize: screenHeight * 0.02)),
            Icon(icon, color: Color(0xFFFFFFFF)),
          ],
        ),
      ),
    );
  }

//   void _sendSMS()async{
// List<String> recepients = ['+9822521916'];
//
// await sendSMS(message:"Hiiii", recepients: recepients);
//
//
//   }



  sendsms(){
    String sms1 ="sms:123456";
    launch(sms1);


  }
}


// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: CallScreen(),
//     );
//   }
// }
//
// class CallScreen extends StatelessWidget {
//   final String phoneNumber = '7620752561'; // Replace with the desired phone number
//
//   void _makePhoneCall(String phoneNumber) async {
//     final String url = 'tel:$phoneNumber';
//     if (await canLaunch(url)) {
//       await launch(url);
//     } else {
//       throw 'Could not launch $url';
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Call Someone'),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () {
//             FlutterPhoneDirectCaller.callNumber('7620752561');
//           },
//           child: Text('Call Now'),
//         ),
//       ),
//     );
//   }
// }