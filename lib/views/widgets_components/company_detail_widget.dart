
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stock_wishlist/models/stock_model.dart';
import 'package:stock_wishlist/utils/constants.dart';

class CompanyDetailWidget extends StatelessWidget {
    const CompanyDetailWidget({
     
    super.key, required this.icon, required this.iconSize,  required this.stock, this.onTap,
  });

  final IconData  icon;
  final double iconSize;
  final StockModel stock;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: primaryColor
      ),
       
      child:   Padding(
        padding: EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
               crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${stock.ticker}',
                style: GoogleFonts.notoSans(
                  fontSize: 20,
                  fontWeight: FontWeight.w500
                ),
                ),
                Text('Stock Price : \$${stock.price}')
              ],
            ),
        
            GestureDetector(
              onTap: onTap,
              child: Icon(icon,
              size: iconSize,
              ),
            )
          ],
        ),
      ),
    );
  }
}