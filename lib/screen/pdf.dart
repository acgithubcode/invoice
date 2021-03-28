import 'dart:io';
import 'dart:math';
import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:open_file/open_file.dart';
import 'package:path/path.dart';

import 'package:firebase_storage/firebase_storage.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:flutter_full_pdf_viewer/flutter_full_pdf_viewer.dart';
// import 'package:printing/printing.dart';

class PdfPreview extends StatefulWidget {
  @override
  _PdfPreviewState createState() => _PdfPreviewState();
}

class _PdfPreviewState extends State<PdfPreview> {
  final _formKey = GlobalKey<FormState>();

  final name = TextEditingController();
  final companyname = TextEditingController();
  final packageName = TextEditingController();
  final email = TextEditingController();
  final phone = TextEditingController();
  final price = TextEditingController();
  final address = TextEditingController();
  final chaqueNo = TextEditingController();
  final bank = TextEditingController();

  FocusNode _nameFocusNode = FocusNode();
  FocusNode _emailFocusNode = FocusNode();
  FocusNode _passwordFocusNode = FocusNode();

  File file;

  var tableHeaders = ['Package', 'Price', 'chaque NO'];

  // var tableData = [packageName.text, price.text, chaqueNo.text];

  DateTime now = DateTime.now();
  // String formattedDate = DateFormat('kk:mm:ss \n EEE d MMM').format(Now);

