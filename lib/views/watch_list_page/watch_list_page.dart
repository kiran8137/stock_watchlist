import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:stock_wishlist/utils/constants.dart';
import 'package:stock_wishlist/views/home_page/components.dart';
import 'package:stock_wishlist/views/statemanagment/watchlist_provider.dart';
import 'package:stock_wishlist/views/watch_list_page/components.dart';

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
      appBar:  commanAppBar('WatchList'),
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
                builder: (context, value, child) => stockWatchList(value),
              ),
            )
          ],
        ),
      ),
    );
  }

  
}
