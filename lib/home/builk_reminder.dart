// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:provider/provider.dart';
// import 'package:sgibooks/provider/cal_provider.dart';
//
// class BulkReminderScreen extends StatefulWidget {
//   final String? Id;
//   final String? billId;
//   final String? name;
//   final String? comp;
//   BulkReminderScreen({
//     super.key,
//     this.comp,
//     this.Id,
//     this.billId,
//     this.name,
//   });
//
//   @override
//   _BulkReminderScreenState createState() => _BulkReminderScreenState();
// }
//
// class _BulkReminderScreenState extends State<BulkReminderScreen> {
//   int _selectedChipIndex = 0; // Tracks the selected chip index
//
//   List<String> number = ['hello','hello','hello','hello','hello','hello',];
//   @override
//   Widget build(BuildContext context) {
//     final List<String> chipLabels = [
//       'All'.tr,
//       'Due Today'.tr,
//       'Upcoming'.tr,
//       'No Due'.tr,
//       'Filter'.tr
//     ];
//     final double screenWidth = MediaQuery.of(context).size.width;
//     final double screenHeight = MediaQuery.of(context).size.height;
//     return Consumer<CalculatorProvider>(builder: (context, provider, _) {
//       return Scaffold(
//         appBar: AppBar(
//           title: Text('Bulk Reminder'.tr),
//           automaticallyImplyLeading: false,
//           backgroundColor: Color(0xFF1CC1AB),
//           actions: [
//             IconButton(
//               icon: const Icon(Icons.refresh),
//               onPressed: () {},
//             ),
//             Stack(
//               alignment: Alignment.topRight,
//               children: [
//                 IconButton(
//                   icon: const Icon(Icons.monetization_on),
//                   onPressed: () {},
//                 ),
//                 Positioned(
//                   right: 8,
//                   top: 8,
//                   child: CircleAvatar(
//                     radius: 8,
//                     backgroundColor: Colors.red,
//                     child: const Text(
//                       '8',
//                       style: TextStyle(color: Colors.white, fontSize: 12),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//         body: LayoutBuilder(
//           builder: (context, constraints) {
//             final bool isWide = constraints.maxWidth > 600;
//             return Column(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: TextField(
//                     decoration: InputDecoration(
//                       hintText: 'Search Customers'.tr,
//                       prefixIcon: const Icon(Icons.search),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(8.0),
//                       ),
//                     ),
//                   ),
//                 ),
//                 // Chips replacing TabBar
//                 SingleChildScrollView(
//                   scrollDirection: Axis.horizontal,
//                   child: Row(
//                     children: List.generate(chipLabels.length, (index) {
//                       return Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 5.0),
//                         child: ChoiceChip(
//                           label: Row(
//                             mainAxisSize: MainAxisSize.min,
//                             children: [
//                               if (chipLabels[index] == 'Filter'.tr)
//                                 Icon(Icons.filter_alt_outlined,
//                                     size: isWide ? 20 : 15),
//                               if (chipLabels[index] == 'Filter'.tr)
//                                 const SizedBox(width: 5),
//                               Text(chipLabels[index]),
//                             ],
//                           ),
//                           selected: _selectedChipIndex == index,
//                           // selectedColor: Colors.blue[100],
//                           selectedColor: Color(0xFF1CC1AB),
//                           onSelected: (selected) {
//                             setState(() {
//                               _selectedChipIndex = index;
//                             });
//                           },
//                         ),
//                       );
//                     }),
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.symmetric(vertical: 8.0),
//                   child: Text(
//                     'SELECT PARTY'.tr,
//                     style: TextStyle(
//                         color: Colors.grey, fontWeight: FontWeight.bold),
//                   ),
//                 ),
//
//                 SizedBox(height: 10,),
//                 Expanded(
//                   child: ListView.builder(
//                       itemCount: number.length,
//                       itemBuilder: (context, index) {
//                         return Card(
//                           child: ListTile(
//                             title: Text(number[index].toString()),
//                             subtitle: Text(number[index].toString()),
//                             leading: CircleAvatar(
//                               backgroundColor:Color(0xFF1CC1AB),
//                               radius: 25,
//                               child: Icon(Icons.person),
//                             ),
//                             trailing: Container(
//                               height: 40,
//                               width: 90,
//                               decoration: BoxDecoration(
//                                 color: Colors.blueGrey,
//                                   borderRadius: BorderRadius.circular(10)
//                               ),
//                               child: Center(
//                                 child: Text('Comp'),
//                               ),
//                             ),
//                           ),
//                         );
//                       }),
//                 )
//               ],
//             );
//           },
//         ),
//       );
//     });
//   }
// }
import 'package:billing/home/home_page.dart';
import 'package:billing/provider/cal_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class BulkReminderScreen extends StatefulWidget {
  final String? Id;
  final String? billId;
  final String? name;
  final String? comp;

  BulkReminderScreen({
    super.key,
    this.comp,
    this.Id,
    this.billId,
    this.name,
  });

  @override
  _BulkReminderScreenState createState() => _BulkReminderScreenState();
}

