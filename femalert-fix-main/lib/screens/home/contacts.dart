import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:shared_preferences/shared_preferences.dart';

class contacts extends StatefulWidget {
  @override
  _ContactsPageState createState() => _ContactsPageState();
}

class _ContactsPageState extends State<contacts> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();

  List<Map<String, String>> _contacts = [];
  bool _showAddFields = false;

  @override
  void initState() {
    super.initState();
    _loadContacts();
  }

  Future<void> _loadContacts() async {
    final prefs = await SharedPreferences.getInstance();
    final contactsJson = prefs.getStringList('contacts');
    if (contactsJson != null) {
      setState(() {
        _contacts = contactsJson
            .map<Map<String, String>>((contactJson) =>
                Map<String, String>.from(jsonDecode(contactJson)))
            .toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contacts'),
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
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: () {
                            _editContact(index);
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            _deleteContact(index);
                          },
                        ),
                      ],
                    ),
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

  Future<void> _addContact() async {
    final name = _nameController.text.trim();
    final number = _numberController.text.trim();

    if (name.isNotEmpty && number.isNotEmpty) {
      final newContact = {'name': name, 'number': number};
      setState(() {
        _contacts.add(newContact);
        _showAddFields = false;
      });

      final prefs = await SharedPreferences.getInstance();
      final contactsJson = prefs.getStringList('contacts') ?? [];
      contactsJson.add(jsonEncode(newContact));
      await prefs.setStringList('contacts', contactsJson);

      _nameController.clear();
      _numberController.clear();
    }
  }

  Future<void> _editContact(int index) async {
  final name = _contacts[index]['name'];
  final number = _contacts[index]['number'];

  _nameController.text = name!; // Update the controller with the current name
  _numberController.text = number!; // Update the controller with the current number

  final result = await showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text('Edit Contact'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _nameController,
            decoration: InputDecoration(labelText: 'Name'),
          ),
          TextField(
            controller: _numberController,
            decoration: InputDecoration(labelText: 'Number'),
            keyboardType: TextInputType.phone,
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            final editedContact = {
              'name': _nameController.text.trim(),
              'number': _numberController.text.trim(),
            };
            setState(() {
              _contacts[index] = editedContact;
            });
            Navigator.pop(context, true);
          },
          child: Text('Save'),
        ),
      ],
    ),
  );

  if (result == true) {
    final prefs = await SharedPreferences.getInstance();
    final contactsJson = _contacts.map((contact) => jsonEncode(contact)).toList();
    await prefs.setStringList('contacts', contactsJson);
  }
}


  Future<void> _deleteContact(int index) async {
    setState(() {
      _contacts.removeAt(index);
    });

    final prefs = await SharedPreferences.getInstance();
    final contactsJson = _contacts.map((contact) => jsonEncode(contact)).toList();
    await prefs.setStringList('contacts', contactsJson);
  }

  void _callNumber(String number) async {
    await FlutterPhoneDirectCaller.callNumber(number);
  }
}
