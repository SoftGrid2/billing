// import 'dart:math';
//
// import 'package:flutter/material.dart';
// import 'package:flutter_contacts/contact.dart';
// import 'package:flutter_contacts/flutter_contacts.dart';
//
// import 'customer_history.dart';
//
// class AddCustomer extends StatefulWidget {
//   const AddCustomer({super.key});
//
//   @override
//   State<AddCustomer> createState() => _AddCustomerState();
// }
//
// class _AddCustomerState extends State<AddCustomer> {
//   List<Contact> contacts = [];
//   bool isLoading = true;
//
//   bool isSearchClick = false;
//   String searchText = '';
//
//   void onSearchChange(String value){
//     setState(() {
//       searchText = value;
//     });
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     getContactPermission();
//   }
//
//   void getContactPermission() async {
//     // Request permissions and fetch contacts if granted
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
//     // Fetch contacts with properties like phone numbers
//     List<Contact> fetchedContacts = await FlutterContacts.getContacts(
//       withProperties: true,
//     );
//
//     setState(() {
//       contacts = fetchedContacts;
//       isLoading = false;
//     });
//   }
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     final ScreenHeight = MediaQuery.of(context).size.height;
//     final ScreenWidth = MediaQuery.of(context).size.width;
//     TextEditingController searchController = TextEditingController();
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Contacts'),
//       ),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           SizedBox(
//             height: 10,
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: GestureDetector(
//               onTap: () {
//                 setState(() {
//                   isSearchClick = !isSearchClick;
//                 });
//               },
//               child: TextField(
//                 onChanged: onSearchChange,
//                 controller: searchController,
//                 decoration: InputDecoration(
//                     contentPadding: EdgeInsets.fromLTRB(16, 20, 16, 12),
//                     hintText: "Search......",
//                     hintStyle: TextStyle(color: Colors.grey),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(8.0),
//                       borderSide: BorderSide(color: Colors.grey, width: 1.0),
//                     ),
//                     enabledBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(8.0),
//                       borderSide: BorderSide(color: Colors.grey, width: 1.0),
//                     ),
//                     focusedBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(8.0),
//                         borderSide:
//                             BorderSide(color: Colors.black, width: 1.0))),
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(left: 15),
//             child: InkWell(
//               onTap: () {
//                 //   Add funtionality for adding a new contact if needed
//               },
//               child: Row(
//                 children: [
//                   const SizedBox(
//                     height: 50,
//                   ),
//                   CircleAvatar(
//                     backgroundColor: Colors.grey.shade400,
//                     child: Icon(
//                       Icons.account_circle,
//                       size: 30,
//                       color: Colors.white,
//                     ),
//                   ),
//                   const SizedBox(
//                     width: 9,
//                   ),
//                   InkWell(
//                       onTap: () {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => AddCustomer()));
//                       },
//                       child: const Text(
//                         'Add New Contact',
//                         style: TextStyle(fontSize: 17),
//                       )),
//                 ],
//               ),
//             ),
//           ),
//           isLoading
//               ? const Center(child: CircularProgressIndicator())
//               : Expanded(
//                   child: ListView.builder(
//                     itemCount: contacts.length,
//                     itemBuilder: (context, index) {
//                       final contact = contacts[index];
//                       final name = contact.displayName ?? 'No Name';
//                       final phoneNumber = contact.phones.isNotEmpty
//                           ? contact.phones.first.number
//                           : 'No Number';
//
//                       return ListTile(
//                         leading: Container(
//                           height: ScreenHeight * 0.05, // Responsive height
//                           width: ScreenWidth * 0.3,
//                           alignment: Alignment.center,
//                           decoration: BoxDecoration(
//                             boxShadow: [
//                               BoxShadow(
//                                 blurRadius: 7,
//                                 color: Colors.white.withOpacity(0.1),
//                                 offset: const Offset(-3, -3),
//                               ),
//                               BoxShadow(
//                                 blurRadius: 7,
//                                 color: Colors.black.withOpacity(0.7),
//                                 offset: const Offset(3, 3),
//                               ),
//                             ],
//                             borderRadius: BorderRadius.circular(6),
//                             color: const Color(0xff262626),
//                           ),
//                           child: Text(
//                             name.isNotEmpty ? name[0] : '?',
//                             style: TextStyle(
//                               fontSize: 23,
//                               color: Colors.primaries[
//                                   Random().nextInt(Colors.primaries.length)],
//                               fontFamily: 'Poppins',
//                               fontWeight: FontWeight.w500,
//                             ),
//                           ),
//                         ),
//                         title: Text(
//                           name,
//                           maxLines: 1,
//                           overflow: TextOverflow.ellipsis,
//                           style: TextStyle(
//                             fontSize: 16,
//                             color: Colors.black87,
//                             fontFamily: 'Poppins',
//                             fontWeight: FontWeight.w500,
//                           ),
//                         ),
//                         subtitle: Text(
//                           phoneNumber,
//                           style: TextStyle(
//                             fontSize: 11,
//                             color: Colors.black45,
//                             fontFamily: 'Poppins',
//                             fontWeight: FontWeight.w500,
//                           ),
//                         ),
//                         onTap: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => CustomerHistory(
//                                 name: name,
//                                 flat:
//                                     'Flat Info Here', // Replace with actual flat info if available
//                                 comp:
//                                     'Company Info Here', // Replace with actual company info if available
//                                 Id: 'Contact ID Here', // Replace with actual ID if available
//                               ),
//                             ),
//                           );
//                         },
//                         // horizontalTitleGap: 12.width,
//                       );
//                     },
//                   ),
//                 ),
//         ],
//       ),
//     );
//   }
// }****************88



// import 'dart:math'; ******************
// import 'package:flutter/material.dart';
// import 'package:flutter_contacts/contact.dart';
// import 'package:flutter_contacts/flutter_contacts.dart';
//
// class AddCustomerBottomSheet extends StatefulWidget {
//   const AddCustomerBottomSheet({super.key});
//
//   @override
//   State<AddCustomerBottomSheet> createState() => _AddCustomerBottomSheetState();
// }
//
// class _AddCustomerBottomSheetState extends State<AddCustomerBottomSheet> {
//   List<Contact> contacts = [];
//   bool isLoading = true;
//   String searchText = '';
//
//   @override
//   void initState() {
//     super.initState();
//     getContactPermission();
//   }
//
//   void getContactPermission() async {
//     // Request permissions and fetch contacts if granted
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
//     // Fetch contacts with properties like phone numbers
//     List<Contact> fetchedContacts = await FlutterContacts.getContacts(
//       withProperties: true,
//     );
//
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
//         return Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               const SizedBox(height: 10),
//               Text(
//                 'Add Customer',
//                 style: const TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               const SizedBox(height: 10),
//               TextField(
//                 decoration: InputDecoration(
//                   hintText: "Search customer name...",
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(8.0),
//                   ),
//                 ),
//                 onChanged: (value) {
//                   setState(() {
//                     searchText = value;
//                   });
//                 },
//               ),
//               const SizedBox(height: 16),
//               isLoading
//                   ? const Center(child: CircularProgressIndicator())
//                   : Expanded(
//                 child: ListView.builder(
//                   shrinkWrap: true,
//                   itemCount: contacts.length,
//                   itemBuilder: (context, index) {
//                     final contact = contacts[index];
//                     final name = contact.displayName ?? 'No Name';
//                     final phoneNumber = contact.phones.isNotEmpty
//                         ? contact.phones.first.number
//                         : 'No Number';
//
//                     return ListTile(
//                       leading: CircleAvatar(
//                         child: Text(name.isNotEmpty ? name[0] : '?'),
//                       ),
//                       title: Text(name),
//                       subtitle: Text(phoneNumber),
//                       onTap: () {
//                         // Handle customer selection
//                       },
//                     );
//                   },
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Contacts'),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () {
//             showAddCustomerBottomSheet(context);
//           },
//           child: const Text("Add Customer"),
//         ),
//       ),
//     );
//   }
// }
//**************








//
// import 'package:flutter/material.dart';
//
// class NewPage extends StatefulWidget {
//   @override
//   _NewPageState createState() => _NewPageState();
// }
//
// class _NewPageState extends State<NewPage> {
//   TextEditingController searchcontroller = TextEditingController();
//   // final ScreenHeight = MediaQuery.of(context).size.height;
//   // final ScreenWidth = MediaQuery.of(context).size.width;
//   @override
//   void initState() {
//     super.initState();
//     // Show BottomSheet when the page is fully built
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       _showBottomSheet(context);
//     });
//   }
//
//   void _showBottomSheet(BuildContext context) {
//     showModalBottomSheet(
//       context: context,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
//       ),
//       builder: (context) {
//         return Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Row(
//                 children: [
//                   Container(
//                     height: 40,
//                     width: 320,
//                     // height: ScreenHeight * 0.05, // Responsive height
//                     // width: ScreenWidth * 0.5, // 50% of screen width
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(6),
//                       border: Border.all(
//                         width: 0.4,
//                         color: Colors.black,
//                       ),
//                     ),
//                     child: Padding(
//                       padding: const EdgeInsets.only(left: 8.0, right: 8.0),
//                       child: Row(
//                         children: [
//                           Icon(Icons.search),
//                           SizedBox(
//                             width: 5,
//                           ),
//                           Expanded(
//                             child: TextFormField(
//                               controller: searchcontroller,
//                               decoration: InputDecoration(
//                                 hintText: 'Search',
//                                 border:
//                                 InputBorder.none, // Remove the default border
//                               ),
//                               style:
//                               TextStyle(fontSize: 14), // Set the text style
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//
//               SizedBox(height: 10),
//               Row(
//                 children: [
//                   Icon(Icons.add_circle_outline_outlined, color: Colors.blue,),
// SizedBox(width: 5,),              Text(
//                     "Add Customer",
//                     style: TextStyle(fontSize: 16, color: Colors.blue),
//                   ),
//                   Spacer(),
//                   Icon(Icons.arrow_forward_ios_rounded, color: Colors.blue,),
//
//                 ],
//               ),
//               SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: () {
//                   Navigator.pop(context); // Close the bottom sheet
//                 },
//                 child: Text("Close"),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//
//     return Scaffold(
//       body: Center(
//         child: Text("New Page Content"),
//       ),
//     );
//   }
// }
//