class _BulkReminderScreenState extends State<BulkReminderScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final TextEditingController _searchController = TextEditingController();
  String searchText = '';
  late Stream<QuerySnapshot> _stream;
  bool _isLoading = true;
  List<String> number = ['hello', 'hello', 'hello', 'hello', 'hello', 'hello', 'hello', 'hello', 'hello'];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this); // Corrected line
    _fetchUserEmail();
    _stream = FirebaseFirestore.instance.collection('Book').orderBy('name').snapshots();
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

  int _selectedChipIndex = 0; // Tracks the selected chip index

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
    final List<String> chipLabels = [
      'All'.tr,
      'Due Today'.tr,
      'Upcoming'.tr,
      'No Due'.tr,
      'Filter'.tr
    ];
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Consumer<CalculatorProvider>(builder: (context, provider, _) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Bulk Reminder'.tr,style: TextStyle(color: Colors.white),),
          automaticallyImplyLeading: false,
          backgroundColor: Color(0xFF1CC1AB),
          actions: [
            IconButton(
              icon: const Icon(Icons.refresh,color: Colors.white,),
              onPressed: () {},
            ),
            Stack(
              alignment: Alignment.topRight,
              children: [
                IconButton(
                  icon: const Icon(Icons.monetization_on,color: Colors.white,),
                  onPressed: () {},
                ),
                Positioned(
                  right: 8,
                  top: 8,
                  child: CircleAvatar(
                    radius: 8,
                    backgroundColor: Colors.red,
                    child: const Text(
                      '8',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        body: LayoutBuilder(
          builder: (context, constraints) {
            final bool isWide = constraints.maxWidth > 600;
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Search Customers'.tr,
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0)
                    ),
                  ),
                ),
                // Chips replacing TabBar
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
                                Icon(Icons.filter_alt_outlined,
                                    size: isWide ? 20 : 15),
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
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    'SELECT PARTY'.tr,
                    style: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 10,),
                Expanded(
                  child: IndexedStack(
                    index: _selectedChipIndex,
                    children: [
                      StreamBuilder<QuerySnapshot>(
                          stream: _stream,
                          builder: (BuildContext context, AsyncSnapshot snapshot){
                            if (snapshot.hasError) {
                              return Center(
                                child:
                                Text('Some error occurred: ${snapshot.error}'.tr),
                              );
                            }
                            if(snapshot.hasData){
                              QuerySnapshot querySnapshot = snapshot.data;
                              List<QueryDocumentSnapshot> document = querySnapshot.docs;
                              List<Map> items = document.map((e)=> e.data()as Map).toList();
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
                                  itemCount: number.length,
                                  itemBuilder: (context, index) {
                                    return Card(
                                      child: ListTile(
                                        title: Text(number[index].toString()),
                                        subtitle: Text(number[index].toString()),
                                        leading: CircleAvatar(
                                          backgroundColor: Color(0xFF1CC1AB),
                                          radius: 25,
                                          child: Icon(Icons.person),
                                        ),
                                        trailing: Container(
                                          height: 40,
                                          width: 90,
                                          decoration: BoxDecoration(
                                              color: Colors.blueGrey,
                                              borderRadius: BorderRadius.circular(10)
                                          ),
                                          child: Center(
                                            child: Text('Comp'),
                                          ),
                                        ),
                                      ),
                                    );
                                  }

                                  );
                            }
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }
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
                )
              ],
            );
          },
        ),
      );
    });
  }
}