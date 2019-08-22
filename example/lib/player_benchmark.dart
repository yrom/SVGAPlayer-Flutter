import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

import 'main.dart';

/// flutter run --release lib/player_benchmark.dart
void main() async {
  await benchmarkWidgets((tester) async {
    final Stopwatch timer = new Stopwatch()..start();
    await tester.pumpWidget(new TestApp());
    for (int index = 0; index < 1000; index += 1) {
      await tester.pump();
    }
    timer.stop();
    debugPrint('Time taken: ${timer.elapsedMilliseconds}ms');
  });
}

class TestApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.dark(),
        home: SVGASampleScreen(name: "Test", image: "assets/angel.svga"));
  }
}
