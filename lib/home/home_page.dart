// import 'dart:ui';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_contacts/flutter_contacts.dart';
// import 'package:get/get.dart';
// import 'package:provider/provider.dart';
// import 'package:sgibooks/home/builk_reminder.dart';
// import 'package:sgibooks/provider/cal_provider.dart';
// import 'package:sgibooks/view/customer_history.dart';
// import 'bottom_sheet.dart';
//
// class HomePage extends StatefulWidget {
//   final String? name;
//   final String? Id;
//   final String? billId;
//   final String? comp;
//
//   HomePage({super.key, this.name, this.Id, this.billId, this.comp});
//
//   @override
//   State<HomePage> createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
//   late TabController _tabController;
//   final TextEditingController _searchController = TextEditingController();
//   String searchText = '';
//   late Stream<QuerySnapshot> _stream;
//   bool _isLoading = true;
//
//   @override
//   void initState() {
//     super.initState();
//     _tabController = TabController(length: 5, vsync: this);
//     getContactPermission();
//     _fetchUserEmail();
//     _stream = FirebaseFirestore.instance
//         .collection('Book')
//         .orderBy('name')
//         .snapshots();
//   }
//
//   void _fetchUserEmail() async {
//     setState(() {
//       _isLoading = true;
//     });
//     await Future.delayed(Duration(seconds: 2));
//     setState(() {
//       _isLoading = false;
//     });
//   }
//
//   List<Contact> contacts = [];
//   bool isLoading = true;
//
//   void getContactPermission() async {
//     if (await FlutterContacts.requestPermission()) {
//       fetchContacts();
//     } else {
//       setState(() {
//         isLoading = false;
//       });
//     }
//   }
//
//   void fetchContacts() async {
//     List<Contact> fetchedContacts =
//     await FlutterContacts.getContacts(withProperties: true);
//     setState(() {
//       contacts = fetchedContacts;
//       isLoading = false;
//     });
//   }
//
//   void showAddCustomerBottomSheet(BuildContext context) {
//     showModalBottomSheet(
//       context: context,
//       isScrollControlled: true,
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
//       ),
//       builder: (BuildContext context) {
//         return AddCustomerBottomSheet(
//           contacts: contacts,
//           isLoading: isLoading,
//           onContactSelected: (selectedName) {
//             // Handle the selected contact name here
//             print("Selected contact: $selectedName");
//           },
//           name: '${widget.name}',
//           flat: 'flat',
//           comp: '${widget.comp}',
//           Id: '${widget.Id}',
//           billId: '${widget.billId}',
//         );
//       },
//     );
//   }
//
//   int _selectedChipIndex = 0;
//
//   bool _filterItem(Map item) {
//     switch (_selectedChipIndex) {
//       case 1: // Due Today
//         DateTime dueDate = DateTime.parse(item['dueDate']);
//         return dueDate.isToday();
//       case 2: // Upcoming
//         DateTime dueDate = DateTime.parse(item['dueDate']);
//         return dueDate.isAfter(DateTime.now());
//       case 3: // No Due
//         return item['dueDate'] == null || item['dueDate'].isEmpty;
//       case 4: // Filter
//       // Implement your filter logic here
//         return true; // Default to true for now
//       default: // All
//         return true;
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final screenHeight = MediaQuery.of(context).size.height;
//     final screenWidth = MediaQuery.of(context).size.width;
//     final List<String> chipLabels = [
//       'All'.tr,
//       'Due Today'.tr,
//       'Upcoming'.tr,
//       'No Due'.tr,
//       'Filter'.tr
//     ];
//     return Consumer<CalculatorProvider>(builder: (context, provider, _) {
//       return Scaffold(
//         appBar: AppBar(
//           toolbarHeight: screenHeight * 0.3,
//           flexibleSpace: Stack(
//             children: [
//               ClipRect(
//                 child: BackdropFilter(
//                   filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
//                   child: Column(
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.only(left: 18.0, top: 40),
//                         child: Row(
//                           children: [
//                             Icon(Icons.book_online_outlined,
//                                 size:  22, color: Colors.white),
//                             SizedBox(width: 5),
//                             Text('Priya Jwelars'.tr,
//                                 style: TextStyle(
//                                     color: Colors.white, fontSize: 21)),
//                             SizedBox(width: 5),
//                             Icon(Icons.edit, size: 22, color: Colors.white),
//                             Spacer(),
//                             Container(
//                               height: screenHeight * 0.04,
//                               width: screenWidth * 0.2,
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(14),
//                                 border: Border.all(
//                                     width: 0.8, color: Color(0xffFCB122)),
//                               ),
//                               child: Text('10'.tr,
//                                   style: TextStyle(
//                                       color: Colors.white, fontSize: 16),
//                                   textAlign: TextAlign.start),
//                             ),
//                             Padding(
//                               padding:
//                               const EdgeInsets.only(left: 10, right: 10),
//                               child: Icon(Icons.calendar_month,
//                                   size: 22,
//                                   color: Color.fromRGBO(255, 255, 255, 1)),
//                             ),
//                           ],
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.all(12.0),
//                         child: Row(
//                           children: [
//                             Text('CUSTOMERS'.tr,
//                                 style: TextStyle(
//                                     color: Colors.white, fontSize: 14)),
//                             Spacer(),
//                             Text('SUPPLIERS'.tr,
//                                 style: TextStyle(
//                                     color: Colors.white, fontSize: 14)),
//                             Spacer(),
//                             Container(
//                               child: Row(
//                                 children: [
//                                   SizedBox(
//                                     height: 50,
//                                     width: 50,
//                                     child: Stack(
//                                       alignment: Alignment.center,
//                                       children: [
//                                         Positioned(
//                                           top: 15,
//                                           left: 20,
//                                           right: 10,
//                                           bottom: 15,
//                                           child: Icon(Icons.person,
//                                               size: 18, color: Colors.white),
//                                         ),
//                                         Positioned(
//                                           top: 15,
//                                           left: 30,
//                                           right: 35,
//                                           bottom: 15,
//                                           child: Icon(Icons.add,
//                                               size: 12, color: Colors.white),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                   Text('ADD STAFF'.tr,
//                                       style: TextStyle(
//                                           color: Colors.white, fontSize: 14)),
//                                 ],
//                               ),
//                             )
//                           ],
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Container(
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(6),
//                             border: Border.all(width: 0.4, color: Colors.black),
//                             color: Colors.white,
//                           ),
//                           child: Padding(
//                             padding: const EdgeInsets.all(14.0),
//                             child: Row(
//                               children: [
//                                 Column(
//                                   mainAxisAlignment: MainAxisAlignment.start,
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Text('${provider.compController.text}'.tr,
//                                         style: TextStyle(
//                                             color: Color(0xff138151))),
//                                     SizedBox(height: 10),
//                                     Text('you will give'.tr,
//                                         style: TextStyle(color: Colors.grey)),
//                                   ],
//                                 ),
//                                 Spacer(),
//                                 Column(
//                                   mainAxisAlignment: MainAxisAlignment.start,
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Text('${provider.compController.text}'.tr,
//                                         style: TextStyle(
//                                             color: Color(0xffC34055))),
//                                     SizedBox(height: 10),
//                                     Text('you will get'.tr,
//                                         style: TextStyle(color: Colors.grey)),
//                                   ],
//                                 ),
//                                 Spacer(),
//                                 Column(
//                                   mainAxisAlignment: MainAxisAlignment.start,
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Text('View'.tr,
//                                         style: TextStyle(
//                                             color: Color(0xFF1CC1AB))),
//                                     SizedBox(height: 10),
//                                     Text('Report'.tr,
//                                         style: TextStyle(
//                                             color: Color(0xFF1CC1AB))),
//                                   ],
//                                 ),
//                                 SizedBox(width: 10),
//                                 Icon(Icons.arrow_forward_ios_rounded,
//                                     color: Color(0xFF1CC1AB)),
//                               ],
//                             ),
//                           ),
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               )
//             ],
//           ),
//           automaticallyImplyLeading: false,
//           backgroundColor: Color(0xFF1CC1AB),
//         ),
//         body: Column(
//           children: [
//             SizedBox(height: 10),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Container(
//                     height: screenHeight *  0.05,
//                     width: screenWidth * 0.4,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(6),
//                       border: Border.all(width: 0.4, color: Colors.black),
//                     ),
//                     child: Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Row(
//                         children: [
//                           Icon(Icons.search),
//                           SizedBox(width: 5),
//                           Expanded(
//                             child: TextFormField(
//                               controller: _searchController,
//                               onChanged: (value) {
//                                 setState(() {
//                                   searchText = value;
//                                 });
//                               },
//                               decoration: InputDecoration(
//                                 hintText: 'Search'.tr,
//                                 border: InputBorder.none,
//                               ),
//                               style: TextStyle(fontSize: 12),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   Spacer(),
//                   GestureDetector(
//                     onTap: () {
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => BulkReminderScreen()));
//                     },
//                     child: Container(
//                       height: screenHeight * 0.05,
//                       width: screenWidth * 0.5,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(6),
//                         border: Border.all(width: 0.4, color: Colors.black),
//                       ),
//                       child: Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Row(
//                           children: [
//                             Icon(Icons.notification_important_sharp),
//                             Text(
//                               'Bulk Reminder'.tr,
//                               style:
//                               TextStyle(color: Colors.black, fontSize: 12),
//                               textAlign: TextAlign.start,
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             SingleChildScrollView(
//               scrollDirection: Axis.horizontal,
//               child: Row(
//                 children: List.generate(chipLabels.length, (index) {
//                   return Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 5.0),
//                     child: ChoiceChip(
//                       label: Row(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           if (chipLabels[index] == 'Filter'.tr)
//                             Icon(Icons.filter_alt_outlined, size: 15),
//                           if (chipLabels[index] == 'Filter'.tr)
//                             const SizedBox(width: 5),
//                           Text(chipLabels[index]),
//                         ],
//                       ),
//                       selected: _selectedChipIndex == index,
//                       selectedColor: Color(0xFF1CC1AB),
//                       onSelected: (selected) {
//                         setState(() {
//                           _selectedChipIndex = index;
//                         });
//                       },
//                     ),
//                   );
//                 }),
//               ),
//             ),
//             SizedBox(height: 10),
//             Expanded(
//               child: IndexedStack(
//                 index: _selectedChipIndex,
//                 children: [
//                   StreamBuilder<QuerySnapshot>(
//                     builder: (BuildContext context, AsyncSnapshot snapshot) {
//                       if (snapshot.hasError) {
//                         return Center(
//                           child:
//                           Text('Some error occurred: ${snapshot.error}'.tr),
//                         );
//                       }
//                       if (snapshot.hasData) {
//                         QuerySnapshot querySnapshot = snapshot.data;
//                         List<QueryDocumentSnapshot> document =
//                             querySnapshot.docs;
//                         // List<Map> items =
//                         // document.map((e) => e.data() as Map).toList();
//                         List<Map<String, dynamic>> items = document.map((e) {
//                           final data = e.data() as Map<String, dynamic>;
//                           data['Id'] = e.id; // Add the Firestore document ID
//                           return data;
//                         }).toList();
//
//
//                         if (searchText.isNotEmpty) {
//                           items = items.where((item) {
//                             return (item['name']
//                                 .toString()
//                                 .toLowerCase()
//                                 .contains(searchText.toLowerCase()) ||
//                                 item['flat']
//                                     .toString()
//                                     .toLowerCase()
//                                     .contains(searchText.toLowerCase()) ||
//                                 item['comp']
//                                     .toString()
//                                     .toLowerCase()
//                                     .contains(searchText.toLowerCase())) &&
//                                 _filterItem(item);
//                           }).toList();
//                         } else {
//                           items = items.where((item) => _filterItem(item)).toList();
//                         }
//
//                         items.sort((a, b) => a['name']
//                             .toString()
//                             .length
//                             .compareTo(b['name'].toString().length));
//
//                         return ListView.builder(
//                           itemCount: items.length,
//                           itemBuilder: (BuildContext context, int index) {
//                             Map thisItem = items[index];
//                             return Padding(
//                               padding: const EdgeInsets.all(6.0),
//                               child: Material(
//                                 elevation: 4,
//                                 borderRadius: BorderRadius.circular(20),
//                                 child: ListTile(
//                                   title: Text('${thisItem['name']}'.tr),
//                                   subtitle: Text('${thisItem['flat']}'.tr),
//                                   trailing: Container(
//                                       height: 40,
//                                       width: 90,
//                                       decoration: BoxDecoration(
//                                           color: Colors.blueGrey,
//                                           borderRadius: BorderRadius.circular(10)
//                                       ),
//                                       child: Center(child: Text('${thisItem['comp']}'.tr))),
//                                   leading: CircleAvatar(
//                                     backgroundColor: Color(0xFF1CC1AB),
//                                     radius: 25,
//                                     child: thisItem.containsKey('image')
//                                         ? ClipOval(
//                                       child: Image.network(
//                                         "${thisItem['image']}",
//                                         fit: BoxFit.cover,
//                                         height: 70,
//                                         width: 70,
//                                       ),
//                                     )
//                                         : CircleAvatar(
//                                       backgroundColor: Color(0xFF1CC1AB),
//                                       radius: 27,
//                                       child: Icon(Icons.person),
//                                     ),
//                                   ),
//
//                                   onTap: () {
//                                     print(thisItem['Id']);
//                                     Navigator.push(
//                                       context,
//                                       MaterialPageRoute(
//                                         builder: (context) => CustomerHistory(
//                                           name: thisItem['name'],
//                                           flat: thisItem['flat'],
//                                           comp: thisItem['comp'],
//                                           date: thisItem['date'],
//                                           Id: thisItem['Id'],
//                                           billId: thisItem['billId'],
//                                         ),
//                                       ),
//                                     );
//                                   },
//                                 ),
//                               ),
//                             );
//                           },
//                         );
//                       }
//                       return Center(
//                         child: CircularProgressIndicator(),
//                       );
//                     },
//                     stream: _stream,
//                   ),
//                   Center(
//                     child: Text(
//                       'Add due dates for your customers and track their outstanding daily'
//                           .tr,
//                       textAlign: TextAlign.center,
//                     ),
//                   ),
//                   Center(
//                     child: Text(
//                       'Add due dates for your customers and track their upcoming dues'
//                           .tr,
//                       textAlign: TextAlign.center,
//                     ),
//                   ),
//                   Center(
//                     child: Text(
//                       'No Due Content'.tr,
//                       textAlign: TextAlign.center,
//                     ),
//                   ),
//                   Center(
//                     child: Text(
//                       'Filter Content'.tr,
//                       textAlign: TextAlign.center,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(left: 160.0, right: 5, bottom: 10),
//               child: Container(
//                 height: screenHeight * 0.05,
//                 width: screenWidth * 0.4,
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(18),
//                     border: Border.all(width: 0.4, color: Colors.black),
//                     color: Colors.red),
//                 child: Padding(
//                   padding: EdgeInsets.only(left: 10.0, top: 10.0, bottom: 10.0),
//                   child: Row(
//                     children: [
//                       Icon(Icons.add, size: 14, color: Colors.white),
//                       Icon(Icons.person, color: Colors.white, size: 14),
//                       SizedBox(width: 5),
//                       GestureDetector(
//                         onTap: () {
//                           showAddCustomerBottomSheet(context);
//                         },
//                         child: Text(
//                           'ADD CUSTOMER'.tr,
//                           textAlign: TextAlign.center,
//                           style: TextStyle(color: Colors.white, fontSize: 12),
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       );
//     });
//   }
// }
//
// extension DateTimeExtension on DateTime {
//   bool isToday() {
//     final now = DateTime.now();
//     return this.year == now.year && this.month == now.month && this.day == now.day;
//   }
// }
//VIMP

import 'dart:ui';
import 'package:billing/home/builk_reminder.dart';
import 'package:billing/view/customer_history.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../provider/cal_provider.dart';
import 'bottom_sheet.dart';
class HomePage extends StatefulWidget {
  final String? name;
  final String? Id;
  final String? billId;
  final String? comp;

  HomePage({super.key, this.name, this.Id, this.billId, this.comp});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final TextEditingController _searchController = TextEditingController();
  String searchText = '';
  late Stream<QuerySnapshot> _stream;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
    getContactPermission();
    _fetchUserEmail();
    _stream = FirebaseFirestore.instance
        .collection('Book')
        .orderBy('name')
        .snapshots();
  }

  void _fetchUserEmail() async {
    setState(() {
      _isLoading = true;
    });
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      _isLoading = false;
    });
  }

  List<Contact> contacts = [];
  bool isLoading = true;

  void getContactPermission() async {
    if (await FlutterContacts.requestPermission()) {
      fetchContacts();
    } else {
      setState(() {
        isLoading = false;
      });
    }
  }

  void fetchContacts() async {
    List<Contact> fetchedContacts =
    await FlutterContacts.getContacts(withProperties: true);
    setState(() {
      contacts = fetchedContacts;
      isLoading = false;
    });
  }

  void showAddCustomerBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return AddCustomerBottomSheet(
          contacts: contacts,
          isLoading: isLoading,
          onContactSelected: (selectedName) {
            // Handle the selected contact name here
            print("Selected contact: $selectedName");
          },
          name: '${widget.name}',
          flat: 'flat',
          comp: '${widget.comp}',
          Id: '${widget.Id}',
          billId: '${widget.billId}',
           // date: '${widget.date}',
        );
      },
    );
  }

  int _selectedChipIndex = 0;

  bool _filterItem(Map item) {
    switch (_selectedChipIndex) {
      case 1: // Due Today
        DateTime dueDate = DateTime.parse(item['dueDate']);
        return dueDate.isToday();
      case 2: // Upcoming
        DateTime dueDate = DateTime.parse(item['dueDate']);
        return dueDate.isAfter(DateTime.now());
      case 3: // No Due
        return item['dueDate'] == null || item['dueDate'].isEmpty;
      case 4: // Filter
      // Implement your filter logic here
        return true; // Default to true for now
      default: // All
        return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final List<String> chipLabels = [
      'All'.tr,
      'Due Today'.tr,
      'Upcoming'.tr,
      'No Due'.tr,
      'Filter'.tr
    ];
    return Consumer<CalculatorProvider>(builder: (context, provider, _) {
      return Scaffold(
        appBar: AppBar(
          toolbarHeight: screenHeight * 0.3,
          flexibleSpace: Stack(
            children: [
              ClipRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 18.0, top: 40),
                        child: Row(
                          children: [
                            Icon(Icons.book_online_outlined,
                                size:  22, color: Colors.white),
                            SizedBox(width: 5),
                            Text('Priya Jwelars'.tr,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold)),
                            SizedBox(width: 5),
                            // Icon(Icons.edit, size: 22, color: Colors.white),
                            // Spacer(),
                            // Container(
                            //   height: screenHeight * 0.04,
                            //   width: screenWidth * 0.2,
                            //   decoration: BoxDecoration(
                            //     borderRadius: BorderRadius.circular(14),
                            //     border: Border.all(
                            //         width: 0.8, color: Color(0xffFCB122)),
                            //   ),
                            //   child: Text('10'.tr,
                            //       style: TextStyle(
                            //           color: Colors.white, fontSize: 16),
                            //       textAlign: TextAlign.start),
                            // ),
                            // Padding(
                            //   padding:
                            //   const EdgeInsets.only(left: 10, right: 10),
                            //   child: Icon(Icons.calendar_month,
                            //       size: 22,
                            //       color: Color.fromRGBO(255, 255, 255, 1)),
                            // ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          children: [
                            Text('CUSTOMERS'.tr,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 14)),
                            Spacer(),
                            Text('SUPPLIERS'.tr,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 14)),
                            Spacer(),
                            Container(
                              child: Row(
                                children: [
                                  SizedBox(
                                    height: 50,
                                    width: 50,
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        Positioned(
                                          top: 15,
                                          left: 20,
                                          right: 10,
                                          bottom: 15,
                                          child: Icon(Icons.person,
                                              size: 18, color: Colors.white),
                                        ),
                                        Positioned(
                                          top: 15,
                                          left: 30,
                                          right: 35,
                                          bottom: 15,
                                          child: Icon(Icons.add,
                                              size: 12, color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Text('ADD STAFF'.tr,
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 14)),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(width: 0.4, color: Colors.black),
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(14.0),
                            child: Row(
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('${provider.compController.text}'.tr,
                                        style: TextStyle(
                                            color: Color(0xff138151))),
                                    SizedBox(height: 10),
                                    Text('you will give'.tr,
                                        style: TextStyle(color: Colors.grey)),
                                  ],
                                ),
                                Spacer(),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('${provider.compController.text}'.tr,
                                        style: TextStyle(
                                            color: Color(0xffC34055))),
                                    SizedBox(height: 10),
                                    Text('you will get'.tr,
                                        style: TextStyle(color: Colors.grey)),
                                  ],
                                ),
                                Spacer(),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('View'.tr,
                                        style: TextStyle(
                                            color: Color(0xFF1CC1AB))),
                                    SizedBox(height: 10),
                                    Text('Report'.tr,
                                        style: TextStyle(
                                            color: Color(0xFF1CC1AB))),
                                  ],
                                ),
                                SizedBox(width: 10),
                                Icon(Icons.arrow_forward_ios_rounded,
                                    color: Color(0xFF1CC1AB)),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
          automaticallyImplyLeading: false,
          backgroundColor: Color(0xFF1CC1AB),
        ),
        body: Column(
          children: [
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: screenHeight *  0.05,
                    width: screenWidth * 0.4,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(width: 0.4, color: Colors.black),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Icon(Icons.search),
                          SizedBox(width: 5),
                          Expanded(
                            child: TextFormField(
                              controller: _searchController,
                              onChanged: (value) {
                                setState(() {
                                  searchText = value;
                                });
                              },
                              decoration: InputDecoration(
                                hintText: 'Search'.tr,
                                border: InputBorder.none,
                              ),
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BulkReminderScreen()));
                    },
                    child: Container(
                      height: screenHeight * 0.05,
                      width: screenWidth * 0.5,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(width: 0.4, color: Colors.black),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Icon(Icons.notification_important_sharp),
                            Text(
                              'Bulk Reminder'.tr,
                              style:
                              TextStyle(color: Colors.black, fontSize: 12),
                              textAlign: TextAlign.start,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(chipLabels.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: ChoiceChip(
                      label: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (chipLabels[index] == 'Filter'.tr)
                            Icon(Icons.filter_alt_outlined, size: 15),
                          if (chipLabels[index] == 'Filter'.tr)
                            const SizedBox(width: 5),
                          Text(chipLabels[index]),
                        ],
                      ),
                      selected: _selectedChipIndex == index,
                      selectedColor: Color(0xFF1CC1AB),
                      onSelected: (selected) {
                        setState(() {
                          _selectedChipIndex = index;
                        });
                      },
                    ),
                  );
                }),
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: IndexedStack(
                index: _selectedChipIndex,
                children: [
                  StreamBuilder<QuerySnapshot>(
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.hasError) {
                        return Center(
                          child:
                          Text('Some error occurred: ${snapshot.error}'.tr),
                        );
                      }
                      if (snapshot.hasData) {
                        QuerySnapshot querySnapshot = snapshot.data;
                        List<QueryDocumentSnapshot> document =
                            querySnapshot.docs;
                        // List<Map> items =
                        // document.map((e) => e.data() as Map).toList();
                        List<Map<String, dynamic>> items = document.map((e) {
                          final data = e.data() as Map<String, dynamic>;
                          data['Id'] = e.id; // Add the Firestore document ID
                          return data;
                        }).toList();


                        if (searchText.isNotEmpty) {
                          items = items.where((item) {
                            return (item['name']
                                .toString()
                                .toLowerCase()
                                .contains(searchText.toLowerCase()) ||
                                item['flat']
                                    .toString()
                                    .toLowerCase()
                                    .contains(searchText.toLowerCase()) ||
                                item['comp']
                                    .toString()
                                    .toLowerCase()
                                    .contains(searchText.toLowerCase())) &&
                                _filterItem(item);
                          }).toList();
                        } else {
                          items = items.where((item) => _filterItem(item)).toList();
                        }

                        items.sort((a, b) => a['name']
                            .toString()
                            .length
                            .compareTo(b['name'].toString().length));

                        return ListView.builder(
                          itemCount: items.length,
                          itemBuilder: (BuildContext context, int index) {
                            Map thisItem = items[index];
                            return Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: Material(
                                elevation: 4,
                                borderRadius: BorderRadius.circular(20),
                                child: ListTile(
                                  title: Text('${thisItem['name']}'.tr),
                                  subtitle: Text('${thisItem['flat']}'.tr),
                                  trailing: Container(
                                      height: 40,
                                      width: 90,
                                      decoration: BoxDecoration(
                                          color: Colors.blueGrey,
                                          borderRadius: BorderRadius.circular(10)
                                      ),
                                      child: Center(child: Text('${thisItem['comp']}'.tr,style: TextStyle(color: Colors.white),))),
                                  leading: CircleAvatar(
                                    backgroundColor: Color(0xFF1CC1AB),
                                    radius: 25,
                                    child: thisItem.containsKey('image')
                                        ? ClipOval(
                                      child: Image.network(
                                        "${thisItem['image']}",
                                        fit: BoxFit.cover,
                                        height: 70,
                                        width: 70,
                                      ),
                                    )
                                        : CircleAvatar(
                                      backgroundColor: Color(0xFF1CC1AB),
                                      radius: 27,
                                      child: Icon(Icons.person),
                                    ),
                                  ),

                                  onTap: () {
                                    print(thisItem['Id']);
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => CustomerHistory(
                                          name: thisItem['name'],
                                          flat: thisItem['flat'],
                                          comp: thisItem['comp'],
                                          date: thisItem['date'],
                                          Id: thisItem['Id'],
                                          billId: thisItem['billId'],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            );
                          },
                        );
                      }
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                    stream: _stream,
                  ),
                  Center(
                    child: Text(
                      'Add due dates for your customers and track their outstanding daily'
                          .tr,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Center(
                    child: Text(
                      'Add due dates for your customers and track their upcoming dues'
                          .tr,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Center(
                    child: Text(
                      'No Due Content'.tr,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Center(
                    child: Text(
                      'Filter Content'.tr,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 160.0, right: 5, bottom: 10),
              child: Container(
                height: screenHeight * 0.05,
                width: screenWidth * 0.4,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(width: 0.4, color: Colors.black),
                    color: Colors.red),
                child: Padding(
                  padding: EdgeInsets.only(left: 10.0, top: 10.0, bottom: 10.0),
                  child: Row(
                    children: [
                      Icon(Icons.add, size: 14, color: Colors.white),
                      Icon(Icons.person, color: Colors.white, size: 14),
                      SizedBox(width: 5),
                      GestureDetector(
                        onTap: () {
                          showAddCustomerBottomSheet(context);
                        },
                        child: Text(
                          'ADD CUSTOMER'.tr,
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}

extension DateTimeExtension on DateTime {
  bool isToday() {
    final now = DateTime.now();
    return this.year == now.year && this.month == now.month && this.day == now.day;
  }
}