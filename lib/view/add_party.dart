// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:get/get.dart';
// import 'package:provider/provider.dart';
// import 'package:random_string/random_string.dart';
// import 'package:sgibooks/services/database.dart';
// import 'package:sgibooks/view/customer_history.dart';
//
// import '../provider/cal_provider.dart';
// class AddPartyScreen extends StatefulWidget {
//   const AddPartyScreen({super.key});
//
//   @override
//   State<AddPartyScreen> createState() => _AddPartyScreenState();
// }
//
// class _AddPartyScreenState extends State<AddPartyScreen> {
//   final _formKey = GlobalKey<FormState>();
//
//   String? _selectedOption = 'Customer';
//   bool ischecked = false;
//   bool showAdditionalFields = false;
//
//
//
//   TextEditingController namecontroller = TextEditingController();
//   TextEditingController mobilecontroller = TextEditingController();
//   TextEditingController gstincontroller = TextEditingController();
//   TextEditingController flatcontroller = TextEditingController();
//   TextEditingController areacontroller = TextEditingController();
//   TextEditingController pincontroller = TextEditingController();
//   TextEditingController citycontroller = TextEditingController();
//   TextEditingController statecontroller = TextEditingController();
//
//   @override
//   void initState() {
//     super.initState();
//     namecontroller.clear();
//     mobilecontroller.clear();
//     gstincontroller.clear();
//     flatcontroller.clear();
//     areacontroller.clear();
//     pincontroller.clear();
//     citycontroller.clear();
//     statecontroller.clear();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final screenHeight = MediaQuery.of(context).size.height;
//     final screenWidth = MediaQuery.of(context).size.width;
//     return Consumer<CalculatorProvider>(builder: (context, provider, _)
//     {
//       return Scaffold(
//         appBar: AppBar(
//           backgroundColor: Color(0xFF1CC1AB),
//           title: Row(
//             children: [
//               Text(
//                 'Add Party'.tr,
//                 style: TextStyle(color: Colors.white),
//               ),
//             ],
//           ),
//         ),
//         body: Form(
//           key: _formKey,
//           child: Padding(
//             padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
//             child: Column(
//               children: [
//                 SizedBox(height: 20),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                   child: TextFormField(
//                     controller: namecontroller,
//                     decoration: InputDecoration(
//                       hintText: 'Name'.tr,
//                       hintStyle: TextStyle(
//                         color: Color(0xFF666666),
//                       ),
//                       contentPadding:
//                       EdgeInsets.symmetric(vertical: 8.0, horizontal: 14.0),
//                       enabledBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(6.0),
//                         borderSide: BorderSide(
//                           color: Colors.grey.shade400,
//                           width: 1.0,
//                         ),
//                       ),
//                       focusedBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(6.0),
//                         borderSide: const BorderSide(
//                             color: Color(0xffFA6650), width: 1.0),
//                       ),
//                     ),
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter name'.tr;
//                       }
//                       return null;
//                     },
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.only(left: 6, right: 8, top: 10),
//                   child: Row(
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Container(
//                             width: 60,
//                             height: 50, // Set desired width here
//                             child: TextFormField(
//                               controller: mobilecontroller,
//                               decoration: InputDecoration(
//                                 hintStyle: TextStyle(
//                                   color: Color(0xFF666666),
//                                 ),
//                                 contentPadding: EdgeInsets.symmetric(
//                                     vertical: 6.0, horizontal: 8.0),
//                                 // Adjust padding for height
//                                 prefixIcon: Padding(
//                                   padding: EdgeInsets.all(8.0),
//                                   child: Row(
//                                     children: [
//                                       Image.asset(
//                                         'assets/flag.png',
//                                         height: 14,
//                                         width: 14,
//                                       ),
//                                       SizedBox(
//                                         width: 1,
//                                       ),
//                                       Text('+91'.tr,
//                                           style: TextStyle(
//                                               color: Color(0xFF666666))),
//                                     ],
//                                   ),
//                                 ),
//                                 enabledBorder: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(6.0),
//                                   borderSide: BorderSide(
//                                     color: Colors.grey.shade400,
//                                     width: 1.0,
//                                   ),
//                                 ),
//                                 focusedBorder: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(6.0),
//                                   borderSide: const BorderSide(
//                                     color: Color(0xffFA6650),
//                                     width: 1.0,
//                                   ),
//                                 ),
//                               ),
//                               validator: (value) {
//                                 if (value == null || value.isEmpty) {
//                                   return 'Please enter number'.tr;
//                                 }
//                                 return null;
//                               },
//                             ),
//                           ),
//                         ],
//                       ),
//                       SizedBox(
//                         width: 10,
//                       ),
//                       Container(
//                         width: 260,
//                         height: 50, // Set desired width here
//                         child: TextFormField(
//                           controller: mobilecontroller,
//                           decoration: InputDecoration(
//                             hintText: 'Mobile Number'.tr,
//                             hintStyle: TextStyle(
//                               color: Color(0xFF666666),
//                             ),
//                             contentPadding: EdgeInsets.symmetric(
//                                 vertical: 8.0, horizontal: 14.0),
//                             enabledBorder: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(6.0),
//                               borderSide: BorderSide(
//                                 color: Colors.grey.shade400,
//                                 width: 1.0,
//                               ),
//                             ),
//                             focusedBorder: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(6.0),
//                               borderSide: const BorderSide(
//                                   color: Color(0xffFA6650), width: 1.0),
//                             ),
//                           ),
//                           validator: (value) {
//                             if (value == null || value.isEmpty) {
//                               return 'Please enter Mobile Number text'.tr;
//                             }
//                             else if (!RegExp(r'^\d{10}$').hasMatch(value)) {
//                               return 'Please enter a valid 10 - digit number'.tr;
//                             }
//                             return null;
//                           },
//                           keyboardType: TextInputType.number,
//                           maxLines: 10,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Row(
//                   children: [
//                     Text(
//                       'Who are they?'.tr,
//                       style: TextStyle(color: Color(0xFF666666), fontSize: 16),
//                     ),
//                     Radio<String>(
//                       value: 'Customer'.tr,
//                       groupValue: _selectedOption,
//                       onChanged: (value) {
//                         setState(() {
//                           _selectedOption = value;
//                         });
//                       },
//                     ),
//                     Text("Customer".tr),
//                     Radio<String>(
//                       value: 'Supplier'.tr,
//                       groupValue: _selectedOption,
//                       onChanged: (value) {
//                         setState(() {
//                           _selectedOption = value;
//                         });
//                       },
//                     ),
//                     Text("Supplier".tr),
//                   ],
//                 ),
//                 GestureDetector(
//                   onTap: () {
//                     setState(() {
//                       showAdditionalFields = !showAdditionalFields;
//                     });
//                   },
//                   child: Row(
//                     children: [
//                       Icon(
//                         showAdditionalFields ? Icons.remove : Icons.add,
//                         color: Color(0xFF1CC1AB),
//                       ),
//                       Text(
//                         'ADD GSTIN & ADDRESS(OPTIONAL)'.tr,
//                         style: TextStyle(
//                             fontSize: 14, color: Color(0xFF1CC1AB)),
//                       )
//                     ],
//                   ),
//                 ),
//                 if (showAdditionalFields)
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Column(
//                       children: [
//                         TextFormField(
//                           decoration: InputDecoration(
//                             hintText: 'GSTIN'.tr,
//                             hintStyle: TextStyle(
//                               color: Color(0xFF666666),
//                             ),
//                             contentPadding: EdgeInsets.symmetric(
//                                 vertical: 8.0, horizontal: 14.0),
//                             enabledBorder: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(6.0),
//                               borderSide: BorderSide(
//                                 color: Colors.grey.shade400,
//                                 width: 1.0,
//                               ),
//                             ),
//                             focusedBorder: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(6.0),
//                               borderSide: const BorderSide(
//                                   color: Color(0xffFA6650), width: 1.0),
//                             ),
//                           ),
//                           validator: (value) {
//                             if (value == null || value.isEmpty) {
//                               return 'Please enter GSTIN'.tr;
//                             }
//                             return null;
//                           },
//                         ),
//                         SizedBox(
//                           height: 10,
//                         ),
//                         TextFormField(
//                           controller: flatcontroller,
//                           decoration: InputDecoration(
//                             hintText: 'Flat / Building Number'.tr,
//                             hintStyle: TextStyle(
//                               color: Color(0xFF666666),
//                             ),
//                             contentPadding: EdgeInsets.symmetric(
//                                 vertical: 8.0, horizontal: 14.0),
//                             enabledBorder: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(6.0),
//                               borderSide: BorderSide(
//                                 color: Colors.grey.shade400,
//                                 width: 1.0,
//                               ),
//                             ),
//                             focusedBorder: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(6.0),
//                               borderSide: const BorderSide(
//                                   color: Color(0xffFA6650), width: 1.0),
//                             ),
//                           ),
//                           validator: (value) {
//                             if (value == null || value.isEmpty) {
//                               return 'Please enter Flat / Building Number'.tr;
//                             }
//                             return null;
//                           },
//                         ),
//                         SizedBox(
//                           height: 10,
//                         ),
//                         TextFormField(
//                           controller: areacontroller,
//                           decoration: InputDecoration(
//                             hintText: 'Area / Locality'.tr,
//                             hintStyle: TextStyle(
//                               color: Color(0xFF666666),
//                             ),
//                             contentPadding: EdgeInsets.symmetric(
//                                 vertical: 8.0, horizontal: 14.0),
//                             enabledBorder: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(6.0),
//                               borderSide: BorderSide(
//                                 color: Colors.grey.shade400,
//                                 width: 1.0,
//                               ),
//                             ),
//                             focusedBorder: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(6.0),
//                               borderSide: const BorderSide(
//                                   color: Color(0xffFA6650), width: 1.0),
//                             ),
//                           ),
//                           validator: (value) {
//                             if (value == null || value.isEmpty) {
//                               return 'Please enter Area / Locality'.tr;
//                             }
//                             return null;
//                           },
//                         ),
//                         SizedBox(
//                           height: 10,
//                         ),
//                         TextFormField(
//                           controller: pincontroller,
//                           decoration: InputDecoration(
//                             hintText: 'Pincode'.tr,
//                             hintStyle: TextStyle(
//                               color: Color(0xFF666666),
//                             ),
//                             contentPadding: EdgeInsets.symmetric(
//                                 vertical: 8.0, horizontal: 14.0),
//                             enabledBorder: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(4.0),
//                               borderSide: BorderSide(
//                                 color: Colors.grey.shade400,
//                                 width: 1.0,
//                               ),
//                             ),
//                             focusedBorder: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(15.0),
//                               borderSide: const BorderSide(
//                                   color: Color(0xffFA6650), width: 1.0),
//                             ),
//                           ),
//                           validator: (value) {
//                             if (value == null || value.isEmpty) {
//                               return 'Please enter Pincode'.tr;
//                             }
//                             return null;
//                           },
//                         ),
//                         SizedBox(
//                           height: 10,
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Container(
//                               width: 150,
//                               height: 50, // Set desired width here
//                               child: TextFormField(
//                                 controller: citycontroller,
//                                 decoration: InputDecoration(
//                                   hintText: 'City'.tr,
//                                   hintStyle: TextStyle(
//                                     color: Color(0xFF666666),
//                                   ),
//                                   contentPadding: EdgeInsets.symmetric(
//                                       vertical: 8.0, horizontal: 12.0),
//                                   // Adjust padding for height
//                                   enabledBorder: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(6.0),
//                                     borderSide: BorderSide(
//                                       color: Colors.grey.shade400,
//                                       width: 1.0,
//                                     ),
//                                   ),
//                                   focusedBorder: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(6.0),
//                                     borderSide: const BorderSide(
//                                       color: Color(0xffFA6650),
//                                       width: 1.0,
//                                     ),
//                                   ),
//                                 ),
//                                 validator: (value) {
//                                   if (value == null || value.isEmpty) {
//                                     return 'Please enter City'.tr;
//                                   }
//                                   return null;
//                                 },
//                               ),
//                             ),
//                             Spacer(),
//                             Container(
//                               width: 150,
//                               height: 50, // Set desired width here
//                               child: TextFormField(
//                                 controller: statecontroller,
//                                 decoration: InputDecoration(
//                                   hintText: 'State'.tr,
//                                   hintStyle: TextStyle(
//                                     color: Color(0xFF666666),
//                                   ),
//                                   contentPadding: EdgeInsets.symmetric(
//                                       vertical: 8.0, horizontal: 12.0),
//                                   // Adjust padding for height
//                                   enabledBorder: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(6.0),
//                                     borderSide: BorderSide(
//                                       color: Colors.grey.shade400,
//                                       width: 1.0,
//                                     ),
//                                   ),
//                                   focusedBorder: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(6.0),
//                                     borderSide: const BorderSide(
//                                       color: Color(0xffFA6650),
//                                       width: 1.0,
//                                     ),
//                                   ),
//                                 ),
//                                 validator: (value) {
//                                   if (value == null || value.isEmpty) {
//                                     return 'Please enter State'.tr;
//                                   }
//                                   return null;
//                                 },
//                               ),
//                             )
//                           ],
//                         ),
//                         SizedBox(
//                           height: 5,
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           children: [
//                             Checkbox(
//                                 value: ischecked,
//                                 onChanged: (bool? newValue) {
//                                   setState(() {
//                                     ischecked = newValue!;
//                                   });
//                                 }),
//                             Text(
//                               'Shipping address same as billing address?'.tr,
//                               style: TextStyle(fontSize: 14),
//                             ),
//                           ],
//                         )
//                       ],
//                     ),
//                   ),
// SizedBox(height: 5,),
//                 Padding(
//                   padding: EdgeInsets.only(
//                       bottom: 4.0, left: 8.0, right: 8.0, top: 4.0),
//                   child: Container(
//                     height: screenHeight * 0.06, // Responsive height
//                     width: screenWidth * 1, // 80% of screen width
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(6),
//                         border: Border.all(
//                           width: 0.2,
//                           color: Colors.grey,
//                         ),
//                         color: Color(0xFF1CC1AB)),
//                     child: Center(
//                       child: InkWell(
//                         onTap: () async {
//                           if (_formKey.currentState!.validate()) {
//                             String Id = randomAlphaNumeric(10);
//                             Map<String, dynamic> billInfoMap = {
//                               "name": namecontroller.text,
//                               "mobile": mobilecontroller.text,
//                               "flat": flatcontroller.text,
//                               "area": areacontroller.text,
//                               "pin": pincontroller.text,
//                               "city": citycontroller.text,
//                               "state": statecontroller.text,
//
//                             };
//                             await DatabaseMethods()
//                                 .addPartyDetails(billInfoMap, Id)
//                                 .then((value) {
//                               print('iddddddddddddddddddddddd $Id');
//                               Fluttertoast.showToast(
//                                   msg:
//                                   "Bill Details has been uploaded successfully",
//                                   toastLength: Toast.LENGTH_SHORT,
//                                   gravity: ToastGravity.CENTER,
//                                   timeInSecForIosWeb: 1,
//                                   backgroundColor: Colors.red,
//                                   textColor: Colors.white,
//                                   fontSize: 16.0);
//                             });
//                             print(
//                                 '*********kkkkkkkklllllllllll');
//                             print(namecontroller.text );
//
//                             Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (context) =>
//                                         CustomerHistory(
//                                           comp: provider.compController.text,
//                                           date :provider.selectedDate.toString(),
//                                           Id: Id,
//                                           billId: 'billId',
//                                           name: namecontroller.text,
//                                           flat: flatcontroller.text,
//                                         )));
//
//                           }
//                         },
//                         child: Text(
//                           'ADD CUSTOMER'.tr,
//                           style: TextStyle(color: Colors.white, fontSize: 16),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       );
//     });
//   }
// }
//
// VIMP
import 'package:billing/services/database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:random_string/random_string.dart';


import '../provider/cal_provider.dart';
import 'customer_history.dart';
class AddPartyScreen extends StatefulWidget {

   AddPartyScreen({super.key});

  @override
  State<AddPartyScreen> createState() => _AddPartyScreenState();
}

class _AddPartyScreenState extends State<AddPartyScreen> {
  final _formKey = GlobalKey<FormState>();

  String? _selectedOption = 'Customer';
  bool ischecked = false;
  bool showAdditionalFields = false;



  TextEditingController namecontroller = TextEditingController();
  TextEditingController mobilecontroller = TextEditingController();
  TextEditingController gstincontroller = TextEditingController();
  TextEditingController flatcontroller = TextEditingController();
  TextEditingController areacontroller = TextEditingController();
  TextEditingController pincontroller = TextEditingController();
  TextEditingController citycontroller = TextEditingController();
  TextEditingController statecontroller = TextEditingController();

  @override
  void initState() {
    super.initState();
    namecontroller.clear();
    mobilecontroller.clear();
    gstincontroller.clear();
    flatcontroller.clear();
    areacontroller.clear();
    pincontroller.clear();
    citycontroller.clear();
    statecontroller.clear();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Consumer<CalculatorProvider>(builder: (context, provider, _)
    {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF1CC1AB),
          title: Row(
            children: [
              Text(
                'Add Party'.tr,
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
        body: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
            child: Column(
              children: [
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: TextFormField(
                    controller: namecontroller,
                    decoration: InputDecoration(
                      hintText: 'Name'.tr,
                      hintStyle: TextStyle(
                        color: Color(0xFF666666),
                      ),
                      contentPadding:
                      EdgeInsets.symmetric(vertical: 8.0, horizontal: 14.0),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6.0),
                        borderSide: BorderSide(
                          color: Colors.grey.shade400,
                          width: 1.0,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6.0),
                        borderSide: const BorderSide(
                            color: Color(0xffFA6650), width: 1.0),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter name'.tr;
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 6, right: 8, top: 10),
                  child: Row(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 60,
                            height: 50, // Set desired width here
                            child: TextFormField(
                              controller: mobilecontroller,
                              decoration: InputDecoration(
                                hintStyle: TextStyle(
                                  color: Color(0xFF666666),
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 6.0, horizontal: 8.0),
                                // Adjust padding for height
                                prefixIcon: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        'assets/flag.png',
                                        height: 14,
                                        width: 14,
                                      ),
                                      SizedBox(
                                        width: 1,
                                      ),
                                      Text('+91'.tr,
                                          style: TextStyle(
                                              color: Color(0xFF666666))),
                                    ],
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(6.0),
                                  borderSide: BorderSide(
                                    color: Colors.grey.shade400,
                                    width: 1.0,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(6.0),
                                  borderSide: const BorderSide(
                                    color: Color(0xffFA6650),
                                    width: 1.0,
                                  ),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter number'.tr;
                                }
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: 260,
                        height: 50, // Set desired width here
                        child: TextFormField(
                          controller: mobilecontroller,
                          decoration: InputDecoration(
                            hintText: 'Mobile Number'.tr,
                            hintStyle: TextStyle(
                              color: Color(0xFF666666),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 14.0),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6.0),
                              borderSide: BorderSide(
                                color: Colors.grey.shade400,
                                width: 1.0,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6.0),
                              borderSide: const BorderSide(
                                  color: Color(0xffFA6650), width: 1.0),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter Mobile Number text'.tr;
                            }
                            else if (!RegExp(r'^\d{10}$').hasMatch(value)) {
                              return 'Please enter a valid 10 - digit number'.tr;
                            }
                            return null;
                          },
                          keyboardType: TextInputType.number,
                          maxLines: 10,
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Text(
                      'Who are they?'.tr,
                      style: TextStyle(color: Color(0xFF666666), fontSize: 16),
                    ),
                    Radio<String>(
                      value: 'Customer'.tr,
                      groupValue: _selectedOption,
                      onChanged: (value) {
                        setState(() {
                          _selectedOption = value;
                        });
                      },
                    ),
                    Text("Customer".tr),
                    Radio<String>(
                      value: 'Supplier'.tr,
                      groupValue: _selectedOption,
                      onChanged: (value) {
                        setState(() {
                          _selectedOption = value;
                        });
                      },
                    ),
                    Text("Supplier".tr),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      showAdditionalFields = !showAdditionalFields;
                    });
                  },
                  child: Row(
                    children: [
                      Icon(
                        showAdditionalFields ? Icons.remove : Icons.add,
                        color: Color(0xFF1CC1AB),
                      ),
                      Text(
                        'ADD GSTIN & ADDRESS(OPTIONAL)'.tr,
                        style: TextStyle(
                            fontSize: 14, color: Color(0xFF1CC1AB)),
                      )
                    ],
                  ),
                ),
                if (showAdditionalFields)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: 'GSTIN'.tr,
                            hintStyle: TextStyle(
                              color: Color(0xFF666666),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 14.0),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6.0),
                              borderSide: BorderSide(
                                color: Colors.grey.shade400,
                                width: 1.0,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6.0),
                              borderSide: const BorderSide(
                                  color: Color(0xffFA6650), width: 1.0),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter GSTIN'.tr;
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: flatcontroller,
                          decoration: InputDecoration(
                            hintText: 'Flat / Building Number'.tr,
                            hintStyle: TextStyle(
                              color: Color(0xFF666666),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 14.0),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6.0),
                              borderSide: BorderSide(
                                color: Colors.grey.shade400,
                                width: 1.0,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6.0),
                              borderSide: const BorderSide(
                                  color: Color(0xffFA6650), width: 1.0),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter Flat / Building Number'.tr;
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: areacontroller,
                          decoration: InputDecoration(
                            hintText: 'Area / Locality'.tr,
                            hintStyle: TextStyle(
                              color: Color(0xFF666666),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 14.0),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6.0),
                              borderSide: BorderSide(
                                color: Colors.grey.shade400,
                                width: 1.0,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6.0),
                              borderSide: const BorderSide(
                                  color: Color(0xffFA6650), width: 1.0),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter Area / Locality'.tr;
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: pincontroller,
                          decoration: InputDecoration(
                            hintText: 'Pincode'.tr,
                            hintStyle: TextStyle(
                              color: Color(0xFF666666),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 14.0),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4.0),
                              borderSide: BorderSide(
                                color: Colors.grey.shade400,
                                width: 1.0,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              borderSide: const BorderSide(
                                  color: Color(0xffFA6650), width: 1.0),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter Pincode'.tr;
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 150,
                              height: 50, // Set desired width here
                              child: TextFormField(
                                controller: citycontroller,
                                decoration: InputDecoration(
                                  hintText: 'City'.tr,
                                  hintStyle: TextStyle(
                                    color: Color(0xFF666666),
                                  ),
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 8.0, horizontal: 12.0),
                                  // Adjust padding for height
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(6.0),
                                    borderSide: BorderSide(
                                      color: Colors.grey.shade400,
                                      width: 1.0,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(6.0),
                                    borderSide: const BorderSide(
                                      color: Color(0xffFA6650),
                                      width: 1.0,
                                    ),
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter City'.tr;
                                  }
                                  return null;
                                },
                              ),
                            ),
                            Spacer(),
                            Container(
                              width: 150,
                              height: 50, // Set desired width here
                              child: TextFormField(
                                controller: statecontroller,
                                decoration: InputDecoration(
                                  hintText: 'State'.tr,
                                  hintStyle: TextStyle(
                                    color: Color(0xFF666666),
                                  ),
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 8.0, horizontal: 12.0),
                                  // Adjust padding for height
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(6.0),
                                    borderSide: BorderSide(
                                      color: Colors.grey.shade400,
                                      width: 1.0,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(6.0),
                                    borderSide: const BorderSide(
                                      color: Color(0xffFA6650),
                                      width: 1.0,
                                    ),
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter State'.tr;
                                  }
                                  return null;
                                },
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Checkbox(
                                value: ischecked,
                                onChanged: (bool? newValue) {
                                  setState(() {
                                    ischecked = newValue!;
                                  });
                                }),
                            Text(
                              'Shipping address same as billing address?'.tr,
                              style: TextStyle(fontSize: 14),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                SizedBox(height: 5,),
                Padding(
                  padding: EdgeInsets.only(
                      bottom: 4.0, left: 8.0, right: 8.0, top: 4.0),
                  child: Container(
                    height: screenHeight * 0.06, // Responsive height
                    width: screenWidth * 1, // 80% of screen width
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(
                          width: 0.2,
                          color: Colors.grey,
                        ),
                        color: Color(0xFF1CC1AB)),
                    child: Center(
                      child: InkWell(
                        onTap: () async {
                          if (_formKey.currentState!.validate()) {
                            String Id = randomAlphaNumeric(10);
                            Map<String, dynamic> billInfoMap = {
                              "name": namecontroller.text,
                              "mobile": mobilecontroller.text,
                              "flat": flatcontroller.text,
                              "area": areacontroller.text,
                              "pin": pincontroller.text,
                              "city": citycontroller.text,
                              "state": statecontroller.text,

                            };
                            await DatabaseMethods()
                                .addPartyDetails(billInfoMap, Id)
                                .then((value) {
                              print('iddddddddddddddddddddddd $Id');
                              Fluttertoast.showToast(
                                  msg:
                                  "Bill Details has been uploaded successfully",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                            });
                            print(
                                '*********kkkkkkkklllllllllll');
                            print(namecontroller.text );

                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        CustomerHistory(
                                          comp: provider.compController.text,
                                          date :provider.selectedDate.toString(),
                                          Id: Id,
                                          billId: 'billId',
                                          name: namecontroller.text,
                                          mobile: mobilecontroller.text,
                                          flat: flatcontroller.text,
                                        )));

                          }
                        },
                        child: Text(
                          'ADD CUSTOMER'.tr,
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}


