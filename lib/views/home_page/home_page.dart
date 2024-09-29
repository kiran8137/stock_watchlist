import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:stock_wishlist/controllers/api_controller.dart';
import 'package:stock_wishlist/models/search_result_model.dart';
import 'package:stock_wishlist/models/watchlist_model.dart';
import 'package:stock_wishlist/utils/constants.dart';
import 'package:stock_wishlist/views/statemanagment/stock_provider.dart';
import 'package:stock_wishlist/views/statemanagment/watchlist_provider.dart';
import 'package:stock_wishlist/views/widgets_components/company_detail_widget.dart';
import 'package:stock_wishlist/views/widgets_components/search_result_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    Provider.of<StockProvider>(context, listen: false).fetchMostActiveTrade();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: GestureDetector(
          onTap: () async {
            // Provider.of<StockProvider>(context ,listen: false).fetchMostActiveTrade();
          },
          child: Text(
            'Home',
            style: GoogleFonts.fredoka(),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: 50,
              child: TextFormField(
                onChanged: (String value) {
                  if (value.isEmpty) {
                    Provider.of<StockProvider>(context, listen: false)
                        .fetchMostActiveTrade();
                  } else {
                    Provider.of<StockProvider>(context, listen: false)
                        .searchStockDetails(query: value);
                  }
                },
                decoration: const InputDecoration(
                    hintText: 'Search...',
                    hintStyle: TextStyle(fontWeight: FontWeight.w400),
                    border: OutlineInputBorder()),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: Consumer<StockProvider>(
                builder: (context, value, child) {
                  if(value.searchStocks.isNotEmpty){
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
                          onTap: (){

                          },
                          );
                        
                        
                      },
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 15),
                      itemCount:  value.searchStocks.length),
                    );
                  }else if(value.companyStock.isEmpty){
                   return  const Center(child: Text('Some Thing went wrong ,try after sometime'));
                  }else{
                    return 
                     SizedBox(
                  width: double.infinity,

                  //color: Colors.blue,
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
                }
                // SizedBox(
                //   width: double.infinity,

                //   //color: Colors.blue,
                //   child:
                //   value.companyStock.isEmpty? 
                //    const Center(child: Text('Some Thing went wrong ,try after sometime')
                //    ):
                //    ListView.separated(
                //       itemBuilder: (context, index) {
                //         final stock =  value.companyStock[index];
                         
                //         return   
                //         CompanyDetailWidget(
                //           onTap: () {
                //             final stockWatchList = StockWatchListModel(
                //                 ticker: stock.ticker,
                //                 price: stock.price,
                //                 changeAmount: stock.changeAmount,
                //                 changePercentage: stock.changePercentage,
                //                 volume: stock.volume);
                //             Provider.of<WatchlistProvider>(context,
                //                     listen: false)
                //                 .addToWatchListDb(
                //                     stockWatchList: stockWatchList,
                //                     context: context
                //                     );
                //           },
                //           icon: Icons.add_circle,
                //           iconSize: 40,
                //           stock: stock,
                //         );
                        
                //       },
                //       separatorBuilder: (context, index) =>
                //           const SizedBox(height: 15),
                //       itemCount:  value.companyStock.length),
                // ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
