import 'package:flutter/material.dart';

class ServicesScreen extends StatefulWidget {
  const ServicesScreen({super.key});

  @override
  State<ServicesScreen> createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Column(
          children: [
            Center(
                child: Image.asset(
                  'assets/services.jpg',
                  height: 250,
                  alignment: Alignment.center,
                )),
            Text(
              'Add Services And Get Started',
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
                      child: Image.asset('assets/stock.jpeg'),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Manage services and prices',
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
                      child: Image.asset('assets/save.jpg'),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Save SAC And GST details',
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
                      child: Image.asset('assets/bill.jpg'),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Track sales and create bills',
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
        label: const Row(
          children: [
            Icon(Icons.add_box,color: Colors.white,),
            SizedBox(width: 8,),
            Text('ADD SERVICES',style: TextStyle(color: Colors.white),)
          ],
        ),
        backgroundColor: Colors.purple[800],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat, // Default location (right bottom)
    );
  }
}