// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:get/get.dart';
// import 'package:provider/provider.dart';
// import 'package:sgibooks/calculator/transaction_saved.dart';
// import 'package:sgibooks/provider/cal_provider.dart';
// import 'package:sgibooks/services/database.dart';
//
// class Calculatorgave extends StatefulWidget {
//   final String? comp;
//   final String? Id;
//   final String? billId;
//   final String? name;
//
//   Calculatorgave({super.key, this.comp, this.Id, this.billId, this.name});
//
//   @override
//   State<Calculatorgave> createState() => _CalculatorgaveState();
// }
//
// class _CalculatorgaveState extends State<Calculatorgave> {
//   final _formKey = GlobalKey<FormState>();
//   DateTime? selectedDate;
//
//   @override
//   void initState() {
//     super.initState();
//     print(widget.Id);
//
//     // Access the provider instance and clear the controller
//     final provider = Provider.of<CalculatorProvider>(context, listen: false);
//     provider.compController.clear();
//
//     print('-------------------');
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final ScreenHeight = MediaQuery.of(context).size.height;
//     final ScreenWidth = MediaQuery.of(context).size.width;
//     final decoration = const BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.vertical(top: Radius.circular(30)));
//
//     return Consumer<CalculatorProvider>(builder: (context, provider, _) {
//       return Scaffold(
//         backgroundColor: Color(0xFFFFFFFF),
//         appBar: AppBar(
//           backgroundColor: Color(0xFFFFFFFF),
//           title: Text('You gave ₹${provider.compController.text} to ${widget.name}'.tr, style: TextStyle(color: Colors.red)),
//         ),
//         body: Form(
//           key: _formKey,
//           child: Column(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
//                 child: TextField(
//                   controller: provider.compController,
//                   decoration: InputDecoration(
//                     hintText: '₹ Enter amount'.tr,
//                     fillColor: Colors.grey[200],
//                     filled: true,
//                     border: InputBorder.none,
//                     contentPadding: EdgeInsets.zero,
//                   ),
//                   style: const TextStyle(fontSize: 25, color: Colors.red),
//                   readOnly: true,
//                   autofocus: true,
//                   showCursor: true,
//                 ),
//               ),
//
//               Container(
//                 height: ScreenHeight * 0.07,
//                 width: ScreenWidth * 0.9,
//                 color: Colors.grey[200],
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Row(
//                       children: [
//                         Icon(Icons.calendar_month),
//                         SizedBox(width: 8),
//                         Text(
//                           selectedDate != null
//                               ? "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}"
//                               : 'Select Date'.tr,
//                           style: TextStyle(fontSize: 16),
//                         ),
//                       ],
//                     ),
//                     IconButton(
//                       icon: Icon(Icons.arrow_drop_down),
//                       onPressed: () async {
//                         DateTime? pickedDate = await showDatePicker(
//                           context: context,
//                           initialDate: selectedDate ?? DateTime.now(),
//                           firstDate: DateTime(2000),
//                           lastDate: DateTime(2101),
//                         );
//
//                         if (pickedDate != null && pickedDate != selectedDate) {
//                           setState(() {
//                             selectedDate = pickedDate;
//                           });
//                         }
//                       },
//                     ),
//                   ],
//                 ),
//               ),
//
//               const Spacer(),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
//                 child: InkWell(
//                   onTap: () async {
//                     debugPrint('save pressed ******************');
//                     debugPrint(widget.Id);
//                     if (_formKey.currentState!.validate()) {
//                       Map<String, dynamic> billInfoMap = {
//                         "comp": provider.compController.text,
//                         "date": selectedDate != null ? "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}" : null,
//                       };
//
//                       if (widget.Id != null) {
//                         await DatabaseMethods().saveupdategavePartyDetails(widget.Id!, billInfoMap).then((value) {
//                           Fluttertoast.showToast(
//                             msg: "Bill Details has been uploaded successfully",
//                             toastLength: Toast.LENGTH_SHORT,
//                             gravity: ToastGravity.CENTER,
//                             timeInSecForIosWeb: 1,
//                             backgroundColor: Colors.red,
//                             textColor: Colors.white,
//                             fontSize: 16.0,
//                           );
//                         });
//                         Navigator.push(context, MaterialPageRoute(builder: (context) => TransactionSaved(
//                             comp: '${provider.compController.text}',
//                             name: '${widget.name}',
//                             Id: '${widget.Id}',
//                             billId: '${widget.billId}',
//                         )
//                         ));
//                       } else {
//                         Fluttertoast.showToast(
//                           msg: "Error: Id is null",
//                           toastLength: Toast.LENGTH_SHORT,
//                           gravity: ToastGravity.CENTER,
//                           timeInSecForIosWeb: 1,
//                           backgroundColor: Colors.red,
//                           textColor: Colors.white,
//                           fontSize: 16.0,
//                         );
//                       }
//                     }
//
//                   },
//
//
//
//
//                   child: Container(
//                     height: ScreenHeight * 0.06,
//                     width: ScreenWidth * 1,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(6),
//                       border: Border.all(
//                         width: 0.4,
//                         color: Colors.red,
//                       ),
//                       color: Colors.red,
//                     ),
//                     child: Padding(
//                       padding: EdgeInsets.only(left: 10.0, top: 10.0, bottom: 10, right: 10),
//                       child: Text(
//                         maxLines: 1,
//                         'SAVE'.tr,
//                         style: TextStyle(color: Colors.white, fontSize: 16),
//                         textAlign: TextAlign.center,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//
//               Padding(
//                 padding: const EdgeInsets.all(4.0),
//                 child: Container(
//                   height: ScreenHeight * 0.4,
//                   width: double.infinity,
//                   decoration: decoration,
//                   child: GridView.builder(
//                     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                       crossAxisCount: 4,
//                       childAspectRatio: 2,
//                       crossAxisSpacing: 20,
//                       mainAxisSpacing: 20,
//                     ),
//                     itemCount: 20,
//                     itemBuilder: (context, index) {
//                       String buttonText;
//                       Function() onTap;
//                       int flexFactor = 2;
//
//                       switch (index) {
//                         case 0:
//                           buttonText = 'C';
//                           onTap = () => Provider.of<CalculatorProvider>(context, listen: false).setValue('C');
//                           break;
//                         case 1:
//                           buttonText = '/';
//                           onTap = () => Provider.of<CalculatorProvider>(context, listen: false).setValue('/');
//                           break;
//                         case 2:
//                           buttonText = '*';
//                           onTap = () => Provider.of<CalculatorProvider>(context, listen: false).setValue('*');
//                           break;
//                         case 3:
//                           buttonText = 'AC';
//                           onTap = () => Provider.of<CalculatorProvider>(context, listen: false).setValue('AC');
//                           break;
//                         case 4:
//                           buttonText = '7';
//                           onTap = () => Provider.of<CalculatorProvider>(context, listen: false).setValue('7');
//                           break;
//                         case 5:
//                           buttonText = '8';
//                           onTap = () => Provider.of<CalculatorProvider>(context, listen: false).setValue('8');
//                           break;
//                         case 6:
//                           buttonText = '9';
//                           onTap = () => Provider.of<CalculatorProvider>(context, listen: false).setValue('9');
//                           break;
//                         case 7:
//                           buttonText = '-';
//                           onTap = () => Provider.of<CalculatorProvider>(context, listen: false).setValue('-');
//                           break;
//                         case 8:
//                           buttonText = '4';
//                           onTap = () => Provider.of<CalculatorProvider>(context, listen: false).setValue('4');
//                           break;
//                         case 9:
//                           buttonText = '5';
//                           onTap = () => Provider.of<CalculatorProvider>(context, listen: false).setValue('5');
//                           break;
//                         case 10:
//                           buttonText = '6';
//                           onTap = () => Provider.of<CalculatorProvider>(context, listen: false).setValue('6');
//                           break;
//                         case 11:
//                           buttonText = '+';
//                           onTap = () => Provider.of<CalculatorProvider>(context, listen: false).setValue('+');
//                           break;
//                         case 12:
//                           buttonText = '1';
//                           onTap = () => Provider.of<CalculatorProvider>(context, listen: false).setValue('1');
//                           break;
//                         case 13:
//                           buttonText = '2';
//                           onTap = () => Provider.of<CalculatorProvider>(context, listen: false).setValue('2');
//                           break;
//                         case 14:
//                           buttonText = '3';
//                           onTap = () => Provider.of<CalculatorProvider>(context, listen: false).setValue('3');
//                           break;
//                         case 15:
//                           buttonText = '%';
//                           onTap = () => Provider.of<CalculatorProvider>(context, listen: false).setValue('%');
//                           break;
//                         case 16:
//                           buttonText = '0';
//                           onTap = () => Provider.of<CalculatorProvider>(context, listen: false).setValue('0');
//                           break;
//                         case 17:
//                           buttonText = '.';
//                           onTap = () => Provider.of<CalculatorProvider>(context, listen: false).setValue('.');
//                           break;
//                         case 18: // Large '=' button
//                           buttonText = '=';
//                           onTap = () => Provider.of<CalculatorProvider>(context, listen: false).setValue('=');
//                           flexFactor = 2;
//                           break;
//                         default:
//                           buttonText = '=';
//                           onTap = () => Provider.of<CalculatorProvider>(context, listen: false).setValue('=');
//                       }
//
//                       return InkWell(
//                         onTap: onTap,
//                         child: Material(
//                           elevation: 3,
//                           color: Colors.black,
//                           borderRadius: BorderRadius.circular(10),
//                           child: Container(
//                             height: flexFactor == 2 ? 150 : null,
//                             decoration: BoxDecoration(
//                               color: Colors.white,
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                             child: Center(
//                               child: Text(
//                                 buttonText,
//                                 style: TextStyle(
//                                   fontSize: 20,
//                                   fontWeight: FontWeight.w600,
//                                   color: buttonText == '=' ? Colors.black : Colors.black,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ),
//       );
//     });
//   }
// }
//

import 'package:billing/calculator/transaction_saved.dart';
import 'package:billing/services/database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../provider/cal_provider.dart';

class Calculatorgave extends StatefulWidget {
  final String? comp;
  final String? Id;
  final String? billId;
  final String? name;

  Calculatorgave({super.key, this.comp, this.Id, this.billId, this.name});

  @override
  State<Calculatorgave> createState() => _CalculatorgaveState();
}

class _CalculatorgaveState extends State<Calculatorgave> {
  final _formKey = GlobalKey<FormState>();
  DateTime? selectedDate;

  @override
  void initState() {
    super.initState();
    print(widget.Id);

    // Access the provider instance and clear the controller
    final provider = Provider.of<CalculatorProvider>(context, listen: false);
    provider.compController.clear();

    print('-------------------');
  }

  @override
  Widget build(BuildContext context) {
    final ScreenHeight = MediaQuery.of(context).size.height;
    final ScreenWidth = MediaQuery.of(context).size.width;
    final decoration = const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)));

    return Consumer<CalculatorProvider>(builder: (context, provider, _) {
      return Scaffold(
        backgroundColor: Color(0xFFFFFFFF),
        appBar: AppBar(
          backgroundColor: Color(0xFFFFFFFF),
          title: Text('You gave ₹${provider.compController.text} to ${widget.name}'.tr, style: TextStyle(color: Colors.red)),
        ),
        body: Form(
          key: _formKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
                child: TextField(
                  controller: provider.compController,
                  decoration: InputDecoration(
                    hintText: '₹ Enter amount'.tr,
                    fillColor: Colors.grey[200],
                    filled: true,
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.zero,
                  ),
                  style: const TextStyle(fontSize: 25, color: Colors.red),
                  readOnly: true,
                  autofocus: true,
                  showCursor: true,
                ),
              ),

              Container(
                height: ScreenHeight * 0.07,
                width: ScreenWidth * 0.9,
                color: Colors.grey[200],
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.calendar_month),
                        SizedBox(width: 8),
                        Text(
                          selectedDate != null
                              ? "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}"
                              : 'Select Date'.tr,
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    IconButton(
                      icon: Icon(Icons.arrow_drop_down),
                      onPressed: () async {
                        DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: selectedDate ?? DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2101),
                        );

                        if (pickedDate != null && pickedDate != selectedDate) {
                          setState(() {
                            selectedDate = pickedDate;
                          });
                        }
                      },
                    ),
                  ],
                ),
              ),

              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                child: InkWell(
                  onTap: () async {
                    debugPrint('save pressed ******************');
                    debugPrint(widget.Id);
                    if (_formKey.currentState!.validate()) {
                      Map<String, dynamic> billInfoMap = {
                        "comp": provider.compController.text,
                        "date": selectedDate != null ? "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}" : null,
                      };

                      if (widget.Id != null) {
                        await DatabaseMethods().saveupdategavePartyDetails(widget.Id!, billInfoMap).then((value) {
                          Fluttertoast.showToast(
                            msg: "Bill Details has been uploaded successfully",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0,
                          );
                        });
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => TransactionSaved(
                          comp: '${provider.compController.text}',
                          name: '${widget.name}',
                          Id: '${widget.Id}',
                          billId: '${widget.billId}',
                        )
                        ));
                      } else {
                        Fluttertoast.showToast(
                          msg: "Error: Id is null",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0,
                        );
                      }
                    }

                  },




                  child: Container(
                    height: ScreenHeight * 0.06,
                    width: ScreenWidth * 1,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(
                        width: 0.4,
                        color: Colors.red,
                      ),
                      color: Colors.red,
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: 10.0, top: 10.0, bottom: 10, right: 10),
                      child: Text(
                        maxLines: 1,
                        'SAVE'.tr,
                        style: TextStyle(color: Colors.white, fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Container(
                  height: ScreenHeight * 0.4,
                  width: double.infinity,
                  decoration: decoration,
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      childAspectRatio: 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                    ),
                    itemCount: 20,
                    itemBuilder: (context, index) {
                      String buttonText;
                      Function() onTap;
                      int flexFactor = 2;

                      switch (index) {
                        case 0:
                          buttonText = 'C';
                          onTap = () => Provider.of<CalculatorProvider>(context, listen: false).setValue('C');
                          break;
                        case 1:
                          buttonText = '/';
                          onTap = () => Provider.of<CalculatorProvider>(context, listen: false).setValue('/');
                          break;
                        case 2:
                          buttonText = '*';
                          onTap = () => Provider.of<CalculatorProvider>(context, listen: false).setValue('*');
                          break;
                        case 3:
                          buttonText = 'AC';
                          onTap = () => Provider.of<CalculatorProvider>(context, listen: false).setValue('AC');
                          break;
                        case 4:
                          buttonText = '7';
                          onTap = () => Provider.of<CalculatorProvider>(context, listen: false).setValue('7');
                          break;
                        case 5:
                          buttonText = '8';
                          onTap = () => Provider.of<CalculatorProvider>(context, listen: false).setValue('8');
                          break;
                        case 6:
                          buttonText = '9';
                          onTap = () => Provider.of<CalculatorProvider>(context, listen: false).setValue('9');
                          break;
                        case 7:
                          buttonText = '-';
                          onTap = () => Provider.of<CalculatorProvider>(context, listen: false).setValue('-');
                          break;
                        case 8:
                          buttonText = '4';
                          onTap = () => Provider.of<CalculatorProvider>(context, listen: false).setValue('4');
                          break;
                        case 9:
                          buttonText = '5';
                          onTap = () => Provider.of<CalculatorProvider>(context, listen: false).setValue('5');
                          break;
                        case 10:
                          buttonText = '6';
                          onTap = () => Provider.of<CalculatorProvider>(context, listen: false).setValue('6');
                          break;
                        case 11:
                          buttonText = '+';
                          onTap = () => Provider.of<CalculatorProvider>(context, listen: false).setValue('+');
                          break;
                        case 12:
                          buttonText = '1';
                          onTap = () => Provider.of<CalculatorProvider>(context, listen: false).setValue('1');
                          break;
                        case 13:
                          buttonText = '2';
                          onTap = () => Provider.of<CalculatorProvider>(context, listen: false).setValue('2');
                          break;
                        case 14:
                          buttonText = '3';
                          onTap = () => Provider.of<CalculatorProvider>(context, listen: false).setValue('3');
                          break;
                        case 15:
                          buttonText = '%';
                          onTap = () => Provider.of<CalculatorProvider>(context, listen: false).setValue('%');
                          break;
                        case 16:
                          buttonText = '0';
                          onTap = () => Provider.of<CalculatorProvider>(context, listen: false).setValue('0');
                          break;
                        case 17:
                          buttonText = '.';
                          onTap = () => Provider.of<CalculatorProvider>(context, listen: false).setValue('.');
                          break;
                        case 18: // Large '=' button
                          buttonText = '=';
                          onTap = () => Provider.of<CalculatorProvider>(context, listen: false).setValue('=');
                          flexFactor = 2;
                          break;
                        default:
                          buttonText = '=';
                          onTap = () => Provider.of<CalculatorProvider>(context, listen: false).setValue('=');
                      }

                      return InkWell(
                        onTap: onTap,
                        child: Material(
                          elevation: 3,
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            height: flexFactor == 2 ? 150 : null,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                buttonText,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: buttonText == '=' ? Colors.black : Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}


