import 'package:flutter/material.dart';

import 'services/storage.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController tx = TextEditingController();
  final SecureStorage secureStorage = SecureStorage();
  @override
  void initState() {
    super.initState();

    init();
  }

  Future init() async {
    final name = await secureStorage.readSecureData() ?? '';
    setState(() {
      this.tx.text = name;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello"),
      ),
      body: Center(
        child: Column(
          children: [
            TextField(
              controller: tx,
              decoration: InputDecoration(hintText: "Enter Text"),
            ),
            ElevatedButton(
              onPressed: () async {
                await secureStorage.writeSecureData(tx.text);
                print(tx.text);
              },
              child: Text("text"),
            ),
          ],
        ),
      ),
    );
  }
}
