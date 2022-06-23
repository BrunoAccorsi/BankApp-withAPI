import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';

class ElevatedButtomIcon extends StatelessWidget {
  String icon;
  String text;
  MaterialStateProperty<Color?>? color;
  double? width;
  double? height;
  final onClick;

  ElevatedButtomIcon({
    required this.icon,
    required this.text,
    required this.onClick,
    this.color,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    TextTheme _textTheme = Theme.of(context).textTheme;
    ColorScheme theme = Theme.of(context).colorScheme;

    return ElevatedButton.icon(
      style: ButtonStyle(
        minimumSize:
            MaterialStateProperty.all<Size>(Size(width ?? 0, height ?? 0)),
        backgroundColor: color ??
            MaterialStateProperty.all<Color>(theme.onTertiaryContainer),
      ),
      onPressed: onClick,
      icon: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Iconify(
          icon,
          color: theme.onPrimary,
          size: 18,
        ),
      ),
      label: Text(
        text,
        style: _textTheme.button,
      ),
    );
  }
}
