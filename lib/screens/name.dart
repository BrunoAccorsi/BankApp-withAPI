import 'package:bytebank/models/name_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NameContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return NameView();
  }
}

class NameView extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    _nameController.text = context.watch<NameCubit>().state;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Change Name'),
        ),
        body: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Desired Name',
              ),
              style: const TextStyle(
                fontSize: 24,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 16),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    final name = _nameController.text;
                    context.read<NameCubit>().change(name);
                    Navigator.pop(context);
                  },
                  child: Text('Change'),
                ),
              ),
            )
          ],
        ));
  }
}
