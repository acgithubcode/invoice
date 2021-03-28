import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:invoice/screen/info.dart';
// import 'package:inovice/component/invoice.dart';
// import 'package:invoice/screen/PackageForm.dart';
import 'package:invoice/screen/pdf.dart';
import 'package:shimmer/shimmer.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New Revo Solution"),
      ),
      body: Column(
        children: [
          SizedBox(
            width: 200.0,
            height: 100.0,
            child: Shimmer.fromColors(
                baseColor: Colors.purple[300],
                highlightColor: Colors.blue,
                child: Image(image: AssetImage('images/NewRevo_logo.png'))),
          ),
          SizedBox(
            height: 350.0,
          ),
          Center(
              child: ElevatedButton(
            child: Text("Generate invoice"),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => PdfPreview()));
            },
          ))
        ],
      ),
    );
  }
}

class BottomNavigation extends StatefulWidget {
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _page = 0;
  GlobalKey _bottomNavigationKey = GlobalKey();
  final List<Widget> _childrenA = [HomeScreen(), PdfPreview(), Info()];

  void ontappedBar(int index) {
    setState(() {
      _page = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _childrenA[_page],
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        height: 70,
        color: Color(0xFF0D3C5C),
        backgroundColor: Colors.transparent,
        buttonBackgroundColor: Color(0xFFEE2D33),
        items: <Widget>[
          Icon(
            Icons.home,
            size: 30.0,
            color: Colors.white,
          ),
          Icon(
            Icons.chat,
            size: 30.0,
            color: Colors.white,
          ),
          Icon(
            Icons.verified_user,
            size: 30.0,
            color: Colors.white,
          ),
        ],
        onTap: ontappedBar,
      ),
    );
  }
}
