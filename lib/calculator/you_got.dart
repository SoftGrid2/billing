// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:get/get.dart';
// import 'package:provider/provider.dart';
// import 'package:sgibooks/calculator/transaction_saved.dart';
// import 'package:sgibooks/provider/cal_provider.dart';
// import 'package:sgibooks/services/database.dart';
//
// class Calculatorgot extends StatefulWidget {
//   final String? comp;
//   final String? Id;
//   final String? billId;
//   final String? name;
//
//   Calculatorgot({
//     super.key,
//     this.comp,
//     this.Id,
//     this.billId,
//     this.name,
//   });
//
//   @override
//   State<Calculatorgot> createState() => _CalculatorgotState();
// }
//
// class _CalculatorgotState extends State<Calculatorgot> {
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
//   // final ImagePicker _imagePicker = ImagePicker();
//   // String? imageUrl;
//   // bool isLoading = false;
//   // Future<void> pickImage() async {
//   //   try {
//   //     XFile? res = await _imagePicker.pickImage(source: ImageSource.gallery);
//   //
//   //     if (res != null) {
//   //       await uploadImageToFirebase(File(res.path));
//   //     }
//   //   } catch (e) {
//   //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//   //       content: Text('Failed to pick image: $e'),
//   //     ));
//   //   }
//   // }
//   //
//   // Future<void> uploadImageToFirebase(File image) async {
//   //   setState(() {
//   //     isLoading = true;
//   //   });
//   //   try {
//   //     Reference reference = FirebaseStorage.instance
//   //         .ref()
//   //         .child('images/${DateTime.now().microsecondsSinceEpoch}.png');
//   //     await reference.putFile(image).whenComplete(() {
//   //       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//   //           backgroundColor: Colors.red,
//   //           duration: Duration(seconds: 2),
//   //           content: Text('Upload Successfully')));
//   //     });
//   //     imageUrl = await reference.getDownloadURL();
//   //   } catch (e) {
//   //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//   //       backgroundColor: Colors.red,
//   //       content: Text('Failed to upload image: $e'),
//   //     ));
//   //   }
//   //   setState(() {
//   //     isLoading = false;
//   //   });
//   // }
//   //  upload image on storage
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
//           backgroundColor: Color(0xFFFFFFFF),
//           appBar: AppBar(
//             backgroundColor: Color(0xFFFFFFFF),
//             title: Text(
//               'You got ₹ ${provider.compController.text} to ${widget.name}'.tr,
//               style: const TextStyle(color: Color(0xFF1CC1AB)),
//             ),
//           ),
//           body: Form(
//               key: _formKey,
//               child: Column(children: [
//                 Padding(
//                   padding: const EdgeInsets.symmetric(
//                       horizontal: 16.0, vertical: 10.0),
//                   child: TextField(
//                     controller: provider.compController,
//                     decoration: InputDecoration(
//                       hintText: '₹ Enter amount'.tr,
//                       fillColor: Colors.grey[200],
//                       filled: true,
//                       border: InputBorder.none,
//                       contentPadding: EdgeInsets.zero,
//                     ),
//                     style:
//                     const TextStyle(fontSize: 25, color: Color(0xFF1CC1AB)),
//                     readOnly: true,
//                     autofocus: true,
//                     showCursor: true,
//                   ),
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     Container(
//                       height: ScreenHeight * 0.07,
//                       width: ScreenWidth * 0.5,
//                       color: Colors.grey[200],
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Row(
//                             children: [
//                               const Icon(Icons.calendar_month),
//                               const SizedBox(width: 8),
//                               Text(
//                                 selectedDate != null
//                                     ? "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}"
//                                     : 'Select Date'.tr,
//                                 style: const TextStyle(fontSize: 16),
//                               ),
//                             ],
//                           ),
//                           IconButton(
//                             icon: const Icon(Icons.arrow_drop_down),
//                             onPressed: () async {
//                               DateTime? pickedDate = await showDatePicker(
//                                 context: context,
//                                 initialDate: selectedDate ?? DateTime.now(),
//                                 firstDate: DateTime(2000),
//                                 lastDate: DateTime(2101),
//                               );
//
//                               if (pickedDate != null &&
//                                   pickedDate != selectedDate) {
//                                 setState(() {
//                                   selectedDate = pickedDate;
//                                 });
//                               }
//                             },
//                           ),
//                         ],
//                       ),
//                     ),
//                     Spacer(),
//                     // Stack(
//                     //   children: [
//                     //     CircleAvatar(
//                     //         radius: 25,
//                     //         backgroundColor: Colors.red,
//                     //         child: imageUrl == null
//                     //             ? Icon(Icons.person)
//                     //             : SizedBox(
//                     //           height: 120,
//                     //               child: ClipOval(
//                     //                   child: Image.network(
//                     //                   imageUrl!,
//                     //                   fit: BoxFit.cover,
//                     //                 )),
//                     //             )),
//                     //
//                     //     if(isLoading)
//                     //       Positioned(
//                     //         top: 70,
//                     //           right: 190,
//                     //           child: Center(
//                     //         child: CircularProgressIndicator(color: Colors.white,),
//                     //       )),
//                     //     Positioned(
//                     //         right: 130,
//                     //         top: 7,
//                     //         child: GestureDetector(
//                     //             onTap: () {
//                     //               pickImage();
//                     //             },
//                     //             child: Icon(
//                     //               Icons.camera_alt_outlined,
//                     //               color: Colors.white,
//                     //             )))
//                     //   ],
//                     // ),
//                   ],
//                 ),
//                 Spacer(),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(
//                       horizontal: 16.0, vertical: 16.0),
//                   child: InkWell(
//                     onTap: () async {
//                       debugPrint('save pressed ********ppppppppp trrrrrrr');
//                       print(widget.name);
//                       print(provider.compController.text);
//                       debugPrint(widget.Id);
//                       // return;
//                       if (_formKey.currentState!.validate()) {
//                         Map<String, dynamic> billInfoMap = {
//                           "comp": provider.compController.text,
//                           "date": selectedDate != null
//                               ? "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}"
//                               : null,
//                         };
//                         if (widget.Id != null) {
//                           try {
//                             debugPrint(
//                                 'Updating document with ID: ${widget.Id}');
//                             await DatabaseMethods()
//                                 .saveupdategotPartyDetails(
//                                 widget.Id!, billInfoMap)
//                                 .then((value) {
//                               Fluttertoast.showToast(
//                                 msg:
//                                 "Bill Details has been uploaded successfully",
//                                 toastLength: Toast.LENGTH_SHORT,
//                                 gravity: ToastGravity.CENTER,
//                                 timeInSecForIosWeb: 1,
//                                 backgroundColor: Colors.red,
//                                 textColor: Colors.white,
//                                 fontSize: 16.0,
//                               );
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (context) => TransactionSaved(
//                                     comp: "${provider.compController.text}",
//                                     name: '${widget.name}',
//                                     Id: '${widget.Id}',
//                                     billId: '${widget.billId}',
//                                   ),
//                                 ),
//                               );
//                             });
//                           } catch (e) {
//                             debugPrint('Error updating Firestore: $e');
//                             Fluttertoast.showToast(
//                               msg: "Error: ${e.toString()}",
//                               toastLength: Toast.LENGTH_LONG,
//                               gravity: ToastGravity.CENTER,
//                               backgroundColor: Colors.red,
//                               textColor: Colors.white,
//                               fontSize: 16.0,
//                             );
//                           }
//                         } else {
//                           Fluttertoast.showToast(
//                             msg: "Error: Id is null",
//                             toastLength: Toast.LENGTH_SHORT,
//                             gravity: ToastGravity.CENTER,
//                             backgroundColor: Colors.red,
//                             textColor: Colors.white,
//                             fontSize: 16.0,
//                           );
//                         }
//                       }
//                     },
//                     child: Container(
//                       height: ScreenHeight * 0.06,
//                       width: ScreenWidth,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(6),
//                         border: Border.all(
//                           width: 0.4,
//                           color: Color(0xFF1CC1AB),
//                         ),
//                         color: Color(0xFF1CC1AB),
//                       ),
//                       child: Padding(
//                         padding: const EdgeInsets.all(10.0),
//                         child: Text(
//                           maxLines: 1,
//                           'SAVE'.tr,
//                           style: TextStyle(color: Colors.white, fontSize: 16),
//                           textAlign: TextAlign.center,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(4.0),
//                   child: Container(
//                     height: ScreenHeight * 0.4,
//                     width: double.infinity,
//                     decoration: decoration,
//                     child: GridView.builder(
//                       gridDelegate:
//                       const SliverGridDelegateWithFixedCrossAxisCount(
//                         crossAxisCount: 4,
//                         childAspectRatio: 2,
//                         crossAxisSpacing: 20,
//                         mainAxisSpacing: 20,
//                       ),
//                       itemCount: 20,
//                       itemBuilder: (context, index) {
//                         String buttonText;
//                         Function() onTap;
//                         int flexFactor = 2;
//
//                         switch (index) {
//                           case 0:
//                             buttonText = 'C';
//                             onTap = () => provider.setValue('C');
//                             break;
//                           case 1:
//                             buttonText = '/';
//                             onTap = () => provider.setValue('/');
//                             break;
//                           case 2:
//                             buttonText = '*';
//                             onTap = () => provider.setValue('*');
//                             break;
//                           case 3:
//                             buttonText = 'AC';
//                             onTap = () => provider.setValue('AC');
//                             break;
//                           case 4:
//                             buttonText = '7';
//                             onTap = () => provider.setValue('7');
//                             break;
//                           case 5:
//                             buttonText = '8';
//                             onTap = () => provider.setValue('8');
//                             break;
//                           case 6:
//                             buttonText = '9';
//                             onTap = () => provider.setValue('9');
//                             break;
//                           case 7:
//                             buttonText = '-';
//                             onTap = () => provider.setValue('-');
//                             break;
//                           case 8:
//                             buttonText = '4';
//                             onTap = () => provider.setValue('4');
//                             break;
//                           case 9:
//                             buttonText = '5';
//                             onTap = () => provider.setValue('5');
//                             break;
//                           case 10:
//                             buttonText = '6';
//                             onTap = () => provider.setValue('6');
//                             break;
//                           case 11:
//                             buttonText = '+';
//                             onTap = () => provider.setValue('+');
//                             break;
//                           case 12:
//                             buttonText = '1';
//                             onTap = () => provider.setValue('1');
//                             break;
//                           case 13:
//                             buttonText = '2';
//                             onTap = () => provider.setValue('2');
//                             break;
//                           case 14:
//                             buttonText = '3';
//                             onTap = () => provider.setValue('3');
//                             break;
//                           case 15:
//                             buttonText = '%';
//                             onTap = () => provider.setValue('%');
//                             break;
//                           case 16:
//                             buttonText = '0';
//                             onTap = () => provider.setValue('0');
//                             break;
//                           case 17:
//                             buttonText = '.';
//                             onTap = () => provider.setValue('.');
//                             break;
//                           case 18:
//                           default:
//                             buttonText = '=';
//                             onTap = () => provider.setValue('=');
//                             break;
//                         }
//
//                         return InkWell(
//                           onTap: onTap,
//                           child: Material(
//                             elevation: 3,
//                             color: Colors.black,
//                             borderRadius: BorderRadius.circular(10),
//                             child: Container(
//                               height: flexFactor == 2 ? 150 : null,
//                               decoration: BoxDecoration(
//                                 color: Colors.white,
//                                 borderRadius: BorderRadius.circular(10),
//                               ),
//                               child: Center(
//                                 child: Text(
//                                   buttonText,
//                                   style: const TextStyle(
//                                     fontSize: 20,
//                                     fontWeight: FontWeight.w600,
//                                     color: Colors.black,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         );
//                       },
//                     ),
//                   ),
//                 )
//               ])));
//     });
//   }
// }
//
// VIMP
import 'package:billing/calculator/transaction_saved.dart';
import 'package:billing/provider/cal_provider.dart';
import 'package:billing/services/database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';


class Calculatorgot extends StatefulWidget {
  final String? comp;
  final String? Id;
  final String? billId;
  final String? name;
  final String? mobile;

  Calculatorgot({
    super.key,
    this.comp,
    this.Id,
    this.billId,
    this.name,
    this.mobile
  });

  @override
  State<Calculatorgot> createState() => _CalculatorgotState();
}

class _CalculatorgotState extends State<Calculatorgot> {
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

  // final ImagePicker _imagePicker = ImagePicker();
  // String? imageUrl;
  // bool isLoading = false;
  // Future<void> pickImage() async {
  //   try {
  //     XFile? res = await _imagePicker.pickImage(source: ImageSource.gallery);
  //
  //     if (res != null) {
  //       await uploadImageToFirebase(File(res.path));
  //     }
  //   } catch (e) {
  //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //       content: Text('Failed to pick image: $e'),
  //     ));
  //   }
  // }
  //
  // Future<void> uploadImageToFirebase(File image) async {
  //   setState(() {
  //     isLoading = true;
  //   });
  //   try {
  //     Reference reference = FirebaseStorage.instance
  //         .ref()
  //         .child('images/${DateTime.now().microsecondsSinceEpoch}.png');
  //     await reference.putFile(image).whenComplete(() {
  //       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //           backgroundColor: Colors.red,
  //           duration: Duration(seconds: 2),
  //           content: Text('Upload Successfully')));
  //     });
  //     imageUrl = await reference.getDownloadURL();
  //   } catch (e) {
  //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //       backgroundColor: Colors.red,
  //       content: Text('Failed to upload image: $e'),
  //     ));
  //   }
  //   setState(() {
  //     isLoading = false;
  //   });
  // }
  //  upload image on storage

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
            title: Text(
              'You got ₹ ${provider.compController.text} to ${widget.name}'.tr,
              style: const TextStyle(color: Color(0xFF1CC1AB)),
            ),
          ),
          body: Form(
              key: _formKey,
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 10.0),
                  child: TextField(
                    controller: provider.compController,
                    decoration: InputDecoration(
                      hintText: '₹ Enter amount'.tr,
                      fillColor: Colors.grey[200],
                      filled: true,
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.zero,
                    ),
                    style:
                    const TextStyle(fontSize: 25, color: Color(0xFF1CC1AB)),
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
                          const Icon(Icons.calendar_month),
                          const SizedBox(width: 8),
                          Text(
                            selectedDate != null
                                ? "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}"
                                : 'Select Date'.tr,
                            style: const TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                      IconButton(
                        icon: const Icon(Icons.arrow_drop_down),
                        onPressed: () async {
                          DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: selectedDate ?? DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2101),
                          );

                          if (pickedDate != null &&
                              pickedDate != selectedDate) {
                            setState(() {
                              selectedDate = pickedDate;
                            });
                          }
                        },
                      ),
                    ],
                  ),
                ),
                Spacer(),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 16.0),
                  child: InkWell(
                    onTap: () async {
                      debugPrint('save pressed ********ppppppppp trrrrrrr');
                      print(widget.name);
                      print(provider.compController.text);
                      debugPrint(widget.Id);
                      // return;
                      if (_formKey.currentState!.validate()) {
                        Map<String, dynamic> billInfoMap = {
                          "comp": provider.compController.text,
                          "date": selectedDate != null
                              ? "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}"
                              : null,
                        };
                        if (widget.Id != null) {
                          try {
                            debugPrint(
                                'Updating document with ID: ${widget.Id}');
                            await DatabaseMethods()
                                .saveupdategotPartyDetails(
                                widget.Id!, billInfoMap)
                                .then((value) {
                              Fluttertoast.showToast(
                                msg:
                                "Bill Details has been uploaded successfully",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                                fontSize: 16.0,
                              );
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => TransactionSaved(
                                    comp: "${provider.compController.text}",
                                    name: '${widget.name}',
                                    mobile: '${widget.mobile}',
                                    Id: '${widget.Id}',
                                    billId: '${widget.billId}',
                                  ),
                                ),
                              );
                            });
                          } catch (e) {
                            debugPrint('Error updating Firestore: $e');
                            Fluttertoast.showToast(
                              msg: "Error: ${e.toString()}",
                              toastLength: Toast.LENGTH_LONG,
                              gravity: ToastGravity.CENTER,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0,
                            );
                          }
                        } else {
                          Fluttertoast.showToast(
                            msg: "Error: Id is null",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0,
                          );
                        }
                      }
                    },
                    child: Container(
                      height: ScreenHeight * 0.06,
                      width: ScreenWidth,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(
                          width: 0.4,
                          color: Color(0xFF1CC1AB),
                        ),
                        color: Color(0xFF1CC1AB),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
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
                      gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
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
                            onTap = () => provider.setValue('C');
                            break;
                          case 1:
                            buttonText = '/';
                            onTap = () => provider.setValue('/');
                            break;
                          case 2:
                            buttonText = '*';
                            onTap = () => provider.setValue('*');
                            break;
                          case 3:
                            buttonText = 'AC';
                            onTap = () => provider.setValue('AC');
                            break;
                          case 4:
                            buttonText = '7';
                            onTap = () => provider.setValue('7');
                            break;
                          case 5:
                            buttonText = '8';
                            onTap = () => provider.setValue('8');
                            break;
                          case 6:
                            buttonText = '9';
                            onTap = () => provider.setValue('9');
                            break;
                          case 7:
                            buttonText = '-';
                            onTap = () => provider.setValue('-');
                            break;
                          case 8:
                            buttonText = '4';
                            onTap = () => provider.setValue('4');
                            break;
                          case 9:
                            buttonText = '5';
                            onTap = () => provider.setValue('5');
                            break;
                          case 10:
                            buttonText = '6';
                            onTap = () => provider.setValue('6');
                            break;
                          case 11:
                            buttonText = '+';
                            onTap = () => provider.setValue('+');
                            break;
                          case 12:
                            buttonText = '1';
                            onTap = () => provider.setValue('1');
                            break;
                          case 13:
                            buttonText = '2';
                            onTap = () => provider.setValue('2');
                            break;
                          case 14:
                            buttonText = '3';
                            onTap = () => provider.setValue('3');
                            break;
                          case 15:
                            buttonText = '%';
                            onTap = () => provider.setValue('%');
                            break;
                          case 16:
                            buttonText = '0';
                            onTap = () => provider.setValue('0');
                            break;
                          case 17:
                            buttonText = '.';
                            onTap = () => provider.setValue('.');
                            break;
                          case 18:
                          default:
                            buttonText = '=';
                            onTap = () => provider.setValue('=');
                            break;
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
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
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
              ])));
    });
  }
}


