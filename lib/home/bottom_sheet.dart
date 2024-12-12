
import 'package:billing/view/add_party.dart';
import 'package:billing/view/customer_history.dart';
import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:get/get.dart';

class AddCustomerBottomSheet extends StatefulWidget {
  final List<Contact> contacts;
  final bool isLoading;
  final String? name;
  final String? flat;
  final String? comp;
   // final String? date;
  final String? Id;
  final String? billId;
  final Function(String) onContactSelected;

  const AddCustomerBottomSheet({
    Key? key,
    required this.contacts,
    required this.isLoading,
    required this.name,
    required this.flat,
     required this.comp,
     // required this.date,
    required this.Id,
    required this.billId,
    required this.onContactSelected,
  }) : super(key: key);

  @override
  _AddCustomerBottomSheetState createState() => _AddCustomerBottomSheetState();
}

class _AddCustomerBottomSheetState extends State<AddCustomerBottomSheet> {
  final TextEditingController _searchController = TextEditingController();
  String searchText = '';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 10),
          TextField(
            controller: _searchController,
            decoration: InputDecoration(
              hintText: "Search customer name...".tr,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            onChanged: (value) {
              setState(() {
                searchText = value;
              });
            },
          ),
          const SizedBox(height: 16),
          GestureDetector(
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => AddPartyScreen()),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(Icons.add_circle_outline, size: 45, color: Color(0xFF1CC1AB)),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'Add Customer'.tr,
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF1CC1AB)),
                    ),
                  ),
                  Icon(Icons.arrow_forward_ios_rounded, color: Color(0xFF1CC1AB)),
                ],
              ),
            ),
          ),
          widget.isLoading
              ? const Center(child: CircularProgressIndicator())
              : Expanded(
            child: ListView.builder(
              itemCount: widget.contacts.length,
              itemBuilder: (context, index) {
                final contact = widget.contacts[index];
                final name = contact.displayName ?? 'No Name';
                final phoneNumber = contact.phones.isNotEmpty
                    ? contact.phones.first.number
                    : 'No Number';

                if (searchText.isNotEmpty &&
                    !name.toLowerCase().contains(searchText.toLowerCase())) {
                  return Container();
                }

                return ListTile(
                  leading: CircleAvatar(
                    child: Text(name.isNotEmpty ? name[0] : '?'),
                  ),
                  title: Text(name),
                  subtitle: Text(phoneNumber),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CustomerHistory(
                          name: contact.displayName ?? 'Unknown Name', // Pass selected contact's name
                          flat: '${widget.flat}',                     // Use widget's flat property
                           comp: '${widget.comp}',                     // Use widget's comp property
                           // date : '${widget.date}',
                          Id: '${widget.Id}',                         // Use widget's Id property
                          billId: '${widget.billId}',                 // Use widget's billId property
                        ),
                      ),
                    );

                    // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>AddPartyScreen(name: '${widget.name}', mobile: '${widget.mobile}',)));
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
