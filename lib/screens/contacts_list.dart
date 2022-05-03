import 'package:bytebank/database/contact_dao.dart';
import 'package:bytebank/screens/contactForm.dart';
import 'package:bytebank/screens/transaction_form.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

import '../models/contact.dart';
import '../widgets/progress.dart';

class ContactsList extends StatefulWidget {
  @override
  State<ContactsList> createState() => _ContactsListState();
}

class _ContactsListState extends State<ContactsList> {
  final ContactDao _dao = ContactDao();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transfer'),
      ),
      body: FutureBuilder<List<Contact>>(
        initialData: [],
        future: _dao.findAll(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              break;
            case ConnectionState.waiting:
              return Progress();
            case ConnectionState.active:
              break;
            case ConnectionState.done:
              final contacts = (snapshot.data as List);
              return ListView.builder(
                itemBuilder: (context, index) {
                  final contact = contacts[index];
                  return _ContactItem(
                    contact,
                    onClick: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: ((context) => TransactionForm(contact)),
                          ));
                    },
                  );
                },
                itemCount: contacts.length,
              );
          }
          return Text('Unknow error');
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(
                MaterialPageRoute(
                  builder: (context) => ContactForm(),
                ),
              )
              .then((value) => setState(
                    () {},
                  ));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class _ContactItem extends StatelessWidget {
  final Contact contact;
  final VoidCallback onClick;

  const _ContactItem(this.contact, {required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: onClick,
        title: Text(
          contact.name,
          style: TextStyle(fontSize: 24.0),
        ),
        subtitle: Text(
          contact.accountNumber.toString(),
          style: TextStyle(fontSize: 16.0),
        ),
      ),
    );
  }
}
