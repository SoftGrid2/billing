import 'package:billing/bottom_navigation/items/productscreen.dart';
import 'package:billing/bottom_navigation/items/servicescrenn.dart';
import 'package:flutter/material.dart';

class ItemsScreen extends StatefulWidget {
  const ItemsScreen({super.key});

  @override
  State<ItemsScreen> createState() => _ItemsScreenState();
}

class _ItemsScreenState extends State<ItemsScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this); // 2 tabs: Products & Services
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
        title: Column(
          children: [
            const Row(
              children: [
                Icon(Icons.collections_bookmark_sharp, color: Colors.white70, size: 20),
                SizedBox(width: 10),
                Text('My Business', style: TextStyle(color: Colors.white70, fontSize: 20)),
                SizedBox(width: 8),
                Icon(Icons.edit, color: Colors.white70, size: 20),
              ],
            ),
          ],
        ),
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.yellow,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white70,
          tabs: const [
            Tab(text: 'PRODUCTS'),
            Tab(text: 'SERVICES'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          ProductScreen(), // Content for the PRODUCTS tab
          ServicesScreen(), // Content for the SERVICES tab
        ],
      ),
    );
  }
}
