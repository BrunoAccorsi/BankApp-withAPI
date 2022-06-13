import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';

class MenuButton extends StatelessWidget {
  const MenuButton({
    Key? key,
    required this.icon,
    required this.text,
    required this.onClick,
  }) : super(key: key);
  final String icon;
  final String text;
  final onClick;

  @override
  Widget build(BuildContext context) {
    ColorScheme theme = Theme.of(context).colorScheme;
    TextTheme _textTheme = Theme.of(context).textTheme;
    return ElevatedButton(
      onPressed: onClick,
      child: SizedBox(
        width: 96,
        height: 96,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 16.0, bottom: 8.0),
              child: Iconify(
                icon,
                color: theme.onPrimary,
              ),
            ),
            Text(
              text,
              textAlign: TextAlign.center,
              style: _textTheme.button,
            ),
          ],
        ),
      ),
      style: ButtonStyle(
        backgroundColor:
            MaterialStateProperty.all<Color>(theme.primaryContainer),
        minimumSize: MaterialStateProperty.all<Size>(Size.zero),
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.zero),
      ),
    );
  }
}
