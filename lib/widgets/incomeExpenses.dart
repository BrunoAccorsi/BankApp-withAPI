import 'package:bytebank/utils/helper_widget.dart';
import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/eva.dart';

class IncomeExpenses extends StatelessWidget {
  final type;
  final String value;

  const IncomeExpenses({Key? key, required this.type, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ColorScheme theme = Theme.of(context).colorScheme;
    TextTheme _textTheme = Theme.of(context).textTheme;
    bool isIncome = type == 'Income';

    return Column(
      children: [
        Row(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                color: isIncome ? theme.tertiaryContainer : theme.tertiary,
              ),
              height: 48,
              width: 48,
              child: Iconify(
                isIncome ? Eva.arrow_upward_fill : Eva.arrow_downward_fill,
                color: isIncome ? theme.onInverseSurface : theme.onTertiary,
              ),
            ),
            addHorizontalSpace(8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(isIncome ? 'Income' : 'Expenses',
                    style: _textTheme.bodyText1),
                addVerticalSpace(4),
                Text('\$ 5.000', style: _textTheme.headline2),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
