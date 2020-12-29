import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class MyHomePage extends StatelessWidget {
  String get currentTine {
    var time = DateTime.now();
    var hour = time.hour.toString().padLeft(2, '0');
    var minute = time.minute.toString().padLeft(2, '0');
    var second = time.second.toString().padLeft(2, '0');
    return '$hour : $minute : $second';
  }

  Stream _stream() async* {
    yield* Stream.periodic(Duration(milliseconds: 100), (int x) {
      final xx =
          // (DateTime.now().second * 1000) + DateTime.now().millisecond / 60000;
          ((DateTime.now().second) / 60) + DateTime.now().millisecond / 60000;
      // print(xx.toString().padRight(30, ' ') + x.toString());
      return xx;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade900,
      body: StreamBuilder(
        // initialData: ,
        stream: _stream(),
        builder: (context, snapshot) {
          return Stack(
            children: [
              Center(
                child: Text(
                  currentTine,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.w900),
                ),
              ),
              Center(
                child: CircularPercentIndicator(
                  radius: 300,
                  lineWidth: 7,
                  percent: snapshot.data ?? 0,
                  backgroundColor: Colors.transparent,
                  addAutomaticKeepAlive: true,
                  animateFromLastPercent: true,
                  progressColor: Colors.amber,
                ),
              ),
              Center(
                child: CircularPercentIndicator(
                  radius: 270,
                  lineWidth: 7,
                  percent: snapshot.data ?? 0,
                  backgroundColor: Colors.transparent,
                  addAutomaticKeepAlive: true,
                  animateFromLastPercent: true,
                  progressColor: Colors.yellow,
                  // startAngle: 180,
                  circularStrokeCap: CircularStrokeCap.round,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
