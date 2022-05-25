import 'package:bytebank/models/contact.dart';
import 'package:bytebank/models/transaction.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Should return the transaction value when its created', () {
    expect(Transaction('0', 200, Contact('Tester', 1000)).value, 200);
  });
  test(
      'Should fail if trying to create a Transaction with a value of zero or less',
      () {
    expect(() => Transaction('0', 0, Contact('Tester', 1000)),
        throwsAssertionError);
  });
}
