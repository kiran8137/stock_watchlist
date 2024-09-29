import 'package:flutter/material.dart';
 
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:stock_wishlist/controllers/api_controller.dart';
import 'package:stock_wishlist/controllers/hive_database_controller.dart';
import 'package:stock_wishlist/models/watchlist_model.dart';
import 'package:stock_wishlist/views/home_page/home_page.dart';
import 'package:stock_wishlist/views/main_page.dart';
import 'package:stock_wishlist/views/statemanagment/stock_provider.dart';
import 'package:stock_wishlist/views/statemanagment/watchlist_provider.dart';

void main() async {
  await Hive.initFlutter();
  WidgetsFlutterBinding.ensureInitialized();

  if(!Hive.isAdapterRegistered(StockWatchListModelAdapter().typeId)){
    Hive.registerAdapter(StockWatchListModelAdapter());
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(

      providers:[ 
        ChangeNotifierProvider(
        create: (context) => StockProvider(ApiService())),
         ChangeNotifierProvider(
        create: (context) => WatchlistProvider(WatchListController()))
      ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            
            
          ),
          home: const MainPage(),
        ),
      
    );
  }
}

 