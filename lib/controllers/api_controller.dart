
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:stock_wishlist/models/search_result_model.dart';
import 'package:stock_wishlist/models/stock_model.dart';
import 'package:http/http.dart' as http;

class ApiService{

   Future <List<StockModel>> fetchMostActiveTrade () async{
     
     try{
      final uri = Uri.parse("https://www.alphavantage.co/query?function=TOP_GAINERS_LOSERS&apikey=3UZY3BYBDJQO28WF");
      final response = await http.get(uri);

      

      if(response.statusCode == 200){
        
       final body = jsonDecode(response.body);
       if(body['top_gainers'] == null){
        return [];
       }else{
           final decodedData = jsonDecode(response.body)["top_gainers"] as List;
          final output = decodedData.map((data)=> StockModel.fromJson(data)).toList();
          debugPrint(output[0].ticker);
          return output;

       }

      }else{
        throw Exception('failed to get');
      }
      
     }catch(error){
        log(error.toString());
        throw Exception(error);
     }
   }


   Future<List<SearchResultModel>> searchStocks({String? query}) async{
    String? searchQuery = query!.toLowerCase();
     
    final uri = Uri.parse("https://www.alphavantage.co/query?function=SYMBOL_SEARCH&keywords=$searchQuery&apikey=3UZY3BYBDJQO28WF");
    final response = await http.get(uri);

    if(response.statusCode == 200){
       

      final decodedData = jsonDecode(response.body);
      if(decodedData["bestMatches"] == null){
        return [];
      }else{
         final decodedData = jsonDecode(response.body)["bestMatches"] as List;
         final output = decodedData.map((data)=> SearchResultModel.fromJson(data)).toList();
      //debugPrint(output.);
      for(var i in output){
        debugPrint(i.symbol);
      }
      return output;
      }
      

    }else{
      throw Exception();
    }
   }


  // Future<StockModel> getCompanyStock({required String })
   
}

 