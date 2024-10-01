import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stock_wishlist/views/home_page/components.dart';
import 'package:stock_wishlist/views/statemanagment/stock_provider.dart';

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
      appBar: commanAppBar('Home'), //extracted as function components
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
                   return searchStockList(value); // List of Searhed Stocks displays in the UI
                  }else if(value.companyStock.isEmpty){
                   return  const Center(child: Text('Some Thing went wrong ,try after sometime'));
                  }else{
                    return 
                     trendingStockList(value);
                  }
                }
                
              ),
            )
          ],
        ),
      ),
    );
  }

  
 
}
