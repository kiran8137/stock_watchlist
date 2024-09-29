
import 'package:flutter/material.dart';
import 'package:stock_wishlist/controllers/api_controller.dart';
import 'package:stock_wishlist/models/search_result_model.dart';
import 'package:stock_wishlist/models/stock_model.dart';

class StockProvider extends ChangeNotifier{
ApiService apiService;

StockProvider(this.apiService);

  List<StockModel> companyStock = [];

  List<SearchResultModel> searchStocks = [];

  bool isSearchEnable = false;


  Future<void> fetchMostActiveTrade() async{
    var result = await apiService.fetchMostActiveTrade();
    companyStock.addAll(result);
    notifyListeners();
  }

  Future<void> searchStockDetails({required String query}) async{
    if(query.isEmpty){
      searchStocks = [];
    }else{
    var searchResult = await apiService.searchStocks(query: query );
    companyStock.clear();
    searchStocks.addAll(searchResult);
    changeSearchEnable();
    notifyListeners();
    }
   
  }

  void changeSearchEnable(){
    isSearchEnable = !isSearchEnable;
    notifyListeners();
  }

}