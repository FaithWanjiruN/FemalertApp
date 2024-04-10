import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class contacts extends StatefulWidget {
  @override
  _ContactsPageState createState() => _ContactsPageState();
}

class _ContactsPageState extends State<contacts> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _numberController = TextEditingController();

  List<Map<String, String>> _contacts = [];
  bool _showAddFields = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contacts'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _showAddFields = true;
                });
              },
              child: Text('Add Contacts'),
            ),
            if (_showAddFields) ...[
              Text(
                'Add Contact:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              TextField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Name'),
              ),
              TextField(
                controller: _numberController,
                decoration: InputDecoration(labelText: 'Number'),
                keyboardType: TextInputType.phone,
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  _addContact();
                },
                child: Text('Add'),
              ),
              SizedBox(height: 20),
            ],
            Text(
              'Contacts List:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _contacts.length,
                itemBuilder: (context, index) {
                  final contact = _contacts[index];
                  return ListTile(
                    title: Text(contact['name']!),
                    subtitle: Text(contact['number']!),
                    onTap: () {
                      _callNumber(contact['number']!);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _addContact() {
    final name = _nameController.text.trim();
    final number = _numberController.text.trim();

    if (name.isNotEmpty && number.isNotEmpty) {
      setState(() {
        _contacts.add({'name': name, 'number': number});
        _showAddFields = false;
      });
      _nameController.clear();
      _numberController.clear();
    }
  }

  void _callNumber(String number) async {
    await FlutterPhoneDirectCaller.callNumber(number);
  }
}
