import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:stock_wishlist/utils/constants.dart';
import 'package:stock_wishlist/views/statemanagment/watchlist_provider.dart';
import 'package:stock_wishlist/views/widgets_components/company_detail_widget.dart';

class WatchListPage extends StatefulWidget {
  const WatchListPage({super.key});

  @override
  State<WatchListPage> createState() => _WatchListPageState();
}

class _WatchListPageState extends State<WatchListPage> {

  @override
  void initState() {
    Provider.of<WatchlistProvider>(context ,listen: false).getAllStocksFromWatchList();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'WatchList',
          style: GoogleFonts.fredoka(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Text(
              'Saved Stock',
              style: GoogleFonts.nunitoSans(
                  fontSize: 20, color: const Color.fromARGB(255, 92, 92, 92)),
            ),
            const Divider(
              color: primaryColor,
            ),
            const SizedBox(height: 5),
            Expanded(
              child: Consumer<WatchlistProvider>(
                builder: (context, value, child) => SizedBox(
                  width: double.infinity,
                  child: value.stockWatchLists.isEmpty ?
                  const Center(
                    child: Text('No stock added to watchlist')):
                  ListView.separated(
                  
                      itemBuilder: (context, index) {
                        final stock = value.stockWatchLists[index];
                        return Container(
                          height: 70,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: primaryColor),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${stock.ticker}',
                                      style: GoogleFonts.notoSans(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text('Stock Price : \$${stock.price}')
                                  ],
                                ),
                                GestureDetector(
                                  onTap: () async{
                                    showDialog(
                                      context: context, 
                                      builder: (context){
                                        return AlertDialog(
                                          title: const Text('Are you sure want to delete',
                                          style: TextStyle(fontSize: 18),
                                          ),
                                          actions: [
                                           GestureDetector(
                                            onTap: (){
                                              Navigator.pop(context);
                                            },
                                            child: const Text('Cancel'),

                                           ),
                                            const SizedBox(width: 10,),
                                            GestureDetector(
                                            onTap: (){
                                              Provider.of<WatchlistProvider>(context,listen: false).deleteStockFromWatchList(index: index ,context: context);
                                              Navigator.pop(context);
                                            },
                                            child: const Text('Ok'),

                                           )
                                          ],
                                        );
                                      }
                                      );
                                    //Provider.of<WatchlistProvider>(context,listen: false).deleteStockFromWatchList(index: index);
                                  },
                                  child: const Icon(
                                    Icons.delete,
                                    size: 30,
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                        // CompanyDetailWidget(icon: Icons.delete,iconSize: 30, stock: stock,);
                      },
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 15),
                      itemCount: value.stockWatchLists.length
                      ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
