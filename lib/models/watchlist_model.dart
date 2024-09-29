
import 'package:hive_flutter/adapters.dart';
part 'watchlist_model.g.dart';

@HiveType(typeId : 1)
class StockWatchListModel{

   @HiveField(0)
  final String? ticker;

   @HiveField(1)
  final String? price;

   @HiveField(2)
  final String? changeAmount;

   @HiveField(3)
  final String? changePercentage;

   @HiveField(4)
  final String? volume;

   StockWatchListModel(
      {  this.ticker,
        this.price,
        this.changeAmount,
        this.changePercentage,
        this.volume});
}