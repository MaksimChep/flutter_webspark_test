import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_webspark_test/bloc/progress/progress_bloc.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ProgressFinishedWidget extends StatelessWidget {
  const ProgressFinishedWidget({Key? key}) : super(key: key);

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
        floatingActionButton: InkWell(
            onTap: () {
              context.read<ProgressBloc>().add(ProgressSendResult());
            },
            child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: 50,
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: BorderRadius.circular(10)),
                child: const Center(
                    child: Text(
                  'Send results to server',
                  style: TextStyle(fontWeight: FontWeight.bold),
                )))));
  }
}
