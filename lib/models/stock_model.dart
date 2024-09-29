class StockModel {
  final String? ticker;
  final String? price;
  final String? changeAmount;
  final String? changePercentage;
  final String? volume;

  StockModel(
      {  this.ticker,
        this.price,
        this.changeAmount,
        this.changePercentage,
        this.volume});


     factory StockModel.fromJson(Map<String , dynamic> data){
      return StockModel(
        ticker: data["ticker"], 
        price: data["price"], 
        changeAmount: data["change_amount"], 
        changePercentage: data["change_percentage"],
         volume: data["volume"]
         );
     }

     String get stockprice => price!;
}

 