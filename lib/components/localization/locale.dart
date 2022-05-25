import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LocalizationContainer extends StatelessWidget {
  final Widget child;

  LocalizationContainer({required Widget this.child});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CurrentLocateCubit>(
      create: (context) => CurrentLocateCubit(),
      child: child,
    );
  }
}

class CurrentLocateCubit extends Cubit<String> {
  CurrentLocateCubit() : super('en');
}
