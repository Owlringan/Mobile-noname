import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/services.dart' show rootBundle;

class SoundManager extends StatelessWidget {
  String bytestr = "asd";
  Future playLocal(localFileName) async {
    final dir = await getApplicationDocumentsDirectory();
    final file = new File("${dir.path}/voice.m4a");
    print("hello");
    if ((await file.exists())) {
      final soundData = await rootBundle.load("assets/voice.m4a");
      final bytes = soundData.buffer.asUint8List();
      bytestr = new String.fromCharCodes(bytes);
      if (bytestr == null) bytestr = "sad";
      print(bytes);
      await file.writeAsBytes(bytes, flush: true);
    }
  }

  @override
  Widget build(BuildContext context) {
    playLocal("asd");
    print(bytestr);
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Sound'),
        ),
        body: ListView(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 24.0, bottom: 16.0),
                  child: Text(
                    bytestr,
                    style: TextStyle(
                      fontSize: 48.0,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
