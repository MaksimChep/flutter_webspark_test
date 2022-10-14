import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_webspark_test/bloc/progress/progress_bloc.dart';
import 'package:flutter_webspark_test/presentation/widgets/progress_finished_widget.dart';
import 'package:flutter_webspark_test/presentation/widgets/progress_result_sended_error_widget.dart';
import 'package:flutter_webspark_test/presentation/widgets/progress_result_sended_widget.dart';
import 'package:flutter_webspark_test/presentation/widgets/progress_started_widget.dart';

class ProgressScreen extends StatefulWidget {
  const ProgressScreen({Key? key}) : super(key: key);

  @override
  State<ProgressScreen> createState() => _ProgressScreenState();
}

class _ProgressScreenState extends State<ProgressScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProgressBloc, ProgressState>(builder: (context, state) {
      if (state is ProgressInitial) {
        context.read<ProgressBloc>().add(ProgressInitiated());
        return Container();
      } else if (state is ProgressStarted) {
        return const ProgressStartedWidget();
      } else if (state is ProgressFinished) {
        return const ProgressFinishedWidget();
      } else if (state is ProgressError) {
        return Center(
          child: Text(state.error),
        );
      } else if (state is ProgressResultSended) {
        return const ProgressResultSendedWidget();
      } else if (state is ProgressResultSendingFinished) {
        context
            .read<ProgressBloc>()
            .add(ProgressSendingFinished(context: context));
        return const ProgressFinishedWidget();
      } else if (state is ProgressResultSendedError) {
        return ProgressResultSendedErrorWidget(error: state.error);
      }
      return Container();
    });
  }
}
