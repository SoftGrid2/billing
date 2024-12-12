import 'package:flutter/material.dart';

class MonthlyPurchaseReport extends StatefulWidget {
  @override
  _MonthlyPurchaseReportState createState() => _MonthlyPurchaseReportState();
}

class _MonthlyPurchaseReportState extends State<MonthlyPurchaseReport> {
  DateTime _startDate = DateTime.now();
  DateTime _endDate = DateTime.now();

  // Function to show DatePicker and update the selected date
  Future<void> _selectDate(BuildContext context, bool isStartDate) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: isStartDate ? _startDate : _endDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2101),
    ) ?? DateTime.now();

    setState(() {
      if (isStartDate) {
        _startDate = picked;
      } else {
        _endDate = picked;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Purchase Report',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue.shade900,
      ),
      body: Column(
        children: [
          // Row with cards for dropdown, start date, and end date
          Padding(
            padding: const EdgeInsets.all(1.0),
            child: Row(
              children: [
                // Dropdown Card
                Flexible(
                  flex: 1,
                  child: Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: DropdownButton<String>(
                        value: 'This Month',
                        items: [
                          'This Year',
                          'Last Quarter',
                          'This Month',
                          'Last Month',
                          'This Week',
                          'Yesterday',
                          'Today',
                          'Custom'
                        ].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (value) {},
                      ),
                    ),
                  ),
                ),

                // Start Date Card
                Flexible(
                  flex: 1,
                  child: Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: GestureDetector(
                        onTap: () => _selectDate(context, true),
                        child: _DateSelector(label: 'Start Date', date: _startDate),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 2), // Space between cards

                // End Date Card
                Flexible(
                  flex: 1,
                  child: Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: GestureDetector(
                        onTap: () => _selectDate(context, false),
                        child: _DateSelector(label: 'End Date', date: _endDate),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Purchase summary in a Card
          Card(
            margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _SummaryTile(label: 'TRANSACTIONS', value: '0'),
                  _SummaryTile(label: 'NET PURCHASE', value: '₹ 0'),
                  _SummaryTile(label: 'UNPAID BALANCE', value: '₹ 0'),
                ],
              ),
            ),
          ),

          // Empty state illustration
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.inbox,
                  size: 100,
                  color: Colors.grey[400],
                ),
                SizedBox(height: 16),
                Text(
                  'No purchases available to generate reports',
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _DateSelector extends StatelessWidget {
  final String label;
  final DateTime date;

  const _DateSelector({required this.label, required this.date});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontSize: 12, color: Colors.grey)),
        Row(
          children: [
            Icon(Icons.calendar_today, size: 16, color: Colors.grey),
            SizedBox(width: 4),
            Text(
              '${date.day}-${date.month}-${date.year}',
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
      ],
    );
  }
}

class _SummaryTile extends StatelessWidget {
  final String label;
  final String value;

  const _SummaryTile({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(label, style: TextStyle(fontSize: 12, color: Colors.black)),
        SizedBox(height: 5,),
        Text(value, style: TextStyle(fontSize: 16, color:Colors.green,fontWeight: FontWeight.bold)),
      ],
    );
  }
}

void main() {
  runApp(
    MaterialApp(
      home: MonthlyPurchaseReport(),
      debugShowCheckedModeBanner: false, // This line removes the debug banner
    ),
  );
}