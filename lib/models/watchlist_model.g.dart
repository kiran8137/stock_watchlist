// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'watchlist_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StockWatchListModelAdapter extends TypeAdapter<StockWatchListModel> {
  @override
  final int typeId = 1;

  @override
  StockWatchListModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return StockWatchListModel(
      ticker: fields[0] as String?,
      price: fields[1] as String?,
      changeAmount: fields[2] as String?,
      changePercentage: fields[3] as String?,
      volume: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, StockWatchListModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.ticker)
      ..writeByte(1)
      ..write(obj.price)
      ..writeByte(2)
      ..write(obj.changeAmount)
      ..writeByte(3)
      ..write(obj.changePercentage)
      ..writeByte(4)
      ..write(obj.volume);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StockWatchListModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
