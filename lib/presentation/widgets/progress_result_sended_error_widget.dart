import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_webspark_test/bloc/progress/progress_bloc.dart';

class ProgressResultSendedErrorWidget extends StatelessWidget {
  const ProgressResultSendedErrorWidget({Key? key, required this.error})
      : super(key: key);
  final String error;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Progress screen')),
        body: Center(
            child: Text(
          error,
          style: const TextStyle(fontSize: 20),
          textAlign: TextAlign.center,
        )),
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
                  'Send results to server again',
                  style: TextStyle(fontWeight: FontWeight.bold),
                )))));
  }
}
