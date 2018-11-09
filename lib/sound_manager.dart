import 'dart:async';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:flutter/services.dart' show rootBundle;

class SoundManager {
  Future playLocal(localFileName) async {
    final dir = await getApplicationDocumentsDirectory();
    final file = new File("${dir.path}/voice.m4a");
    if (!(await file.exists())) {
      final soundData = await rootBundle.load("assets/voice.m4a");
      final bytes = soundData.buffer.asUint8List();
      await file.writeAsBytes(bytes, flush: true);
    }
  }
}
