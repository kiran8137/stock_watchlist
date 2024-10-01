
class SearchResultModel {
  final String symbol;
  final String name;
  
   

  SearchResultModel({required this.symbol, required this.name,});

  factory SearchResultModel.fromJson(Map<String , dynamic> data){
    return SearchResultModel(
      symbol: data["1. symbol"], 
      name: data["2. name"]
      );
  }

}