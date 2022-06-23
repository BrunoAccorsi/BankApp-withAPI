import 'package:bytebank/database/contact_dao.dart';
import 'package:bytebank/screens/contactForm.dart';
import 'package:bytebank/screens/transaction_form.dart';
import 'package:bytebank/utils/helper_widget.dart';
import 'package:bytebank/widgets/elevated_buttom_icon.dart';
import 'package:bytebank/widgets/main_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ant_design.dart';
import 'package:iconify_flutter/icons/bi.dart';
import 'package:iconify_flutter/icons/eva.dart';

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
    ColorScheme theme = Theme.of(context).colorScheme;
    TextTheme _textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('New Transaction'),
      ),
      body: MainContainer(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Select an Account',
                style: _textTheme.headline2!.copyWith(color: theme.onPrimary),
              ),
              Row(
                children: [
                  Flexible(
                    child: TextField(
                      decoration: InputDecoration(
                        suffixIcon: Iconify(
                          Eva.search_fill,
                          color: theme.outline,
                        ),
                        suffixIconConstraints:
                            const BoxConstraints(minHeight: 32, minWidth: 32),
                      ),
                    ),
                  ),
                  addHorizontalSpace(19),
                  ElevatedButtomIcon(
                    icon: Eva.plus_outline,
                    text: 'Add',
                    onClick: () async {
                      await Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const ContactForm(),
                        ),
                      );

                      updateList(context);
                    },
                  ),
                ],
              ),
              BlocBuilder<ContactsListCubit, ContactsListState>(
                builder: (context, state) {
                  if (state is InitContactsListState ||
                      state is LoadingContactsListState) {
                    return const Progress();
                  }
                  if (state is LoadedContactsListState) {
                    final List<Contact> contacts = state._contacts;
                    return ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
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
            ],
          ),
        ),
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
    ColorScheme theme = Theme.of(context).colorScheme;
    TextTheme _textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: InkWell(
        onTap: onClick,
        child: Row(
          children: [
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(16)),
                color: theme.secondary,
              ),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Iconify(
                  Bi.person_fill,
                  color: theme.primary,
                ),
              ),
            ),
            addHorizontalSpace(11),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  contact.name,
                  style: _textTheme.headline5,
                ),
                addVerticalSpace(4),
                Text(
                  'Account Number: ${contact.accountNumber.toString()}',
                  style: _textTheme.headline6,
                ),
              ],
            ),
            Spacer(),
            Iconify(
              AntDesign.star_filled,
              color: theme.outline,
            ),
          ],
        ),
      ),
    );
  }
}
