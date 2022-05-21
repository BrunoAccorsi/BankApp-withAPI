import 'package:bytebank/database/contact_dao.dart';
import 'package:bytebank/screens/contactForm.dart';
import 'package:bytebank/screens/transaction_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/contact.dart';
import '../widgets/progress.dart';

@immutable
abstract class ContactsListState {
  const ContactsListState();
}

@immutable
class LoadingContactsListState extends ContactsListState {
  const LoadingContactsListState();
}

@immutable
class LoadedContactsListState extends ContactsListState {
  final List<Contact> _contacts;
  const LoadedContactsListState(this._contacts);
}

class InitContactsListState extends ContactsListState {
  const InitContactsListState();
}

@immutable
class FatalErrorContactsListState extends ContactsListState {
  const FatalErrorContactsListState();
}

class ContactsListCubit extends Cubit<ContactsListState> {
  ContactsListCubit() : super(InitContactsListState());

  void reload(ContactDao _dao) async {
    emit(LoadingContactsListState());
    final contacts = await _dao.findAll();

    emit(LoadedContactsListState(contacts));
  }
}

class ContactsListContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ContactDao _dao = ContactDao();

    return BlocProvider<ContactsListCubit>(
      create: (BuildContext context) {
        final cubit = ContactsListCubit();
        cubit.reload(_dao);
        return cubit;
      },
      child: ContactsList(_dao),
    );
  }
}

class ContactsList extends StatelessWidget {
  final ContactDao _dao;
  ContactsList(this._dao);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('To who?'),
      ),
      body: BlocBuilder<ContactsListCubit, ContactsListState>(
        builder: (context, state) {
          if (state is InitContactsListState ||
              state is LoadingContactsListState) {
            return const Progress();
          }
          if (state is LoadedContactsListState) {
            final List<Contact> contacts = state._contacts;
            return ListView.builder(
              itemBuilder: (context, index) {
                final contact = contacts[index];
                return _ContactItem(
                  contact,
                  onClick: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: ((context) =>
                              TransactionFormContainer(contact)),
                        ));
                  },
                );
              },
              itemCount: contacts.length,
            );
          }
          return const Text('Unknow error');
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const ContactForm(),
            ),
          );

          updateList(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void updateList(BuildContext context) {
    context.read<ContactsListCubit>().reload(_dao);
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
          style: TextStyle(
            fontSize: 24.0,
          ),
        ),
        subtitle: Text(
          contact.accountNumber.toString(),
          style: const TextStyle(fontSize: 16.0),
        ),
      ),
    );
  }
}
