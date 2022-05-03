import 'package:json_annotation/json_annotation.dart';
import 'contact.dart';

part 'transaction.g.dart';

@JsonSerializable()
class Transaction {
  final double value;
  final Contact contact;

  Transaction(
    this.value,
    this.contact,
  );

  @override
  String toString() {
    return 'Transaction{value: $value, contact: $contact}';
  }

  factory Transaction.fromJson(Map<String, dynamic> json) =>
      _$TransactionFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionToJson(this);
}
