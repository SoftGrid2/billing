// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:provider/provider.dart';
// import 'package:random_string/random_string.dart';
// import 'package:sgibook/calculator/constant/color.dart';
// import 'package:sgibook/provider/cal_provider.dart';
// import '../services/database.dart';
//
// class Calculator extends StatefulWidget {
//   const Calculator({super.key});
//
//   @override
//   State<Calculator> createState() => _CalculatorState();
// }
//
// class _CalculatorState extends State<Calculator> {
//   final _formKey = GlobalKey<FormState>();
//
//   @override
//   Widget build(BuildContext context) {
//     final ScreenHeight = MediaQuery.of(context).size.height;
//     final ScreenWidth = MediaQuery.of(context).size.width;
//     final decoration = const BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.vertical(
//             top: Radius.circular(30)));
//     return Consumer<CalculatorProvider>(builder: (context, provider, _) {
//       return Scaffold(
//         appBar: AppBar(
//           title: Text('You gave ₹ 0 to Prachi',style: TextStyle(color: Colors.red),),
//         ),
//         body: Form(
//           key: _formKey,
//           child: Column(
//               children: [
//                 Spacer(),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
//                   child: TextField(
//                     controller: provider.compController,
//                     decoration: InputDecoration(
//                       hintText: '₹ Enter amount', // Empty hint text as we'll use RichText
//                       fillColor: Colors.white,
//                       filled: true,
//                       border: InputBorder.none,
//                       contentPadding: EdgeInsets.zero, // To adjust the vertical padding
//                     ),
//                     style: const TextStyle(fontSize: 25, color: Colors.red),
//                     readOnly: true,
//                     autofocus: true,
//                     showCursor: true,
//                   ),
//                 ),
//                 const Spacer(),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
//                   child: InkWell(
//
//                     onTap: () async {
//                       if(_formKey.currentState!.validate()){
//                         String Id = randomAlphaNumeric(10);
//                         Map<String, dynamic> billInfoMap = {
//                           "comp": provider.compController.text,
//                           "Id":Id,
//                         };
//                         await DatabaseMethods()
//                             .addPartyDetails(billInfoMap, Id)
//                             .then((value) {
//                           Fluttertoast.showToast(
//                               msg:
//                               "Bill Details has been uploaded successfully",
//                               toastLength: Toast.LENGTH_SHORT,
//                               gravity: ToastGravity.CENTER,
//                               timeInSecForIosWeb: 1,
//                               backgroundColor: Colors.red,
//                               textColor: Colors.white,
//                               fontSize: 16.0);
//                         });
//                           Navigator.pop(context);
//                       }
//                       provider.compController.clear();
//
//                     },
//                     child: Container(
//                       height: ScreenHeight * 0.06, // Responsive height
//                       width: ScreenWidth * 1, // 80% of screen width
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(6),
//                           border: Border.all(
//                             width: 0.4,
//                             color: Colors.red,
//                           ),
//                           color: Colors.red),
//                       child: Padding(
//                         padding: EdgeInsets.only(
//                             left: 10.0, top: 10.0, bottom: 10, right: 10),
//                         child: Text(
//                           maxLines: 1,
//                           'SAVE',
//                           style: TextStyle(color: Colors.white, fontSize: 16),textAlign: TextAlign.center,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 const Spacer(),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Container(
//                     height: ScreenHeight * 0.6,
//                     width: double.infinity,
//                     decoration: decoration,
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.spaceAround,
//                       children: [
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             InkWell(
//                               onTap: () => Provider.of<CalculatorProvider>(context,
//                                       listen: false)
//                                   .setValue('C'),
//                               child: Material(
//                                 elevation: 3,
//                                 color: AppColors.secondary2Color,
//                                 borderRadius: BorderRadius.circular(50),
//                                 child: const CircleAvatar(
//                                   radius: 30,
//                                   // backgroundColor: AppColors.secondary2Color,
//                                   backgroundColor: Colors.white,
//                                   child: Text(
//                                     'C',
//                                     style: TextStyle(
//                                         fontSize: 28,
//                                         fontWeight: FontWeight.w600,
//                                         color: AppColors.secondary1Color),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             InkWell(
//                               onTap: () => Provider.of<CalculatorProvider>(context,
//                                       listen: false)
//                                   .setValue('/'),
//                               child: Material(
//                                 elevation: 3,
//                                 color: AppColors.secondary2Color,
//                                 borderRadius: BorderRadius.circular(50),
//                                 child: const CircleAvatar(
//                                   radius: 30,
//                                   backgroundColor: Colors.white,
//                                   child: Text(
//                                     '/',
//                                     style: TextStyle(
//                                         fontSize: 32,
//                                         fontWeight: FontWeight.w600,
//                                         color: AppColors.secondary1Color),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             InkWell(
//                               onTap: () => Provider.of<CalculatorProvider>(context,
//                                       listen: false)
//                                   .setValue('*'),
//                               child: Material(
//                                 elevation: 3,
//                                 color: AppColors.secondary2Color,
//                                 borderRadius: BorderRadius.circular(50),
//                                 child: const CircleAvatar(
//                                   radius: 30,
//                                   backgroundColor: Colors.white,
//                                   child: Text(
//                                     '*',
//                                     style: TextStyle(
//                                         fontSize: 28,
//                                         fontWeight: FontWeight.w600,
//                                         color: AppColors.secondary1Color),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             InkWell(
//                               onTap: () => Provider.of<CalculatorProvider>(context,
//                                       listen: false)
//                                   .setValue('AC'),
//                               child: Material(
//                                 elevation: 3,
//                                 color: AppColors.secondary2Color,
//                                 borderRadius: BorderRadius.circular(50),
//                                 child: const CircleAvatar(
//                                   radius: 30,
//                                   backgroundColor: Colors.white,
//                                   child: Text(
//                                     'AC',
//                                     style: TextStyle(
//                                         fontSize: 28,
//                                         fontWeight: FontWeight.w600,
//                                         color: AppColors.secondary1Color),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             InkWell(
//                               onTap: () => Provider.of<CalculatorProvider>(context,
//                                       listen: false)
//                                   .setValue('7'),
//                               child: Material(
//                                 elevation: 3,
//                                 color: AppColors.secondary2Color,
//                                 borderRadius: BorderRadius.circular(50),
//                                 child: const CircleAvatar(
//                                   radius: 30,
//                                   backgroundColor: Colors.white,
//
//                                   child: Text(
//                                     '7',
//                                     style: TextStyle(
//                                         fontSize: 28,
//                                         fontWeight: FontWeight.w600,
//                                         color: Colors.black),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             InkWell(
//                               onTap: () => Provider.of<CalculatorProvider>(context,
//                                       listen: false)
//                                   .setValue('8'),
//                               child: Material(
//                                 elevation: 3,
//                                 color: AppColors.secondary2Color,
//                                 borderRadius: BorderRadius.circular(50),
//                                 child: const CircleAvatar(
//                                   radius: 30,
//                                   backgroundColor: Colors.white,
//                                   child: Text(
//                                     '8',
//                                     style: TextStyle(
//                                         fontSize: 28,
//                                         fontWeight: FontWeight.w600,
//                                         color: Colors.black),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             InkWell(
//                               onTap: () => Provider.of<CalculatorProvider>(context,
//                                       listen: false)
//                                   .setValue('9'),
//                               child: Material(
//                                 elevation: 3,
//                                 color: AppColors.secondary2Color,
//                                 borderRadius: BorderRadius.circular(50),
//                                 child: const CircleAvatar(
//                                   radius: 30,
//                                   backgroundColor: Colors.white,
//                                   child: Text(
//                                     '9',
//                                     style: TextStyle(
//                                         fontSize: 28,
//                                         fontWeight: FontWeight.w600,
//                                         color: Colors.black),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             InkWell(
//                               onTap: () => Provider.of<CalculatorProvider>(context,
//                                       listen: false)
//                                   .setValue('-'),
//                               child: Material(
//                                 elevation: 3,
//                                 color: AppColors.secondary2Color,
//                                 borderRadius: BorderRadius.circular(50),
//                                 child: const CircleAvatar(
//                                   radius: 30,
//                                   backgroundColor: Colors.white,
//                                   child: Text(
//                                     '-',
//                                     style: TextStyle(
//                                         fontSize: 28,
//                                         fontWeight: FontWeight.w600,
//                                         color: AppColors.secondary1Color),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             InkWell(
//                               onTap: () => Provider.of<CalculatorProvider>(context,
//                                       listen: false)
//                                   .setValue('4'),
//                               child: Material(
//                                 elevation: 3,
//                                 color: AppColors.secondary2Color,
//                                 borderRadius: BorderRadius.circular(50),
//                                 child: const CircleAvatar(
//                                   radius: 30,
//                                   backgroundColor: Colors.white,
//                                   child: Text(
//                                     '4',
//                                     style: TextStyle(
//                                         fontSize: 28,
//                                         fontWeight: FontWeight.w600,
//                                         color: Colors.black),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             InkWell(
//                               onTap: () => Provider.of<CalculatorProvider>(context,
//                                       listen: false)
//                                   .setValue('5'),
//                               child: Material(
//                                 elevation: 3,
//                                 color: AppColors.secondary2Color,
//                                 borderRadius: BorderRadius.circular(50),
//                                 child: const CircleAvatar(
//                                   radius: 30,
//                                   backgroundColor: Colors.white,
//                                   child: Text(
//                                     '5',
//                                     style: TextStyle(
//                                         fontSize: 28,
//                                         fontWeight: FontWeight.w600,
//                                         color: Colors.black),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             InkWell(
//                               onTap: () => Provider.of<CalculatorProvider>(context,
//                                       listen: false)
//                                   .setValue('6'),
//                               child: Material(
//                                 elevation: 3,
//                                 color: AppColors.secondary2Color,
//                                 borderRadius: BorderRadius.circular(50),
//                                 child: const CircleAvatar(
//                                   radius: 30,
//                                   backgroundColor: Colors.white,
//                                   child: Text(
//                                     '6',
//                                     style: TextStyle(
//                                         fontSize: 28,
//                                         fontWeight: FontWeight.w600,
//                                         color: Colors.black),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             InkWell(
//                               onTap: () => Provider.of<CalculatorProvider>(context,
//                                       listen: false)
//                                   .setValue('+'),
//                               child: Material(
//                                 elevation: 3,
//                                 color: AppColors.secondary2Color,
//                                 borderRadius: BorderRadius.circular(50),
//                                 child: const CircleAvatar(
//                                   radius: 30,
//                                   backgroundColor: Colors.white,
//                                   child: Text(
//                                     '+',
//                                     style: TextStyle(
//                                         fontSize: 28,
//                                         fontWeight: FontWeight.w600,
//                                         color: AppColors.secondary1Color),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Expanded(
//                               child: Column(
//                                 children: [
//                                   Row(
//                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                     children: [
//                                       InkWell(
//                                         onTap: () => Provider.of<CalculatorProvider>(
//                                                 context,
//                                                 listen: false)
//                                             .setValue('1'),
//                                         child: Material(
//                                           elevation: 3,
//                                           color: AppColors.secondary2Color,
//                                           borderRadius: BorderRadius.circular(50),
//                                           child: const CircleAvatar(
//                                             radius: 30,
//                                             backgroundColor: Colors.white,
//                                             child: Text(
//                                               '1',
//                                               style: TextStyle(
//                                                   fontSize: 28,
//                                                   fontWeight: FontWeight.w600,
//                                                   color: Colors.black),
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                       InkWell(
//                                         onTap: () => Provider.of<CalculatorProvider>(
//                                                 context,
//                                                 listen: false)
//                                             .setValue('2'),
//                                         child: Material(
//                                           elevation: 3,
//                                           color: AppColors.secondary2Color,
//                                           borderRadius: BorderRadius.circular(50),
//                                           child: const CircleAvatar(
//                                             radius: 30,
//                                             backgroundColor: Colors.white,
//                                             child: Text(
//                                               '2',
//                                               style: TextStyle(
//                                                   fontSize: 28,
//                                                   fontWeight: FontWeight.w600,
//                                                   color: Colors.black),
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                       InkWell(
//                                         onTap: () => Provider.of<CalculatorProvider>(
//                                                 context,
//                                                 listen: false)
//                                             .setValue('3'),
//                                         child: Material(
//                                           elevation: 3,
//                                           color: AppColors.secondary2Color,
//                                           borderRadius: BorderRadius.circular(50),
//                                           child: const CircleAvatar(
//                                             radius: 30,
//                                               backgroundColor: Colors.white,
//                                             child: Text(
//                                               '3',
//                                               style: TextStyle(
//                                                   fontSize: 28,
//                                                   fontWeight: FontWeight.w600,
//                                                   color: Colors.black),
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                   const SizedBox(
//                                     height: 15,
//                                   ),
//                                   Row(
//                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                     children: [
//                                       InkWell(
//                                         onTap: () => Provider.of<CalculatorProvider>(
//                                                 context,
//                                                 listen: false)
//                                             .setValue('%'),
//                                         child: Material(
//                                           elevation: 3,
//                                           color: AppColors.secondary2Color,
//                                           borderRadius: BorderRadius.circular(50),
//                                           child: const CircleAvatar(
//                                             radius: 30,
//                                             backgroundColor: Colors.white,
//
//                                             child: Text(
//                                               '%',
//                                               style: TextStyle(
//                                                   fontSize: 28,
//                                                   fontWeight: FontWeight.w600,
//                                                   color: Colors.black),
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                       const SizedBox(
//                                         width: 3,
//                                       ),
//                                       InkWell(
//                                         onTap: () => Provider.of<CalculatorProvider>(
//                                                 context,
//                                                 listen: false)
//                                             .setValue('0'),
//                                         child: Material(
//                                           elevation: 3,
//                                           color: AppColors.secondary2Color,
//                                           borderRadius: BorderRadius.circular(50),
//                                           child: const CircleAvatar(
//                                             radius: 30,
//                                             backgroundColor: Colors.white,
//
//                                             child: Text(
//                                               '0',
//                                               style: TextStyle(
//                                                   fontSize: 28,
//                                                   fontWeight: FontWeight.w600,
//                                                   color: Colors.black),
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                       const SizedBox(
//                                         width: 3,
//                                       ),
//                                       InkWell(
//                                         onTap: () => Provider.of<CalculatorProvider>(
//                                                 context,
//                                                 listen: false)
//                                             .setValue('.'),
//                                         child: Material(
//                                           elevation: 3,
//                                           color: AppColors.secondary2Color,
//                                           borderRadius: BorderRadius.circular(50),
//                                           child: const CircleAvatar(
//                                             radius: 30,
//                                             backgroundColor: Colors.white,
//
//                                             child: Text(
//                                               '.',
//                                               style: TextStyle(
//                                                   fontSize: 28,
//                                                   fontWeight: FontWeight.w600,
//                                                   color: Colors.black),
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             const SizedBox(
//                               width: 15,
//                             ),
//                             InkWell(
//                               onTap: () => Provider.of<CalculatorProvider>(context,
//                                       listen: false)
//                                   .setValue('='),
//                               child: Container(
//                                 height: 160,
//                                 width: 70,
//                                 decoration: BoxDecoration(
//                                   color: AppColors.secondary1Color,
//                                   borderRadius: BorderRadius.circular(40),
//                                 ),
//                                 child: const Center(
//                                     child: Text(
//                                   '=',
//                                   style: TextStyle(fontSize: 28, color: Colors.white),
//                                 )),
//                               ),
//                             )
//                           ],
//                         )
//                       ],
//                     ),
//                   ),
//                 )
//               ],
//             ),
//         ),
//
//       );
//     });
//   }
// }
//
