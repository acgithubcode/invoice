import 'package:flutter/material.dart';

class Info extends StatefulWidget {
  @override
  _InfoState createState() => _InfoState();
}

class _InfoState extends State<Info> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New Revo Solution"),
      ),
      body: ListView(
        children: [
          Card(
            clipBehavior: Clip.antiAlias,
            child: Column(
              children: [
                ListTile(
                  leading: Icon(Icons.arrow_drop_down_circle),
                  title: const Text('NRS1'),
                  subtitle: Text(
                    'Package Detail',
                    style: TextStyle(color: Colors.black.withOpacity(0.6)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'static',
                    style: TextStyle(color: Colors.black.withOpacity(0.6)),
                  ),
                ),
                ButtonBar(
                  alignment: MainAxisAlignment.start,
                  children: [
                    FlatButton(
                      onPressed: () {
                        // Perform some action
                      },
                      // child: const Text('ACTION 1'),
                    ),
                    FlatButton(
                      onPressed: () {
                        // Perform some action
                      },
                      // child: const Text('ACTION 2'),
                    ),
                  ],
                ),
                Image.asset('images/NewRevo_logo.png'),
              ],
            ),
          ),
          Card(
            clipBehavior: Clip.antiAlias,
            child: Column(
              children: [
                ListTile(
                  leading: Icon(Icons.arrow_drop_down_circle),
                  title: const Text('NRS2'),
                  subtitle: Text(
                    'Package Detail',
                    style: TextStyle(color: Colors.black.withOpacity(0.6)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Dynamic',
                    style: TextStyle(color: Colors.black.withOpacity(0.6)),
                  ),
                ),
                ButtonBar(
                  alignment: MainAxisAlignment.start,
                  children: [
                    FlatButton(
                        // onPressed: () {
                        //   // Perform some action
                        // },
                        // child: const Text('ACTION 1'),
                        ),
                    FlatButton(
                        // onPressed: () {
                        //   // Perform some action
                        // },
                        // child: const Text('ACTION 2'),
                        ),
                  ],
                ),
                Image.asset('images/NewRevo_logo.png'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
