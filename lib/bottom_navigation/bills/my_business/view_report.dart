import 'package:flutter/material.dart';

class ViewReportsReport extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 7, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue.shade900,
          title: Text('View Reports',style: TextStyle(color: Colors.white)),
          bottom: TabBar(
            isScrollable: true,

            labelColor: Colors.white, // Color of the text when the tab is selected
            unselectedLabelColor: Colors.grey, // Color of the text when the tab is unselected
            tabs: [
              Tab(text: 'All'),
              Tab(text: 'Customer'),
              Tab(text: 'Bills'),
              Tab(text: 'GST'),
              Tab(text: 'Day-wise'),
              Tab(text: 'Inventory'),
              Tab(text: 'Supplier'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Center(child: Text('All Reports')),
            Center(child: Text('Customer Reports')),
            Center(child: Text('Bills Reports')),
            Center(child: Text('GST Reports')),
            Center(child: Text('Day-wise Reports')),
            Center(child: Text('Inventory')),
            Center(child: Text('Supplier')),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: ViewReportsReport(),
    debugShowCheckedModeBanner: false,
  ));
}