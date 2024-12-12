import 'package:flutter/material.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Column(
          children: [
            Center(
                child: Image.asset(
                  'assets/product_list.png',
                  height: 250,
                  alignment: Alignment.center,
                )),
            Text(
              'Add items And Get Started',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
            )
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Card(
          margin: EdgeInsets.only(left: 5),
          color: Colors.white,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20.0, left: 5, right: 2),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 25,
                      child: Image.asset('assets/managestock.jpg'),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Manage stock in/out & get low stock alerts',
                      style: TextStyle(fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0, left: 5, right: 2),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 25,
                      child: Image.asset('assets/stockhistory.jpg'),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Manage stock in/out & get low stock alerts',
                      style: TextStyle(fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0, left: 5, right: 2),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 23,
                      child: Image.asset('assets/track.jpeg'),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Manage stock in/out & get low stock alerts',
                      style: TextStyle(fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              )
            ],
          ),
        )
      ]
      ),
      floatingActionButton:
      FloatingActionButton.extended(
        onPressed: (){

        },
        label: Row(
          children: [
            Icon(Icons.add_box,color: Colors.white,),
            SizedBox(width: 8,),
            Text('ADD PRODUCT',style: TextStyle(color: Colors.white),)
          ],
        ),
        backgroundColor: Colors.blue[900],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat, // Default location (right bottom)
    );
  }
}