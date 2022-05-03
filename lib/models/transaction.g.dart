// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Transaction _$TransactionFromJson(Map<String, dynamic> json) => Transaction(
      (json['value'] as num).toDouble(),
      Contact.fromJson(json['contact'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TransactionToJson(Transaction instance) =>
    <String, dynamic>{
      'value': instance.value,
      'contact': instance.contact,
    };
