// import 'dart:js';

import 'package:flutter/material.dart';
import 'package:invoice/screen/PackageForm.dart';

import '../constant.dart';

class InvoiceBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // var totalAmount = 64;
    // double height =
    //     ScreenConfig.deviceHeight - ScreenConfig.getProportionalHeight(600);
    return Container(
      height: 600.0,
      padding: EdgeInsets.symmetric(horizontal: 40.0),
      color: iPrimarryColor,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 27.0,
            ),
            addItemAction(),
            SizedBox(
              height: 40.0,
            ),
            Column(
              children: [
                Container(
                  height: 150.0,
                  width: 300.0,
                  // padding: EdgeInsets.symmetric(horizontal: 27.0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(0, 11),
                            blurRadius: 11,
                            color: Colors.black.withOpacity(0.06))
                      ],
                      borderRadius: BorderRadius.circular(6)),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Text(
                      //   quantity.toString(),
                      //   style: TextStyle(
                      //       color: Colors.black.withOpacity(0.6),
                      //       fontWeight: FontWeight.bold),
                      // ),
                      // Image.asset(imagePath),

                      Center(
                        child: Text(
                          "Bronze package",
                          style: TextStyle(color: Colors.black, fontSize: 16.0),
                        ),
                      ),
                      Center(
                        child: Text(
                          "25000",
                          style: TextStyle(
                              color: Colors.black.withOpacity(0.6),
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0),
                        ),
                      ),
                      // Text(
                      //   "\$$totalValue",
                      //   style: TextStyle(
                      //       color: Colors.black,
                      //       fontWeight: FontWeight.bold,
                      //       fontSize: 16.0),
                      // )
                    ],
                  ),
                )
              ],
            ),
            // invoiceTotal(totalAmount),
            SizedBox(
              height: 56.0,
            ),
          ],
        ),
      ),
    );
  }

  // Row invoiceTotal(int totalAmount) {
  //   return Row(
  //     mainAxisAlignment: MainAxisAlignment.end,
  //     children: [
  //       Row(
  //         children: [
  //           Text("Total: ",
  //               style: TextStyle(
  //                 color: Colors.black.withOpacity(0.6),
  //                 fontWeight: FontWeight.bold,
  //                 fontSize: 16.0,
  //               )),
  //           SizedBox(
  //             width: 50.0,
  //           ),
  //           Text(
  //             "\$$totalAmount",
  //             style: TextStyle(
  //                 color: Colors.black,
  //                 fontWeight: FontWeight.bold,
  //                 fontSize: 16.0),
  //           )
  //         ],
  //       )
  //     ],
  //   );
  // }

  Row addItemAction() {
    return Row(
      children: [
        Text("Package", style: TextStyle(color: Colors.black, fontSize: 30.0)),
        SizedBox(
          width: 50.0,
        ),
        // FlatButton(
        //   color: iAccentColor2,
        //   shape:
        //       RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        //   child: Row(
        //     children: [Icon(Icons.add), Text("Add items")],
        //   ),
        //   onPressed: () {},
        // )
      ],
    );
  }
}
