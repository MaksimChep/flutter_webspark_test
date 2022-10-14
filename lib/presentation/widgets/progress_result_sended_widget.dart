import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ProgressResultSendedWidget extends StatelessWidget {
  const ProgressResultSendedWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Progress screen')),
        body: Center(
          child: CircularPercentIndicator(
            radius: 80,
            animation: true,
            animationDuration: 1500,
            percent: 1.0,
            header: const Text(
              'All calculation has finished, you can send your results to server \n 100%',
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        floatingActionButton: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            height: 50,
            decoration: BoxDecoration(
                color: Colors.grey, borderRadius: BorderRadius.circular(10)),
            child: const Center(
                child: Text(
              'Send results to server',
              style: TextStyle(fontWeight: FontWeight.bold),
            ))));
  }
}
