
 import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

SnackBar scaffoldMessenger({required Color color , required String message }) {
    return SnackBar(
              content: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Text(
                        message,
                        style: GoogleFonts.aBeeZee(fontSize: 15),
                        ),
                  ),
                ),
              ),
              behavior: SnackBarBehavior.floating,
              backgroundColor: Colors.transparent,
              elevation: 0,
            );
  }