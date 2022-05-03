import 'package:json_annotation/json_annotation.dart';

part 'contact.g.dart';

@JsonSerializable()
class Contact {
  final String name;
  final int accountNumber;

  Contact(this.name, this.accountNumber);

  @override
  String toString() {
    return 'Contact{name: $name, accountNumber: $accountNumber}';
  }

  factory Contact.fromJson(Map<String, dynamic> json) =>
      _$ContactFromJson(json);

  Map<String, dynamic> toJson() => _$ContactToJson(this);
}
