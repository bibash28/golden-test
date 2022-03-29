import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_test/sun_flower_app.dart';

void main() {
  const rootKey = Key('root_sizeBox');

  Widget buildSubject(int seedCount) {
    return SizedBox(
      key: rootKey,
      width: 400,
      height: 400,
      child: CustomPaint(
        painter: SunflowerPainter(seedCount),
      ),
    );
  }

  group(
    'sunflowerPainter with matchesGoldenFile',
    () {
      testWidgets('matches expected output with 100 seeds', (tester) async {
        await tester.pumpWidget(buildSubject(100));
        await expectLater(
          find.byKey(rootKey),
          matchesGoldenFile('goldens/sunFlowerPainter_seedCount_100.png'),
        );
      });

      testWidgets('matches expected output with 20 seeds', (tester) async {
        await tester.pumpWidget(buildSubject(20));
        await expectLater(
          find.byKey(rootKey),
          matchesGoldenFile('goldens/sunFlowerPainter_seedCount_20.png'),
        );
      });

      testWidgets('matches expected output with 3000 seeds', (tester) async {
        await tester.pumpWidget(buildSubject(3000));
        await expectLater(
          find.byKey(rootKey),
          matchesGoldenFile('goldens/sunFlowerPainter_seedCount_3000.png'),
        );
      });
    },
  );
}
