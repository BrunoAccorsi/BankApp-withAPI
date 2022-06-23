import 'package:bytebank/utils/helper_widget.dart';
import 'package:flutter/material.dart';

class CreditCardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextTheme _textTheme = Theme.of(context).textTheme;

    return Align(
      alignment: Alignment.center,
      child: Container(
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.25),
                spreadRadius: 5,
                blurRadius: 8,
                offset: const Offset(0, 4), // changes position of shadow
              ),
            ],
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            gradient: const LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Color(0xFFB12540),
                Color(0xFF510413),
              ],
            )),
        width: 268,
        height: 166,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 46,
                    child: const Image(
                      image: const AssetImage('assets/card.png'),
                    ),
                  ),
                  const Spacer(),
                  Text('678',
                      style: _textTheme.bodyText1!
                          .copyWith(fontWeight: FontWeight.w600)),
                ],
              ),
              addVerticalSpace(76),
              Text('1234 9876 4321 6789',
                  style: _textTheme.headline2!
                      .copyWith(fontWeight: FontWeight.w400, letterSpacing: 2)),
              addVerticalSpace(10),
              Row(
                children: [
                  Text('Bruno Accorsi Bergoli',
                      style: _textTheme.bodyText1!
                          .copyWith(fontWeight: FontWeight.w600)),
                  const Spacer(),
                  Text('2027/04', style: _textTheme.bodyText1),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
