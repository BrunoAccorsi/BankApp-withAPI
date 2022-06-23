import 'package:bytebank/models/transaction.dart';
import 'package:bytebank/utils/helper_widget.dart';
import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';

class ListItem extends StatelessWidget {
  ListItem({
    required this.content,
    required this.icon,
  });

  String icon;
  final dynamic content;

  @override
  Widget build(BuildContext context) {
    ColorScheme theme = Theme.of(context).colorScheme;
    TextTheme _textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: theme.onBackground,
              ),
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Iconify(
                  icon,
                ),
              )),
          addHorizontalSpace(11),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                content['title'],
                style: _textTheme.bodyText1?.copyWith(
                    color: theme.onPrimaryContainer,
                    fontWeight: FontWeight.w600),
              ),
              Text(
                content['subtitle'],
                style: _textTheme.bodyText1
                    ?.copyWith(color: theme.onPrimaryContainer),
              ),
            ],
          ),
          Spacer(),
          Column(
            children: [
              Text(
                'may 24',
                style: _textTheme.bodyText1?.copyWith(
                    color: theme.outline, fontWeight: FontWeight.w600),
              ),
              Text(
                '\$ ${content['value']}',
                style: _textTheme.bodyText1?.copyWith(
                    color: theme.onPrimaryContainer,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