  final doc = pw.Document();
  // var gstPrice = (price * 0.18) + price;

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    name.dispose();
    companyname.dispose();
    super.dispose();
  }

  writeonPdf(BuildContext context) async {
    doc.addPage(pw.Page(build: (pw.Context context) {
      return pw.Container(
          // color: pw.Colors.green,
          child: pw.Column(
              // mainAxisAlignment: pw.MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
            pw.Row(children: [
              pw.Expanded(
                  child: pw.Column(children: [
                pw.Container(
                    // height: 250.0,
                    padding: pw.EdgeInsets.only(left: 20.0),
                    // alignment: pw.Alignment.centerLeft,
                    child: pw.Center(
                      child: pw.Text("Invoice",
                          style: pw.TextStyle(
                            color: PdfColors.blue900,
                            fontWeight: pw.FontWeight.bold,
                            fontSize: 40,
                          )),
                    )),
                pw.Container(
                  child: pw.Column(
                    mainAxisSize: pw.MainAxisSize.max,
                    children: [
                      pw.Container(
                        margin: const pw.EdgeInsets.only(left: 10, right: 10),
                        height: 100.0,
                        alignment: pw.Alignment.centerLeft,
                        child: pw.Text(
                          'Invoice to:' + companyname.text,
                          style: pw.TextStyle(
                            color: PdfColors.blue900,
                            fontWeight: pw.FontWeight.bold,
                            fontSize: 40,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                pw.Container(
                    decoration: pw.BoxDecoration(color: PdfColors.teal800),
                    padding: pw.EdgeInsets.only(
                        left: 40.0, top: 0, bottom: 0, right: 20),
                    alignment: pw.Alignment.centerLeft,
                    height: 90.0,
                    child: pw.DefaultTextStyle(
                      style: pw.TextStyle(
                          color: PdfColors.teal200, fontSize: 20.0),
                      child: pw.GridView(
                        crossAxisCount: 2,
                        children: [
                          pw.Text('Package :',
                              style: pw.TextStyle(
                                fontWeight: pw.FontWeight.bold,
                                fontSize: 40,
                              )),
                          pw.Text(packageName.text,
                              style: pw.TextStyle(
                                fontWeight: pw.FontWeight.bold,
                                fontSize: 40,
                              )),
                          pw.Text('Date:',
                              style: pw.TextStyle(
                                fontWeight: pw.FontWeight.bold,
                                fontSize: 40,
                              )),
                          pw.Text(
                              now.day.toString() +
                                  "/" +
                                  now.month.toString() +
                                  "/" +
                                  now.year.toString(),
                              style: pw.TextStyle(
                                fontWeight: pw.FontWeight.bold,
                                fontSize: 40,
                              )),
                        ],
                      ),
                    )),
                pw.Container(
                    decoration: pw.BoxDecoration(color: PdfColors.blueGrey800),
                    padding: pw.EdgeInsets.only(
                        left: 40.0, top: 0, bottom: 0, right: 20),
                    alignment: pw.Alignment.centerLeft,
                    height: 90.0,
                    child: pw.DefaultTextStyle(
                      style: pw.TextStyle(
                          color: PdfColors.teal200, fontSize: 20.0),
                      child: pw.GridView(
                        crossAxisCount: 2,
                        children: [
                          pw.Text('Name:',
                              style: pw.TextStyle(
                                fontWeight: pw.FontWeight.bold,
                                fontSize: 40,
                              )),
                          pw.Text(name.text,
                              style: pw.TextStyle(
                                fontWeight: pw.FontWeight.bold,
                                fontSize: 40,
                              )),
                          pw.Text('Phone:',
                              style: pw.TextStyle(
                                fontWeight: pw.FontWeight.bold,
                                fontSize: 40,
                              )),
                          pw.Text(phone.text,
                              style: pw.TextStyle(
                                fontWeight: pw.FontWeight.bold,
                                fontSize: 40,
                              )),
                        ],
                      ),
                    )),
                pw.Container(
                    decoration: pw.BoxDecoration(color: PdfColors.teal800),
                    padding: pw.EdgeInsets.only(
                        left: 40.0, top: 0, bottom: 0, right: 20),
                    alignment: pw.Alignment.centerLeft,
                    height: 190.0,
                    child: pw.DefaultTextStyle(
                      style: pw.TextStyle(
                          color: PdfColors.teal200, fontSize: 20.0),
                      child: pw.GridView(
                        crossAxisCount: 2,
                        children: [
                          pw.Text('Email:',
                              style: pw.TextStyle(
                                fontWeight: pw.FontWeight.bold,
                                fontSize: 40,
                              )),
                          pw.Text(email.text,
                              style: pw.TextStyle(
                                fontWeight: pw.FontWeight.bold,
                                fontSize: 15,
                              )),
                          pw.Text('Cheque No:',
                              style: pw.TextStyle(
                                fontWeight: pw.FontWeight.bold,
                                fontSize: 40,
                              )),
                          pw.Text(chaqueNo.text,
                              style: pw.TextStyle(
                                fontWeight: pw.FontWeight.bold,
                                fontSize: 40,
                              )),
                          pw.Text('Bank:',
                              style: pw.TextStyle(
                                fontWeight: pw.FontWeight.bold,
                                fontSize: 40,
                              )),
                          pw.Text(bank.text,
                              style: pw.TextStyle(
                                fontWeight: pw.FontWeight.bold,
                                fontSize: 40,
                              )),
                          pw.Text('Price:',
                              style: pw.TextStyle(
                                fontWeight: pw.FontWeight.bold,
                                fontSize: 40,
                              )),
                          pw.Text(price.text,
                              style: pw.TextStyle(
                                fontWeight: pw.FontWeight.bold,
                                fontSize: 40,
                              )),
                        ],
                      ),
                    )),
              ]))
            ]),
          ]));
    }));

    var range = Random();
    String randomName = "";
    for (var i = 0; i < 20; i++) {
      print(range.nextInt(100));
      randomName += range.nextInt(100).toString();
    }

    var bytes = doc.save();
    Directory directory = await getExternalStorageDirectory();
    String path = directory.path;
    File file = File('$path/$randomName.pdf');
    await file.writeAsBytes(bytes, flush: true);
    OpenFile.open('$path/$randomName.pdf');

    StorageReference firebaseref =
        FirebaseStorage.instance.ref().child('$randomName');
    StorageUploadTask uploadTask = firebaseref.putFile(file);
    StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;
    setState(() {
      print("pdf uploaded");
      Scaffold.of(context)
          .showSnackBar(SnackBar(content: Text("pdf uploaded")));
    });
  }

  // FirebaseStorage _storage = FirebaseStorage.instance;

  Future savepdf(BuildContext context) async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String documentPath = documentDirectory.path;
    file = File("$documentPath/invoice.pdf");
    file.writeAsBytesSync(doc.save());

    var filename = basename(file.path);
    print('image  is $file');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Package Info"),
        ),
        body: SafeArea(
          top: false,
          bottom: false,
          child: Form(
            key: _formKey,
            // autovalidate: true,
            child: ListView(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
              ),
              children: <Widget>[
                TextFormField(
                  controller: name,
                  focusNode: _nameFocusNode,
                  autofocus: true,
                  decoration: const InputDecoration(
                    icon: const Icon(Icons.person),
                    hintText: 'Enter your first and last name',
                    labelText: 'Name',
                  ),
                  onSaved: (name) => name = name,
                ),
                TextFormField(
                  controller: companyname,
                  decoration: const InputDecoration(
                    icon: const Icon(Icons.store),
                    hintText: 'Enter your Company name',
                    labelText: 'Company Name',
                  ),
                ),
                TextFormField(
                  controller: packageName,
                  decoration: const InputDecoration(
                    icon: const Icon(Icons.request_page),
                    hintText: 'Enter Package Name',
                    labelText: 'Package',
                  ),
                  // keyboardType: TextInputType.datetime,
                ),
                TextFormField(
                  controller: phone,
                  decoration: const InputDecoration(
                    icon: const Icon(Icons.phone),
                    hintText: 'Enter a phone number',
                    labelText: 'Phone',
                  ),
                  keyboardType: TextInputType.phone,
                ),
                TextFormField(
                  controller: address,
                  decoration: const InputDecoration(
                    icon: const Icon(Icons.phone),
                    hintText: 'Enter address',
                    labelText: 'Address',
                  ),
                  // keyboardType: TextInputType.phone,
                ),
                TextFormField(
                  controller: email,
                  decoration: const InputDecoration(
                    icon: const Icon(Icons.email),
                    hintText: 'Enter a email address',
                    labelText: 'Email',
                  ),
                  validator: (email) => EmailValidator.validate(email)
                      ? null
                      : "Invalid email address",
                  onSaved: (email) => email = email,
                  keyboardType: TextInputType.emailAddress,
                ),
                TextFormField(
                  controller: chaqueNo,
                  decoration: const InputDecoration(
                    icon: const Icon(Icons.how_to_vote),
                    hintText: 'Enter Chaque Number',
                    labelText: 'Chaque no ',
                  ),
                ),
                TextFormField(
                  controller: bank,
                  decoration: const InputDecoration(
                    icon: const Icon(Icons.business),
                    hintText: 'Enter Bank Name',
                    labelText: 'Bank ',
                  ),
                ),
                TextFormField(
                  controller: price,
                  decoration: const InputDecoration(
                    icon: const Icon(Icons.payment),
                    hintText: 'Enter a package Price',
                    labelText: 'Price',
                  ),
                  keyboardType: TextInputType.phone,
                ),
                Container(
                    padding: const EdgeInsets.only(left: 40.0, top: 20.0),
                    child: RaisedButton(
                      child: const Text('Submit'),
                      onPressed: () async {
                        await writeonPdf(context);
                        // await savepdf(context);

                        //   Directory documentDirectory =
                        //       await getApplicationDocumentsDirectory();

                        //   String documentPath = documentDirectory.path;

                        //   String fullPath = "$documentPath/invoice.pdf";

                        //   Navigator.push(
                        //       context,
                        //       MaterialPageRoute(
                        //           builder: (context) =>
                        //               PdfPreviewScreen1(path: fullPath)));
                      },
                    )),
              ],
            ),
          ),
        ));
  }
}

class PdfPreviewScreen1 extends StatelessWidget {
  final String path;

  PdfPreviewScreen1({this.path});

  @override
  Widget build(BuildContext context) {
    return PDFViewerScaffold(
      appBar: AppBar(
        title: Text("Invoice"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {},
          ),
        ],
      ),
      path: path,
    );
  }
}
