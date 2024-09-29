

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:stock_wishlist/models/search_result_model.dart';
import 'package:stock_wishlist/models/watchlist_model.dart';
import 'package:stock_wishlist/utils/functions.dart';
import 'package:stock_wishlist/views/widgets_components/scaffold_messenger.dart';

class WatchListController {

  Future<void> addStockToWatchList(StockWatchListModel stockWishList , BuildContext context)async{

    final stockWishListdb = await Hive.openBox<StockWatchListModel>('stock_wishList');

    var dbvalues = stockWishListdb.values.toList();
    var tickers = [];
    for(var i in dbvalues){
      tickers.add(i.ticker);
    }
    if(!tickers.contains(stockWishList.ticker)){
      stockWishListdb.add(stockWishList).then((_){
        ScaffoldMessenger.of(context).showSnackBar(scaffoldMessenger(color: Colors.green, message: "Added to WatchList"));
      });
      debugPrint(stockWishList.ticker);
    }else{
      if(context.mounted){
         ScaffoldMessenger.of(context).showSnackBar(scaffoldMessenger(color: const Color.fromARGB(255, 255, 38, 0) , message: "Already added to WatchList"));
      }
     
      debugPrint('stock already added to watchlist');
    }
     

    
  }


  Future<List<StockWatchListModel>> deleteStockFromWatchList({required int index ,required BuildContext context})async{
     final stockWishListdb = await Hive.openBox<StockWatchListModel>('stock_wishList');
     stockWishListdb.deleteAt(index).then((_){
       ScaffoldMessenger.of(context).showSnackBar(scaffoldMessenger(color: const Color.fromARGB(255, 255, 38, 0) , message: "Remove successfully"));
     });

     var result = await getAllWatchList();
     debugPrint(result.toString());
     return result;
  }

 


  Future<void> addStockFromSearch({required SearchResultModel searchResultModel}) async{

    var symbol = searchResultModel.symbol;
    
    final stockWishListdb = await Hive.openBox<StockWatchListModel>('stock_wishList');

    final uri = Uri.parse('https://www.alphavantage.co/query?function=TIME_SERIES_DAILY&symbol=$symbol&apikey=3UZY3BYBDJQO28WF');

    
   }
}