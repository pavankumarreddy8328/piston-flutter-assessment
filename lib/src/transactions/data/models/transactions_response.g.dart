// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transactions_response.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TransactionResponseAdapter extends TypeAdapter<TransactionResponse> {
  @override
  final int typeId = 1;

  @override
  TransactionResponse read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TransactionResponse(
      transactions: (fields[0] as List).cast<Transaction>(),
    );
  }

  @override
  void write(BinaryWriter writer, TransactionResponse obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.transactions);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TransactionResponseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
