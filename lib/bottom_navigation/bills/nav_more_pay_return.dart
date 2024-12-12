

import 'package:flutter/material.dart';

import 'my_business/sales_report.dart';

class Bills extends StatefulWidget {
  @override
  _BillsState createState() => _BillsState();
}

class _BillsState extends State<Bills> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  // bool _isSwitchOn = false; // State for the switch


  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('My Business', style: TextStyle(color: Colors.white)),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(200.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 4.0, horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(child: buildCard(
                        "₹ 0", "Monthly Sales", Icons.arrow_forward_ios)),
                    Expanded(child: buildCard(
                        "₹ 0", "Monthly Purchases", Icons.arrow_forward_ios)),
                    ElevatedButton(
                      onPressed: () {},
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "View Reports",
                            style: TextStyle(color: Colors.blue.shade900,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(width: 8),
                          Icon(Icons.arrow_forward_ios, size: 17),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 4.0),
                child: Card(
                  elevation: 4.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        buildInnerCard("₹ 0", "Today's IN"),
                        buildInnerCard("₹ 0", "Today's OUT"),
                        TextButton(
                          onPressed: () {},
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "CASHBOOK",
                                style: TextStyle(
                                  color: Colors.blue.shade900,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                              Icon(Icons.arrow_forward_ios, size: 18),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                color: Colors.blue[900],
                child: TabBar(
                  controller: _tabController,
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.white70,
                  dividerColor: Colors.blue.shade200,
                  indicatorColor: Colors.white,
                  tabs: [
                    Tab(text: "Sale"),
                    Tab(text: "Purchase"),
                    Tab(text: "Expense"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                buildTabContent("Sales Content"),
                buildTabContent("Purchase Content"),
                buildTabContent("Expense Content"),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: _getFloatingActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  // Reusable Card widget for Monthly Sales, Purchases, Today's IN, OUT, etc.
  Widget buildCard(String amount, String title, IconData icon) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      child: Container(
        padding: EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  amount,
                  style: TextStyle(fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.green),
                ),
                SizedBox(width: 8),
                Icon(icon, size: 18),
              ],
            ),
            SizedBox(height: 5),
            Text(
              title,
              style: TextStyle(fontSize: 12),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  // Inner card for Today's IN and OUT within the same card
  Widget buildInnerCard(String amount, String title) {
    return Column(
      children: [
        Text(
          amount,
          style: TextStyle(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.green),
        ),
        SizedBox(height: 5),
        Text(
            title, style: TextStyle(fontSize: 12), textAlign: TextAlign.center),
      ],
    );
  }

  // Method to build content inside each tab
  Widget buildTabContent(String content) {
    return Center(
      child: Text(
        content,
        style: TextStyle(fontSize: 15),
      ),
    );
  }

  // Method to get floating action button based on selected tab
  Widget _getFloatingActionButton() {
    // Sales Tab - Show two FABs: "Add Bill" and "Show Bottom Sheet"
    if (_tabController.index == 0) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // "Add Bill" button
            FloatingActionButton.extended(
              onPressed: () {
                // Navigate to the SaleBillPage
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MonthlySalesReport()),
                );
              },
              icon: Icon(Icons.add_chart_sharp, color: Colors.white),
              label: Text(
                "Add Bill",
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
              backgroundColor: Colors.blue.shade900,
            ),
            SizedBox(width: 80), // Space between buttons

            // "Show Bottom Sheet" button with label
            FloatingActionButton.extended(
              onPressed: () {
                // Show bottom sheet
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return Container(
                      padding: EdgeInsets.all(16.0),
                      height: 350, // Increased height to accommodate additional content
                      color: Colors.white,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          // Existing 3 sections
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              // Section 1
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CircleAvatar(
                                    backgroundColor: Colors.green.shade100,
                                    radius: 25,
                                    child: Icon(
                                      Icons.edit_document,
                                      size: 30,
                                      color: Colors.green,
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    "Sale",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                              // Section 2
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CircleAvatar(
                                    backgroundColor: Colors.orange.shade100,
                                    radius: 25,
                                    child: Icon(
                                      Icons.assignment_return_outlined,
                                      size: 30,
                                      color: Colors.orangeAccent,
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    "Sale Return",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                              // Section 3
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CircleAvatar(
                                    backgroundColor: Colors.green.shade100,
                                    radius: 25,
                                    child: Icon(
                                      Icons.monetization_on_outlined,
                                      size: 30,
                                      color: Colors.green,
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    "Payment In",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 16), // Spacing between the rows and the new section

                          // New text sections inside rectangular containers
                          Column(
                            children: [
                              // First new text in a container
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black),
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.grey.shade200,
                                ),
                                child: TextField(
                                  decoration: InputDecoration(
                                    hintText: '  Sales, Payment In, Sale Return',
                                    hintStyle: TextStyle(
                                      fontSize: 13.0, // Adjust this size to your liking
                                      color: Colors.black, // Adjust the hint text color if needed
                                    ),
                                    suffixIcon: Icon(Icons.arrow_forward_ios),
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(vertical: 10.0),
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),

                              // Second new text in a container
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black),
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.grey.shade200,
                                ),
                                child: TextField(
                                  decoration: InputDecoration(
                                    hintText: '   Start Creating GST Bills',
                                    hintStyle: TextStyle(
                                      fontSize: 13.0, // Adjust this size to your liking
                                      color: Colors.black, // Adjust the hint text color if needed
                                    ),

                                    // suffixIcon: Icon(Icons.s),
                                    // border: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(vertical: 10.0),
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                              // Arrow icon to indicate more

                            ],
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
              label: Text(
                "MORE ( Payment & Return )",
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              backgroundColor: Colors.blue.shade900,
            ),


          ],
        ),
      );
    }

    // Default: No floating button shown
    return Container();
  }
}


