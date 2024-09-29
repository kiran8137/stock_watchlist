
import 'package:hive/hive.dart';
import 'package:stock_wishlist/models/watchlist_model.dart';

Future<List<StockWatchListModel>> getAllWatchList()async{
    
    final stockWishListdb = await Hive.openBox<StockWatchListModel>('stock_wishList');
    return stockWishListdb.values.toList();
} 