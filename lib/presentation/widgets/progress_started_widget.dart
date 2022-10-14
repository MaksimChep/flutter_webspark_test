import 'dart:async';

import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ProgressStartedWidget extends StatefulWidget {
  const ProgressStartedWidget({Key? key}) : super(key: key);

  @override
  State<ProgressStartedWidget> createState() => _ProgressStartedWidgetState();
}

class _ProgressStartedWidgetState extends State<ProgressStartedWidget> {
  double percent = 0;

  late Timer timer;
  @override
  void initState() {
    /// A timer that is called every 1500 milliseconds.
    timer = Timer.periodic(const Duration(milliseconds: 1500), (_) {
      setState(() {
        percent += 0.1;
        if (percent >= 1.0) {
          timer.cancel();
          percent = 1.0;
        }
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Progress screen')),
        body: Center(
          child: CircularPercentIndicator(
            radius: 80,
            animation: true,
            animationDuration: 1500,
            percent: percent,
            header: Text('${(percent * 100).toStringAsFixed(0)}%',
                style: const TextStyle(fontSize: 20)),
          ),
        ));
  }
}
