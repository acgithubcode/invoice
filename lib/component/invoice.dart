import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../constant.dart';
import 'invoice_body.dart';

DateTime now = DateTime.now();

String formattedDate = DateFormat('kk:mm:ss \n EEE d MMM').format(now);

class Invoice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenConfig.init(context);
    return SingleChildScrollView(
      child: Column(
        children: [invoiceHeader(), InvoiceBody()],
      ),
    );
  }

  Widget invoiceHeader() {
    return Container(
      width: 700,
      height: 350,
      color: Color(0xFF4D4F52),
      padding: EdgeInsets.only(
        top: 50.0,
        left: 40.0,
        right: 40.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Invoice",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 46,
                  )),

              SizedBox(
                height: 20.0,
              ),
              // TODO: form get actual date and format it accondingly
              topHeaderText(formattedDate),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.receipt_long_outlined,
                    size: 50.0,
                  ),
                  // Image.asset(
                  //   "assets/icons/icons8-receipt.png",
                  //   height: ScreenConfig.getProportionalHeight(78),
                  // ),
                  addressColumn()
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  Column addressColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Address",
          style: TextStyle(
              fontWeight: FontWeight.bold, letterSpacing: 2, fontSize: 30.0),
        ),
        SizedBox(
          height: 10,
        ),
        Text("sector 5",
            style: TextStyle(
                fontWeight: FontWeight.bold, letterSpacing: 2, fontSize: 20.0)),
        SizedBox(
          height: 10,
        ),
        Text(
          "ghansoli",
          style: TextStyle(
              fontWeight: FontWeight.bold, letterSpacing: 2, fontSize: 20.0),
        )
      ],
    );
  }

  Text topHeaderText(String label) {
    return Text(label,
        style: TextStyle(color: Colors.white.withOpacity(0.6), fontSize: 16.0));
  }
}
