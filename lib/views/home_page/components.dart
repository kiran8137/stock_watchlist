

 import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:stock_wishlist/controllers/hive_database_controller.dart';
import 'package:stock_wishlist/models/search_result_model.dart';
import 'package:stock_wishlist/models/watchlist_model.dart';
import 'package:stock_wishlist/views/statemanagment/stock_provider.dart';
import 'package:stock_wishlist/views/statemanagment/watchlist_provider.dart';
import 'package:stock_wishlist/views/widgets_components/company_detail_widget.dart';
import 'package:stock_wishlist/views/widgets_components/search_result_widget.dart';


//common app bar 
AppBar commanAppBar(String title) {
    return AppBar(
      backgroundColor: Colors.white,
      centerTitle: true,
      title: Text(
        title,
        style: GoogleFonts.fredoka(),
      ),
    );
  }


//List of searched stock list result 
SizedBox searchStockList(StockProvider value) {
    return SizedBox(
                    width: double.infinity,
                    child: 
                     ListView.separated(
                    itemBuilder: (context, index) {
                      final stock =  value.searchStocks[index];
                       
                      return SearchResultWidget(
                        icon: Icons.add_circle, 
                        iconSize: 30, 
                        stock: stock,
                        onTap: () async{
                        final searchedStock = SearchResultModel(symbol: stock.symbol, name: stock.name);
                         await  addStockFromSearch(searchResultModel: searchedStock);
                        },
                        );
                      
                      
                    },
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 15),
                    itemCount:  value.searchStocks.length),
                  );
  }

//List of trending stock list at initial
SizedBox trendingStockList(StockProvider value) {
    return SizedBox(
                width: double.infinity,

                
                child:
                value.companyStock.isEmpty? 
                 const Center(child: Text('Some Thing went wrong ,try after sometime')
                 ):
                 ListView.separated(
                    itemBuilder: (context, index) {
                      final stock =  value.companyStock[index];
                       
                      return   
                      CompanyDetailWidget(
                        onTap: () {
                          final stockWatchList = StockWatchListModel(
                              ticker: stock.ticker,
                              price: stock.price,
                              changeAmount: stock.changeAmount,
                              changePercentage: stock.changePercentage,
                              volume: stock.volume);
                          Provider.of<WatchlistProvider>(context,
                                  listen: false)
                              .addToWatchListDb(
                                  stockWatchList: stockWatchList,
                                  context: context
                                  );
                        },
                        icon: Icons.add_circle,
                        iconSize: 40,
                        stock: stock,
                      );
                      
                    },
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 15),
                    itemCount:  value.companyStock.length),
              );
  }

  
