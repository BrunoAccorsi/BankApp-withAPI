import 'package:flutter/material.dart';

class MainContainer extends StatelessWidget {
  Widget child;

  MainContainer({required this.child});

  @override
  Widget build(BuildContext context) {
    ColorScheme theme = Theme.of(context).colorScheme;

    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(24), topRight: Radius.circular(24)),
        color: theme.secondaryContainer,
      ),
      width: double.infinity,
      child: child,
    );
  }
}
