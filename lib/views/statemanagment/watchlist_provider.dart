

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:stock_wishlist/controllers/hive_database_controller.dart';
import 'package:stock_wishlist/models/watchlist_model.dart';
import 'package:stock_wishlist/utils/functions.dart';

class WatchlistProvider extends ChangeNotifier{
  WatchListController watchListController;

  WatchlistProvider(this.watchListController); 

  List<StockWatchListModel> stockWatchLists = [];


  Future<void> addToWatchListDb({required StockWatchListModel stockWatchList , required BuildContext context}) async{
      watchListController.addStockToWatchList(stockWatchList , context);
      var stocksInWishList = await getAllWatchList();
    stockWatchLists.addAll(stocksInWishList);
    notifyListeners();

  }

  Future<void> getAllStocksFromWatchList() async{
    stockWatchLists.clear();
    var stocksInWishList = await getAllWatchList();
    stockWatchLists.addAll(stocksInWishList);
    notifyListeners();
  }

  Future<void> deleteStockFromWatchList({required int index , required BuildContext context}) async{
    var result = await watchListController.deleteStockFromWatchList(index: index , context: context );
    stockWatchLists.clear();
    //var stocksInWishList = await getAllWatchList();
    stockWatchLists.addAll(result);
    notifyListeners();
  }
}